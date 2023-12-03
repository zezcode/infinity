<!DOCTYPE html>
<html lang="en">
    <head>
	<title>{$config["website_name"]} Thông tin đơn hàng</title>
        
        <meta charset="UTF-8" />
        <meta name="renderer" content="webkit" />
        <meta name="description" content="Updates and statistics" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="format-detection" content="telephone=no,email=no" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta http-equiv="expires" content="0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
        <link href="/theme/infinity/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/theme/infinity/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/theme/infinity/css/style.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/favicon.png" rel="shortcut icon">
        <link href="/apple-touch-icon.png" rel="apple-touch-icon">
    </head>
    {include file ='include/index/menu.tpl'}
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <div class="d-flex flex-column flex-column-fluid mt-10">
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <div id="kt_app_content_container" class="app-container container-xxl">
                                    
                                    <div class="card card-flush py-4 flex-row-fluid overflow-hidden">
                                        
                                        <div class="card-header">
                                            <div class="card-title">
                                                <h2>{$trans->t('order')} #{$order->order_no}</h2>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="card-body pt-0">
                                            <div class="table-responsive">
                                                
                                                <table class="table align-middle table-striped table-row-bordered gy-5 gs-7 mb-0">
                                                    
                                                    <thead>
                                                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                            <th class="min-w-175px">Kiểu</th>
                                                            <th class="min-w-70px text-end">Trạng thái</th>
															
                                                            <th class="min-w-70px text-end">Phương thức thanh toán</th>
                                                            
                                                            <th class="min-w-100px text-end">Mã đơn hàng</th>
                                                            <th class="min-w-70px text-end">Số lượng</th>
                                                            <th class="min-w-100px text-end">Giá</th>
                                                            <th class="min-w-100px text-end">Tổng cộng</th>
                                                        </tr>
                                                    </thead>
                                                    
                                                    
                                                    <tbody class="fw-semibold text-gray-600">
                                                        
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <div class="ms-5">
                                                                        <a class="fw-bold text-gray-600 text-hover-primary">{$order_type[$order->order_type]}</a>
                                                                        <div class="fs-7 text-muted">Ngày: {date('Y-m-d H:i:s', $order->created_at)}</div>
                                                                    </div>
                                                                    
                                                                </div>
                                                            </td>
                                                            
                                                            <td class="text-end">
                                                                {if $order->order_status == '1'}
                                                                <span class="badge badge-warning fs-6 fw-bold">Đang chờ</span>
                                                                {else if $order->order_status == '2'}
                                                                <span class="badge badge-success fs-6 fw-bold">Đã thanh toán</span>
																{else if $order->order_status == '0'}
																<span class="badge badge-danger fs-6 fw-bold">Đã hủy</span>	
                                                                {/if}   
                                                            </td>
															
															<td class="text-end">{$order->payment()}</td>
															
                                                            <td class="text-end">{$order->order_no}</td>                                                           
                                                            <td class="text-end">1</td>
                                                            {if $order->order_type == '2'}
                                                                <td class="text-end">{$order->order_total}</td>                                                           
                                                                <td class="text-end">{$order->order_total}</td>
                                                            {else}
                                                                <td class="text-end">{$order->product_price}</td>                                                           
                                                                <td class="text-end">{$order->product_price}</td>
                                                            {/if}                                       
                                                        </tr>                                                                                                              
                                                        {if $order->order_type != '2'}                                                                                                            
                                                            <tr>
                                                                <td colspan="6" class="text-end">Trừ số dư</td>
                                                                <td class="text-end">{$order->credit_paid}</td>
                                                            </tr>                                                       
                                                            <tr>
                                                                <td colspan="6" class="text-end">Giảm giá</td>
                                                                <td class="text-end">{$order->discount_amount}</td>
                                                            </tr>
                                                        {/if}
                                                                                            
                                                        <tr>
                                                            <td colspan="6" class="fs-3 text-dark text-end">Tổng cộng</td>
                                                            <td class="text-dark fs-3 fw-bolder text-end">{$order->order_total}</td>
                                                        </tr>
														
														{if $order->order_status == '2'}
														<tr>
                                                            <td colspan="6" class="fs-3 text-dark text-end">Đã thanh toán</td>
                                                            <td class="text-dark fs-3 fw-bolder text-end">{$order->order_total}</td>
                                                        </tr>
														{/if}
                                                        
                                                    </tbody>
                                                    
                                                </table>
                                                
                                            </div>
											{if $order->order_status === 1}
                                                {if $order->order_total != 0}
                                                    <div class="col-lg-12">
                                                        <label class="col-form-label fs-3 fw-bold">Phương thức thanh toán:</label>                                                       
                                                        <ul class="nav nav-pills d-flex flex-column flex-md-row justify-content-center" role="tablist" id="payment_method">                                                         
                                                            {foreach $payments as $payment}
                                                                <li class="nav-item mb-3">
                                                                    <a class="btn btn-outline btn-active-light-primary d-flex flex-column {if $payment@iteration == 1}active{/if}" {if $payment->gateway == 'PayPal'} id="payment_paypal_{$payment->id}"{else} id="payment_others_{$payment->id}"{/if} data-bs-toggle="pill" data-payment-id="{$payment->id}"  data-payment-uuid="{$payment->uuid}">
                                                                        
                                                                        <img class="h-35px w-auto" src={$payment->icon}>
                                                                        
                                                                        <span class="fs-3 py-2 fw-bold">{$payment->name}</span>
                                                                    </a>
                                                                </li>
                                                            {/foreach}
                                                        </ul>
                                                    </div>
                                                {/if}
                                                <div class="text-center pt-15">
                                                    <button class="btn btn-primary" type="submit" data-kt-users-action="submit" onclick="KTUsersPayOrder('{$order->order_no}')">
                                                        <span class="indicator-label">{$trans->t('submit')}</span>
                                                        <span class="indicator-progress">{$trans->t('please wait')}
                                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                                    </button>
                                                </div>
                                                {foreach from=$payments item=payment}
                                                    {if ($payment->gateway == 'PayPal')}
                                                        <script src="https://www.paypal.com/sdk/js?client-id=Aa69h7psOgN_5Gp20yOP0eOuYBKsKZapS0ZK_RvWTl57ZZTS_SDoCvtG3j0_1R_hcp2sSl8-2f7Jik5R&currency={$paypal_currency_unit}&disable-funding=credit,card"></script>
                                                        <!-- Set up a container element for the button -->
                                                        <div id="paypal-button-container" class="text-center"></div>
                                                    {/if}
                                                {/foreach}
                                                
                                            {/if}
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="app_footer py-4 d-flex flex-lg-column" id="kt_app_footer">
                            <div class="app-container container-fluid d-flex flex-column flex-md-row flex-center flex-md-stack py-3">
                                <div class="text-dark-75 order-2 order-md-1">
                                    &copy;<script>document.write(new Date().getFullYear());</script>,&nbsp;<a>{$config["website_name"]},&nbsp;Inc.&nbsp;All rights reserved.</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		{include file='include/global/scripts.tpl'}
        {include file='include/index/news.tpl'}
        {foreach from=$payments item=payment}
            {if ($payment->gateway == 'PayPal')}
                <script>
                    paypal
                    .Buttons({
                        
                    // Sets up the transaction when a payment button is clicked
                    createOrder: function () {
                        return fetch("/user/order/pay_order", {
                        method: "post",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        // use the "body" param to optionally pass additional order information
                        // like product skus and quantities
                        body: JSON.stringify({
                            payment_id: $("#payment_method a.active").attr("data-payment-id"),
                            order_no: '{$order->order_no}',
                        }),
                        })
                        .then((response) => response.json())
                        .then((order) => order.id);
                    },
                    // Finalize the transaction after payer approval
                    onApprove: function (data) {
                        return fetch("/payment/notify/PayPal/"+$("#payment_method a.active").attr("data-payment-uuid"), {
                        method: "post",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify({
                            orderID: data.orderID,
                        }),
                        })
                        .then((response) => response.json())
                        .then((data) => {
                            location.reload();
                        });
                    },
                    })
                    .render("#paypal-button-container");

                    $('[id^=payment_paypal_]').on('click', function() {
                        $('button[type^="submit"]').addClass('d-none');
                        $('#paypal-button-container').removeClass('d-none');
                    });
                    $('[id^=payment_others_]').on('click', function() {
                        $('button[type^="submit"]').removeClass('d-none');
                        $('#paypal-button-container').addClass('d-none');
                    });
                    $('#paypal-button-container').addClass('d-none');
                    
                </script>
            {/if}
        {/foreach}
    </body>
</html>