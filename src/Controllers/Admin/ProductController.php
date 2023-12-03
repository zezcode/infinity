<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Product;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

class ProductController extends AdminController
{
    public function index(ServerRequest $request, Response $response, array $args): Response
    {
        $table_config['total_column'] = [
            'id'        => 'ID',
            'sort'      => 'Thứ tự',   
            'name'      => 'Tên',
            'type'      => 'Loại gói',
            'sales'     => 'Số đơn mua',
            'status'    => 'Trạng thái',
            'renew'     => 'Làm mới <i class="bi bi-question-circle" data-bs-toggle="tooltip" data-bs-placement="top" title="Khi sản phẩm ngừng bán, người đã mua sản phẩm có thể gia hạn không?"></i>',
            'action'    => 'Thao tác'
        ];
    
        $table_config['ajax_url'] = 'product/ajax';
        $this->view()
            ->assign('table_config', $table_config)
            ->display('admin/product/product.tpl');
        return $response;
    }

    public function createProductIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $this->view()->display('admin/product/create.tpl');
        return $response;
    }

    public function createProduct(ServerRequest $request, Response $response, array $args): Response
    {
        $productData                     = $request->getParsedBody();
        try {
            if (empty($productData['name'])) {
                throw new \Exception('产品名称不能为空');
            }
            if (empty($productData['type'])) {
                throw new \Exception('产品类型不能为空');
            }
            if (empty($productData['sort']) && $productData['sort'] != 0) {
                throw new \Exception('产品排序不能为空');
            }
            if ($productData['traffic'] == '' || $productData['traffic'] < 0 || (string)(int)$productData['traffic'] !== $productData['traffic']) {
                throw new \Exception('产品流量不能为空, 且不能为负数和非整数');
            }
            if ($productData['group'] == '' || $productData['group'] < 0 || (string)(int)$productData['group'] !== $productData['group']) {
                throw new \Exception('产品分组不能为空, 且不能为负数和非整数');
            }
            if ($productData['class'] == '' || $productData['class'] < 0 || (string)(int)$productData['class'] !== $productData['class']) {
                throw new \Exception('产品等级不能为空, 且不能为负数和非整数');
            }
            if (empty($productData['reset']) && $productData['reset'] != 0) {
                throw new \Exception('产品重置周期不能为空');
            }
            if ($productData['speed_limit'] < 0 || $productData['speed_limit'] == '' || (string)(int)$productData['speed_limit'] !== $productData['speed_limit']) {
                throw new \Exception('产品速度不能为空, 且不能为负数和非整数');
            }
            if ($productData['ip_limit'] < 0 || $productData['ip_limit'] == '' || (string)(int)$productData['ip_limit'] !== $productData['ip_limit']) {
                throw new \Exception('产品IP不能为空, 且不能为负数和非整数');
            }
            if ($productData['stock'] < 0 || $productData['stock'] == '' || (string)(int)$productData['stock'] !== $productData['stock']) {
                throw new \Exception('产品速度不能为空, 且不能为负数和非整数');
            }
            if (
                $productData['month_price'] == '' &&
                $productData['quarter_price'] == '' &&
                $productData['half_year_price'] == '' &&
                $productData['year_price'] == '' &&
                $productData['two_year_price'] == '' &&
                $productData['onetime_price'] == ''
                ) {
                throw new \Exception('产品价格不能为空');
            }
        } catch (\Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $e->getMessage(),
            ]);
        }
        $product                      = new Product();
        $product->name                = $productData['name'];
        $product->month_price         = $productData['month_price']     == '' ? NULL : $productData['month_price'];
        $product->quarter_price       = $productData['quarter_price']   == '' ? NULL : $productData['quarter_price'];
        $product->half_year_price     = $productData['half_year_price'] == '' ? NULL : $productData['half_year_price'];
        $product->year_price          = $productData['year_price']      == '' ? NULL : $productData['year_price'];
        $product->two_year_price      = $productData['two_year_price']  == '' ? NULL : $productData['two_year_price'];
        $product->onetime_price       = $productData['onetime_price']   == '' ? NULL : $productData['onetime_price'];
        $product->custom_content      = $productData['custom_content']  == '' ? NULL : $productData['custom_content'];
        $product->type                = $productData['type'];
        $product->sort                = $productData['sort'];
        $product->traffic             = $productData['traffic'];
        $product->user_group          = $productData['group'];
        $product->class               = $productData['class'];
        $product->reset_traffic_cycle = $productData['reset'];
        $product->speed_limit         = $productData['speed_limit'];
        $product->ip_limit            = $productData['ip_limit'];
        $product->stock               = $productData['stock'];
        $product->status              = 0;
        $product->save();
        
        return $response->withJson([
            'ret' => 1,
            'msg' => '添加成功'
        ]);
    }

    public function updateProductIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $args['id'];
        $product = Product::find($id);
        $this->view()
            ->assign('product', $product)
            ->display('admin/product/edit.tpl');
        return $response;
    }

    public function updateProduct(ServerRequest $request, Response $response, array $args): Response
    {
        $productData = $request->getParsedBody();
        try {
            if (empty($productData['id'])) {
                throw new \Exception('无效产品');
            }
            if (empty($productData['name'])) {
                throw new \Exception('产品名称不能为空');
            }
            if (empty($productData['type'])) {
                throw new \Exception('产品类型不能为空');
            }
            if (empty($productData['sort']) && $productData['sort'] != 0) {
                throw new \Exception('产品排序不能为空');
            }
            if ($productData['traffic'] == '' || $productData['traffic'] < 0 || (string)(int)$productData['traffic'] !== $productData['traffic']) {
                throw new \Exception('产品流量不能为空, 且不能为负数和非整数');
            }
            if ($productData['group'] == '' || $productData['group'] < 0 || (string)(int)$productData['group'] !== $productData['group']) {
                throw new \Exception('产品分组不能为空, 且不能为负数和非整数');
            }
            if ($productData['class'] == '' || $productData['class'] < 0 || (string)(int)$productData['class'] !== $productData['class']) {
                throw new \Exception('产品等级不能为空, 且不能为负数和非整数');
            }
            if (empty($productData['reset']) && $productData['reset'] != 0) {
                throw new \Exception('产品重置周期不能为空');
            }
            if ($productData['speed_limit'] < 0 || $productData['speed_limit'] == '' || (string)(int)$productData['speed_limit'] !== $productData['speed_limit']) {
                throw new \Exception('产品速度不能为空, 且不能为负数和非整数');
            }
            if ($productData['ip_limit'] < 0 || $productData['ip_limit'] == '' || (string)(int)$productData['ip_limit'] !== $productData['ip_limit']) {
                throw new \Exception('产品IP不能为空, 且不能为负数和非整数');
            }
            if ($productData['stock'] < 0 || $productData['stock'] == '' || (string)(int)$productData['stock'] !== $productData['stock']) {
                throw new \Exception('产品速度不能为空, 且不能为负数和非整数');
            }
            if (
                $productData['month_price'] == '' &&
                $productData['quarter_price'] == '' &&
                $productData['half_year_price'] == '' &&
                $productData['year_price'] == '' &&
                $productData['two_year_price'] == '' &&
                $productData['onetime_price'] == ''
                ) {
                throw new \Exception('产品价格不能为空');
            }
        } catch (\Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $e->getMessage(),
            ]);
        }

        $id                           = $productData['id'];
        $product                      = Product::find($id);
        $product->name                = $productData['name'];
        $product->month_price         = $productData['month_price']     == '' ? NULL : $productData['month_price'];
        $product->quarter_price       = $productData['quarter_price']   == '' ? NULL : $productData['quarter_price'];
        $product->half_year_price     = $productData['half_year_price'] == '' ? NULL : $productData['half_year_price'];
        $product->year_price          = $productData['year_price']      == '' ? NULL : $productData['year_price'];
        $product->two_year_price      = $productData['two_year_price']  == '' ? NULL : $productData['two_year_price'];
        $product->onetime_price       = $productData['onetime_price']   == '' ? NULL : $productData['onetime_price'];
        $product->custom_content      = $productData['custom_content']  == '' ? NULL : $productData['custom_content'];
        $product->type                = $productData['type'];
        $product->sort                = $productData['sort'];
        $product->traffic             = $productData['traffic'];
        $product->user_group          = $productData['group'];
        $product->class               = $productData['class'];
        $product->reset_traffic_cycle = $productData['reset'];
        $product->speed_limit         = $productData['speed_limit'];
        $product->ip_limit            = $productData['ip_limit'];
        $product->stock               = $productData['stock'];
        $product->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Lưu thành công'
        ]);
    }


    public function productAjax(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Product::getTableDataFromAdmin(
            $request,
            static function (&$order_field) {
                if (in_array($order_field, ['action', 'period_sales', 'name'])) {
                    $order_field = 'id';
                }
            }
        );

        $data = $query['datas']->map(function($rowData) {
            $type = "'product'";
            return [
                'id'     => $rowData->id,
                'sort'   => $rowData->sort,
                'name'   => $rowData->name,
                'type'   => $rowData->type(),
                'sales'  => $rowData->cumulativeSales(),
                'status' => $rowData->status(),
                'renew'  => $rowData->renew(),
                'action' => <<<EOT
                                <div class="btn-group dropstart"><a class="btn btn-light-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Thao tác</a>
                                    <ul    class = "dropdown-menu">
                                    <li><a class = "dropdown-item" href = "product/update/{$rowData->id}">Chỉnh sửa</a></li>
                                    <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminDelete('product', {$rowData->id})">Xóa bỏ</a></li>
                                    </ul>
                                </div>
                            EOT,
            ];
        })->toArray();

        return $response->withJson([
            'draw'            => $request->getParsedBodyParam('draw'),
            'recordsTotal'    => Product::count(),
            'recordsFiltered' => $query['count'],
            'data'            => $data,
        ]);
    }

    public function updateProductStatus(ServerRequest $request, Response $response, array $args): Response
    {
        $putData = $request->getParsedBody();
        $id      = $putData['id'];
        $type    = $putData['type'];
        $method  = $putData['method'];
        $product = Product::find($id);
        if ($method == 'status') {
            $product->status = $type;
        } else if ($method == 'renew') {
            $product->renew = $type;
        }
        $product->save();
        return $response->withJson([
            'ret' => 1,
            'msg' => 'success'
        ]);
    }

    public function deleteProduct(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $request->getParsedBodyParam('id');
        $product = Product::find($id);
        $product->delete();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Xóa thành công'
        ]);
    }

    public function getProductInfo(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $request->getParsedBodyParam('id');
        $product = Product::find($id);
        $data = [
            'name'            => $product->name,
            'month_price'     => $product->month_price,
            'quarter_price'   => $product->quarter_price,
            'half_year_price' => $product->half_year_price,
            'year_price'      => $product->year_price,
            'two_year_price'  => $product->two_year_price,
            'type'            => $product->type,
        ];
        return $response->withJson($data);
    }
}