<?php
namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Coupon;
use App\Models\Product;
use App\Utils\Tools;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

class CouponController extends AdminController
{
    public function couponIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $table_config['total_column'] = [
            'id'                     => 'ID',
            'code'                   => 'Mã giảm giá',
            'expire'                 => 'Hạn sử dụng',
            'limited_product'        => 'ID Gói được dùng',
            'limited_product_period' => 'Khoảng thời gian',
            'discount'               => 'Phần trăm giảm',
            'per_use_count'          => 'Khoảng cách',
            'total_use_count'        => 'Số lượng mã',
            'total_used_count'       => 'Đã sử dụng',
            'action'                 => 'Thao tác',
        ];
        $table_config['ajax_url'] = 'coupon/ajax';
        $products = Product::where('status', 1)->get();
        $this->view()
            ->assign('table_config', $table_config)
            ->assign('products', $products)
            ->display('admin/coupon.tpl');
        return $response;
    }

    public function createCoupon(ServerRequest $request, Response $response, array $args): Response
    {
        $postdata      = $request->getParsedBody();
        $generate_type = $postdata['generate_type'];
        $final_code    = $postdata['code'];
        try {
            if (empty($final_code) && in_array($generate_type, [1, 3])) {
                throw new \Exception('Mã giảm giá không được để trống');
            }
            if (empty($postdata['discount']) || !is_numeric($postdata['discount'])) {
                throw new \Exception('Phần trăm giảm giá sai');
            }
            if (!empty($postdata['per_use_count']) && $postdata['per_use_count'] <= 0 || !empty($postdata['total_use_count']) && $postdata['total_use_count'] <= 0) {         
                throw new \Exception('Số lần phải lớn hơn 0');
            }

            if ($generate_type == 1) {
                if (Coupon::where('code', $final_code)->count() != 0) {
                    throw new \Exception('Mã giảm giá đã tồn tại');
                }
            } else {
                while (true) {
                    $code_str = Tools::genRandomChar(8);
                    if ($generate_type == 3) {
                        $final_code .= $code_str;
                    } else {
                        $final_code  = $code_str;
                    }

                    if (Coupon::where('code', $final_code)->count() == 0) {
                        break;
                    }
                }
            }
        } catch (\Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $e->getMessage(),
            ]);
        }
        $coupon                         = new Coupon();
        $coupon->per_use_count          = $postdata['per_use_count'] ?: NULL;
        $coupon->total_use_count        = $postdata['total_use_count'] ?: NULL;
        $coupon->code                   = $final_code;
        $coupon->expired_at             = time() + $postdata['expire'] * 3600;
        $coupon->limited_product        = !array_filter($postdata['limited_product']) ? NULL : json_encode($postdata['limited_product']);
        $coupon->limited_product_period = !array_filter($postdata['limited_product_period']) ? NULL : json_encode($postdata['limited_product_period']);
        $coupon->discount               = $postdata['discount'];
        $coupon->created_at             = time();
        $coupon->updated_at             = time();
        $coupon->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Tạo mã giảm giá thành công'
        ]);
    }

    public function couponAjax(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Coupon::getTableDataFromAdmin(
            $request
        );
        $data = $query['datas']->map(function($rowData) {
            return [
                'id'                     => $rowData->id,
                'code'                   => $rowData->code,
                'expire'                 => date('Y-m-d H:i:s', $rowData->expired_at),
                'limited_product'        => $rowData->limited_product ?? 'Tất cả',
                'limited_product_period' => is_null($rowData->limited_product_period) ? 'Không giới hạn' : $rowData->getLimitedProductPeriod(),
                'discount'               => $rowData->discount,
                'per_use_count'          => is_null($rowData->per_use_count) ? 'Không giới hạn' : $rowData->per_use_count,
                'total_use_count'        => is_null($rowData->total_use_count) ? 'Không giới hạn' : $rowData->total_use_count,
                'total_used_count'       => $rowData->total_used_count,
                'action'                 => <<<EOT
                                                <div class="btn-group dropstart"><a class="btn btn-light-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Thao tác</a>
                                                    <ul    class = "dropdown-menu">                                                  
                                                    <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminDelete('coupon', {$rowData->id})">Xóa bỏ</a></li>
                                                    </ul>
                                                </div>
                                            EOT,
            ];
        })->toArray();

        return $response->WithJson([
            'draw'              => $request->getParsedBodyParam('draw'),
            'recordsTotal'      => Coupon::count(),
            'recordsFiltered'   => $query['count'],
            'data'              => $data
        ]);
        
    }

    public function deleteCoupon(ServerRequest $request, Response $response, array $args): Response
    {
        $coupon = Coupon::find($request->getParsedBodyParam('id'));
        $coupon->delete();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Xóa thành công',
        ]);
    }
}