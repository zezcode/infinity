<?php

namespace App\Models;

class Withdraw extends Model
{
    protected $connection = 'default';
    protected $table = 'withdraw_log';

    public function status()
    {
        switch ($this->status) {
            case 1:
                $status = '<div class="badge font-weight-bold badge-light-success fs-6">Hoàn thành</div>';
                break;
            case 0:
                $status = '<div class="badge font-weight-bold badge-light-warning fs-6">Đang chờ</div>';
                break;
            case -1: 
                $status = '<div class="badge font-weight-bold badge-light-danger fs-6">Trả lại</div>';
                break;
        }
        return $status;
    }
}
