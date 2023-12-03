<?php

namespace App\Controllers\Admin;

use App\Controllers\{
    AdminController
};
use App\Models\{
    User, 
    Withdraw,
    Commission,
    Setting
};
use Slim\Http\Response;
use Slim\Http\ServerRequest;

class CommissionController extends AdminController
{
    public function commissionIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $table_config['total_column'] = [
            'id'       => 'ID',
            'type'     => 'Loại rút tiền',
            'userid'   => 'USER ID',
            'total'    => 'Số tiền',
            'status'   => 'Trạng thái',
            'datetime' => 'Thời gian',
            'action'   => 'Thao tác'
        ];
        $table_config_commission['total_column'] = [
            'id'            => 'ID',
            'order_amount'  => 'Số tiền ban đầu',
            'userid'        => 'ID người được mời',
            'invite_userid' => 'ID người mời',
            'get_amount'    => 'Hoa hồng',
            'datetime'      => 'Thời gian'
        ];
        $table_config_commission['ajax_url'] = 'commission/ajax';

        $table_config['ajax_url'] = 'commission/withdraw/ajax';
        $this->view()
            ->assign('table_config', $table_config)
            ->assign('table_config_commission', $table_config_commission)
            ->display('admin/commission.tpl');
        return $response;
    }

    public function withdrawAjax(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Withdraw::getTableDataFromAdmin(
            $request,
            static function (&$order_field) {
                if (in_array($order_field, ['action'])) {
                    $order_field = 'id';
                }
            }
        );
        
        $data = $query['datas']->map(function($rowData) {
            return [
                'id'       => $rowData->id,
                'userid'   => $rowData->userid,
                'total'    => $rowData->total,
                'type'     => $rowData->type === 1 ? 'Chuyển vào số dư' : 'Rút tiền mặt',
                'status'   => $rowData->status(),
                'datetime' => date('Y-m-d H:i:s', $rowData->created_at),
                'action'   => <<<EOT
                                <div class="btn-group dropstart"><a class="btn btn-light-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Thao tác</a>
                                    <ul    class = "dropdown-menu">
                                    <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminUpdateWithdrawCommission('mark_done', {$rowData->id})">Hoàn thành</a></li>
                                    <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminUpdateWithdrawCommission('go_back', {$rowData->id})">Từ chối</a></li>
                                    </ul>
                                </div>
                            EOT,
            ];
        })->toArray();

        return $response->withJson([
            'draw'            => $request->getParsedBodyParam('draw'),
            'recordsTotal'    => Withdraw::count(),
            'recordsFiltered' => $query['count'],
            'data'            => $data,
        ]);
    }

    public function updateWithdrawCommission(ServerRequest $request, Response $response, array $args): Response
    {
        $mode = $request->getParsedBodyParam('mode');
        $id   = $request->getParsedBodyParam('id');

        switch ($mode) {
            case 'mark_done': 
                $withdraw = Withdraw::find($id);
                $withdraw->status = 1;
                if (!$withdraw->save()) {
                    $res['ret'] = 0;
                    $res['msg'] = 'Đã đánh dấu là không thành công';
                    return $response->withJson($res);   
                }
                $res['ret'] = 1;
                $res['msg'] = 'Đã đánh dấu là thành công';
                return $response->withJson($res);
            case 'go_back': 
                $withdraw = Withdraw::find($id);
                $withdraw->status = -1;
                $withdraw->save();
                $go_user = User::find($withdraw->userid);
                $go_user->commission = bcadd($go_user->commission, $withdraw->total, 2);
                if (!$go_user->save()) {
                    $res['ret'] = 0;
                    $res['msg'] = 'Trả lại không thành công';
                    return $response->withJson($res);
                }
                $res['ret'] = 1;
                $res['msg'] = 'Đã trả lại thành công';
                return $response->withJson($res);
        }

    }

    public function commissionAjax(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Commission::getTableDataFromAdmin(
            $request
        );
        $data = $query['datas']->map(function($rowData) {
            return [
                'id'            => $rowData->id,
                'order_amount'  => $rowData->order_amount,
                'userid'        => $rowData->userid,
                'invite_userid' => $rowData->invite_userid,
                'get_amount'    => $rowData->ref_get,
                'datetime'      => date('Y-m-d H:i:s', $rowData->created_at),
            ];
        })->toArray();

        return $response->WithJson([
            'draw'            => $request->getParsedBodyParam('draw'),
            'recordsTotal'    => Commission::count(),
            'recordsFiltered' => $query['count'],
            'data'            => $data
        ]);
    }
    

}