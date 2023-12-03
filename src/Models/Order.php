<?php

namespace App\Models;

use Pkly\I18Next\I18n;
use App\Models\Payment;

class Order extends Model
{
    protected $connection = 'default';
    protected $table = 'order';

    public function status() {
        $trans = I18n::get();
        switch ($this->order_status) {
            case 2:
                $status = '<div class="badge font-weight-bold badge-light-success fs-6">' . 'Đã thanh toán' . '</div>';
                break;
            case 1:
                $status = '<div class="badge font-weight-bold badge-light-warning fs-6">' . 'Đang chờ' . '</div>';
                break;
            case 0: 
                $status = '<div class="badge font-weight-bold badge-light-danger fs-6">' . 'Đã hủy' . '</div>';
                break;
        }
        return $status;
    }

    public function payment() {
        $payment = Payment::find($this->payment_id);
        return $payment->name ?? 'Không được chọn';
    }

    public function orderType() {
        $order_type = [
            1   =>  'Mua mới',
            2   =>  'Nạp tiền',
            3   =>  'Đổi gói',
            4   =>  'Nâng cấp',
        ];
        return $order_type[$this->order_type];
    }
}

