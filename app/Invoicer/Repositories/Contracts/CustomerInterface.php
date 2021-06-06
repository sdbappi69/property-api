<?php


namespace App\Invoicer\Repositories\Contracts;

interface CustomerInterface extends BaseInterface {
    function getViaEmail($email);
}
