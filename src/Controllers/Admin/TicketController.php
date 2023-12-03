<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\{
    User,
    Ticket,
    Setting
};
use voku\helper\AntiXSS;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

class TicketController extends AdminController
{
    public function ticketIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $table_config['total_column'] = [
            'id'           => 'ID',
            'userid'       => 'USER ID',
            'type'         => 'Loại phiếu',
            'title'        => 'Tiêu đề',
            'status'       => 'Trạng thái',
            'created_at'   => 'Thời gian tạo',
            'updated_at'   => 'Thời gian cập nhật',
            'action'       => 'Thao tác',
        ];
        $table_config['ajax_url'] = 'ticket/ajax';
        $allUsers = User::all();
        $this->view()
            ->assign('table_config', $table_config)
            ->assign('allUsers', $allUsers)
            ->display('admin/ticket/ticket.tpl');
        return $response;
    }

    public function createTicket(ServerRequest $request, Response $response, array $args): Response
    {
        $postData = $request->getParsedBody();
        $subject  = $postData['subject'] ?: '';
        $comment  = $postData['content'] ?: '';
        $type     = $postData['type'] ?: 'support';
        $user_id  = $postData['user_id'] ?: '';
        if (empty($subject)||empty($comment)||empty($user_id)) {
            return $response->withJson([
                'ret' => 0,
                'msg' => 'Đã có lỗi xảy ra',
            ]);
        }

        $antiXss = new AntiXSS();

        $content = [
            [
                'comment_id'      => 0,
                'commenter_email' => $this->user->email,
                'comment'         => $antiXss->xss_clean($comment),
                'datetime'        => time(),
            ],
        ];

        $ticket             = new Ticket();
        $ticket->title      = $antiXss->xss_clean($subject);
        $ticket->content    = json_encode($content);
        $ticket->userid     = $user_id;
        $ticket->created_at = time();
        $ticket->updated_at = time();
        $ticket->status     = 1;
        $ticket->type       = $antiXss->xss_clean($type);
        $ticket->save();

        return $response->withJson(
            [
                'ret' => 1,
                'id'  => $ticket->id,
                'msg' => 'Tạo thành công'
            ]
        );
    }

    public function updateTicket(ServerRequest $request, Response $response, array $args): Response
    {
        $id      = $request->getParsedBodyParam('id');
        $comment = $request->getParsedBodyParam('comment');

        if ($comment === '') {
            return $response->withJson([
                'ret' => 0,
                'msg' => 'Đã có lỗi xảy ra',
            ]);
        }

        $ticket = Ticket::where('id', $id)->first();

        $antiXss = new AntiXSS();

        $content_old = json_decode($ticket->content, true);
        $content_new = [
            [
                'comment_id'      => $content_old[count($content_old) - 1]['comment_id'] + 1,
                'commenter_email' => 'Admin',
                'comment'         => $antiXss->xss_clean($comment),
                'datetime'        => time(),
            ],
        ];

        $user = User::find($ticket->userid);
        $user->sendMail(
            Setting::obtain('website_name') . '-Phiếu đã được phản hồi',
            'news/warn.tpl',
            [
                'text' => 'Xin chào, có người đã trả lời<a href="' . Setting::obtain('website_url') . '/user/ticket/view/' . $ticket->id . '">phiếu hỗ trợ</a>，hãy kiểm tra',
            ],
            []
        );

        $ticket->content    = json_encode(array_merge($content_old, $content_new));
        $ticket->updated_at = time();
        $ticket->status     = 1;
        $ticket->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Gửi thành công'
        ]);
    }

    public function ticketViewIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $id       = $args['id'];
        $ticket   = Ticket::where('id', '=', $id)->first();
        $comments = json_decode($ticket->content, true);

        $this->view()
            ->assign('ticket', $ticket)
            ->assign('comments', $comments)
            ->display('admin/ticket/view.tpl');
        return $response;
    }

    public function ticketAjax(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Ticket::getTableDataFromAdmin(
            $request,
            static function (&$order_field) {
                if (in_array($order_field, ['action'])) {
                    $order_field = 'id';
                }
                if (in_array($order_field, ['title'])) {
                    $order_field = 'userid';
                }
            },
        );

        $data = $query['datas']->map(function($rowData) {
            $comments = json_decode($rowData->content, true);
            foreach ($comments as $comment) {
                $last_updated = date('Y-m-d H:i:s', $comment['datetime']);
            }
            return [
                'id'           => $rowData->id,
                'userid'       => $rowData->userid,
                'type'         => $rowData->type,
                'title'        => $rowData->title,
                'status'       => $rowData->status(),
                'created_at'   => date('Y-m-d H:i:s', $rowData->created_at),
                'updated_at'   => date('Y-m-d H:i:s', $rowData->updated_at),
                'action'       => <<<EOT
                                    <div class="btn-group dropstart"><a class="btn btn-light-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Thao tác</a>
                                        <ul    class = "dropdown-menu">
                                        <li><a class = "dropdown-item" href = "ticket/view/{$rowData->id}">Trả lời</a></li>
                                        <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminDelete('ticket', {$rowData->id})">Xóa bỏ</a></li>
                                        <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminCloseTicket({$rowData->id})">Đóng</a></li>
                                        </ul>
                                    </div>
                                EOT,
            ];
        })->toArray();

        return $response->withJson([
            'draw'            => $request->getParsedBodyParam('draw'),
            'recordsTotal'    => Ticket::count(),
            'recordsFiltered' => $query['count'],
            'data'            => $data,
        ]);
    }

    public function deleteTicket(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $request->getParsedBodyParam('id');
        Ticket::find($id)->delete();
        return $response->withJson([
            'ret'   => 1,
            'msg'   => 'success'
        ]);
    }

    public function closeTicket(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $request->getParsedBodyParam('id');
        $ticket = Ticket::find($id);
        $ticket->status = 0;
        $ticket->save();
        return $response->withJson([
            'ret'   => 1,
            'msg'   => 'success'
        ]);
    }
}