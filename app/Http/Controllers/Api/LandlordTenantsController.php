<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 7/12/2021
 * Time: 10:55 PM
 */

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Oauth\LoginProxy;
use App\Http\Resources\TenantResource;
use App\Models\Landlord;
use App\Models\Tenant;
use App\Rental\Repositories\Contracts\LandlordInterface;
use App\Rental\Repositories\Contracts\PaymentInterface;

class LandlordTenantsController extends ApiController
{
    /**
     * @var LandlordInterface
     */
    protected $landlordRepository, $load, $loginProxy;

    /**
     * LandlordTenantsController constructor.
     * @param LandlordInterface $landlordRepository
     * @param LoginProxy $loginProxy
     */
    public function __construct(LandlordInterface $landlordRepository, LoginProxy $loginProxy)
    {
        $this->landlordRepository = $landlordRepository;
        $this->loginProxy = $loginProxy;
        $this->load = [
            'tenant_type',
            'landlord',
            'payment_methods',
            'extra_charges',
            'late_fees',
            'utility_costs'
        ];
    }

    /**
     * @param Landlord $landlord
     * @return mixed
     */
    public function index(Landlord $landlord)
    {
        if ($this->loginProxy->checkLandlord($landlord)) {
            $limit = $this->landlordRepository->limit();
            $properties = $landlord->properties()->with($this->load)->paginate($limit);
            if (isset($properties))
                return $this->respondWithData(TenantResource::collection($properties));

            return $this->respondNotFound('Tenants not found.');
        }
        return $this->respondNotFound('Tenants not found.');
    }

    /**
     * @param Landlord $landlord
     * @param Tenant $tenant
     * @return mixed
     */
    public function show(Landlord $landlord, Tenant $tenant)
    {
        if ($this->loginProxy->checkLandlord($landlord)) {
            $data = Tenant::where('landlord_id', $landlord->id)
                ->where('id', $tenant->id)
                ->orderBy('updated_at', 'desc')
                ->first();

            if (isset($data))
                return $this->respondWithData(TenantResource::make($data));

            return $this->respondNotFound('Tenant not found.');
        }
        return $this->respondNotFound('Tenant not found.');
    }

}

