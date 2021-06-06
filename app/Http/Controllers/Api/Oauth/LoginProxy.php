<?php

namespace App\Http\Controllers\Api\Oauth;

use App\Invoicer\Repositories\Contracts\CustomerInterface;
use App\Invoicer\Repositories\Contracts\GeneralSettingInterface;
use App\Invoicer\Repositories\Contracts\RoleInterface;
use App\Invoicer\Repositories\Contracts\UserInterface;
use App\Models\OauthClient;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use League\Flysystem\Exception;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;

class LoginProxy
{
    const REFRESH_TOKEN = 'refreshToken';
    protected $app;
    private $auth, $cookie, $db, $request, $userRepository, $roleRepository,
        $generalSettingRepository, $customerRepository;

    /**
     * LoginProxy constructor.
     * @param Application $app
     * @param UserInterface $userRepository
     * @param RoleInterface $roleRepository
     * @param GeneralSettingInterface $generalSettingRepository
     * @param CustomerInterface $customerRepository
     */
    public function __construct(Application  $app, UserInterface $userRepository,
                                RoleInterface $roleRepository,
                                GeneralSettingInterface $generalSettingRepository,
                                CustomerInterface $customerRepository) {
        $this->userRepository = $userRepository;
        $this->roleRepository = $roleRepository;
        $this->generalSettingRepository = $generalSettingRepository;
        $this->customerRepository = $customerRepository;
        $this->app = $app;
        $this->auth = $app->make('auth');
        $this->cookie = $app->make('cookie');
        $this->db = $app->make('db');
        $this->request = $app->make('request');
    }

    /**
     * Member has no roles (no permissions either) . So we fix their scope as 'member'
     * @param $email
     * @param $password
     * @return array|null
     */
    private function getMember($email, $password) {
        $user = $this->customerRepository->getViaEmail($email);
        //  Log::info($tenant);
        if (!is_null($user)) {
            $client = OauthClient::where('password_client', 1)
                ->where('provider', 'customers')
                ->latest()
                ->first();

            return [
                'user'      => $user,
                'client'    => $client,
                'scope'     => 'member'
            ];
        }
        return null;
    }

    /**
     * Admin has a role, which in turn got permissions.
     * So we fetch this user's role permissions and assign them to scopes variable
     * @param $email
     * @param $password
     * @return array|null
     */
    private function getAdmin($email, $password) {
        $user = $this->userRepository->getWhere('email', $email);
        if (!is_null($user)) {
            $scope = trim($this->checkPermissions($user->role_id));

            $client = OauthClient::where('password_client', 1)
                ->where('provider', 'users')
                ->latest()
                ->first();

            return [
                'user'      => $user,
                'client'    => $client,
                'scope'     => $scope
            ];
        }
        return null;
    }

    /**
     *  We guess the user is admin, if that fails, we check if they are landlord, then finally if they are tenant.
     * @param $email
     * @param $password
     * @return array
     * @throws \Exception
     */
    public function attemptLogin($email, $password)
    {
        $user = $this->getAdmin($email, $password);

        if (is_null($user))
            $user = $this->getMember($email, $password);

        if (!is_null($user)){

            // dd('aa');
            $client         = $user['client'];
            $userDetails    = $user['user'];
            $scope          = $user['scope'];
            //  $scope          = 'test1, test2';

            $clientId = !is_null($client) ? $client->id : null;
            $clientSecret = !is_null($client) ? $client->secret : null;

            return $this->proxy([
                'username'      => $email,
                'password'      => $password,
                'scope'         => $scope,
                'client_id'     => $clientId,
                'client_secret' => $clientSecret,
                'grant_type'    => 'password'
            ], $userDetails);


        }

        // log event
        // event(new LoginFailed($email));
        throw new UnauthorizedHttpException("", Exception::class, null, 0);
    }

    /**
     * Attempt to refresh the access token used a refresh token that
     * has been saved in a cookie
     */
    public function attemptRefresh()
    {
        try {
            $refreshToken = $this->request->cookie(self::REFRESH_TOKEN);
            return $this->proxy('refresh_token', [
                'refresh_token' => decrypt($refreshToken)
            ]);
        } catch (DecryptException $e) {
            throw new DecryptException($e);
        }
    }

    /**
     * @param $data
     * @param array $user
     * @return array
     */
    // public function proxy($grantType, array $credentials = [], $user = array())
    public function proxy($data, $user = array())
    {
        // Make internal POST request
        $request = Request::create('/oauth/token', 'POST', $data, [], [], [
            'HTTP_Accept' => 'application/json',
        ]);

        try {
            $response = $this->app->handle($request);
        } catch (\Exception $e) {
            throw new UnauthorizedHttpException("", $e->getMessage(), null, 0);
        }

        if (!$response->isSuccessful()) {
            // event login failed
            //  event(new LoginFailed($credentials['username']));
            throw new UnauthorizedHttpException("", Exception::class, null, 0);
        }

        $decodedResponse = json_decode($response->getContent());

        // Create a refresh token cookie
        $this->cookie->queue(
            self::REFRESH_TOKEN,
            $decodedResponse->refresh_token,
            864000, // 10 days
            null,
            null,
            false,
            true // HttpOnly
        );

        // event login success
        //  event(new LoginSuccess($credentials['username']));

        return [
            'access_token' => $decodedResponse->access_token,
            'expires_in' => $decodedResponse->expires_in,
            'settings' => $this->generalSettingRepository->getFirst(),
            'company_id' => $user ? $user['company_id'] : null,
            'first_name' => $user ? $user['first_name'] : null,
            'middle_name' => $user ? $user['middle_name'] : null,
            'last_name' => $user ? $user['last_name'] : null,
             'scope' 		=> $data['scope']
        ];
    }

    /**
     * Logs out the user. We revoke access token and refresh token.
     * Also instruct the client to forget the refresh cookie.
     */
    public function logout()
    {
        // dd(auth()->user()->token());

        // dd($this->auth->user());
        //  Auth::user()
        $accessToken = $this->auth->user()->token();
        $refreshToken = $this->db
            ->table('oauth_refresh_tokens')
            ->where('access_token_id', $accessToken->id)
            ->update([
                'revoked' => true
            ]);
        $accessToken->revoke();

        // event logout success
        // event(new Logout($this->auth->user()));
        $this->cookie->queue($this->cookie->forget(self::REFRESH_TOKEN));
    }

    /**
     * @param $roleId
     * @return string
     */
    private function checkPermissions($roleId)
    {
        $role = $this->roleRepository->getWhere('id', $roleId, ['permissions']);
        if (!$role)
            return '';
        $role_permissions = $role->permissions()->get()->toArray();
        $data = [];
        foreach ($role_permissions as $key => $value) {
            $data[] = trim($value['name']);
        }
        return implode(' ', $data);
    }

    /**
     * @param $roleId
     * @return string
     */
    private function checkRole($roleId)
    {
        $role = $this->roleRepository->getWhere('id', $roleId, ['permissions']);
        $data[] = trim(strtolower($role->role_name));
        return implode(' ', $data);
    }

}
