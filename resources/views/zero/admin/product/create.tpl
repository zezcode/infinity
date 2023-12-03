<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>{$config["website_name"]} Gói dịch vụ</title>
        
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
	{include file ='admin/menu.tpl'}
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <div class="d-flex flex-column flex-column-fluid mt-10">
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <div id="kt_app_content_container" class="app-container container-xxl">
                                    <div class="card mb-5">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Thêm gói dịch vụ</div>
                                            <div class="card-toolbar">
                                                <button class="btn btn-primary btn-sm fw-bold" onclick="zeroAdminCreateProduct()">
                                                <i class="bi bi-cloud-plus fs-3"></i>Lưu gói dịch vụ
                                                </button>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-xxl-6">
                                                    <label class="form-label required" for="name">Tên gói dịch vụ</label>
                                                    <input class="form-control mb-5" id="name" name="name" type="text" placeholder="Nhập tên gói dịch vụ" value="">
                                                    <label class="form-label required" for="month_price">Giá bán</label>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <input class="form-control mb-5" id="month_price" name="month_price" type="number" placeholder="Giá 1 tháng" value="">
                                                        </div>
                                                        <div class="col-4">
                                                            <input class="form-control mb-5" id="quarter_price" name="quarter_price" type="number" placeholder="Giá 3 tháng" value="">
                                                        </div>
                                                        <div class="col-4">
                                                            <input class="form-control mb-5" id="half_year_price" name="half_year_price" type="number" placeholder="Giá 6 tháng" value="">
                                                        </div>
                                                        <div class="col-4">
                                                            <input class="form-control mb-5" id="year_price" name="year_price" type="number" placeholder="Giá 1 năm" value="">
                                                        </div>
                                                        <div class="col-4">
                                                            <input class="form-control mb-5" id="two_year_price" name="two_year_price" type="number" placeholder="Giá 2 năm" value="">
                                                        </div>
                                                        <div class="col-4">
                                                            <input class="form-control mb-5" data-bs-toggle="tooltip" title="Giá bán gói dùng không thời hạn" id="onetime_price" name="onetime_price" type="number" placeholder="Giá không thời hạn" value="">
                                                        </div>
                                                    </div>
                                                    <label class="form-label required" for="type">Loại gói</label>
                                                    <select class="form-select mb-5" id="type" data-control="select2" data-hide-search="true">
                                                        <option value="1">Có thời hạn</option>
                                                        <option value="2">Mua dung lượng</option>
                                                        <option value="3">Không thời hạn</option>
                                                    </select>
                                                    <label class="form-label required" for="traffic">Dung lượng gói</label>  
                                                    <div class="input-group mb-5">
                                                        <input class="form-control" data-bs-toggle="tooltip" title="0 Nghĩa là không giới hạn" id="traffic" name="traffic" type="number" placeholder="Nhập dung lượng cho gói" value="0">
                                                        <span class="input-group-text">GB</span>
                                                    </div>
                                                    <label class="form-label required" for="class">Cấp độ của gói</label>
                                                    <input class="form-control mb-5" data-bs-toggle="tooltip" title="Mặc định là 0" id="class" name="class" type="number" placeholder="Nhập cấp độ gói" value="0">
                                                    
                                                </div>
                                                <div class="col-xxl-6">
                                                    <label class="form-label" for="stock">Số lượng gói</label>
                                                    <input class="form-control mb-5" id="stock" name="stock" type="number" placeholder="Mặc định là không giới hạn" value="0" data-bs-toggle="tooltip" title="0 Nghĩa là không có giới hạn">
                                                    <label class="form-label required" for="reset">Phương pháp đặt lại dung lượng</label>
                                                    <select class="form-select mb-5" id="reset" data-control="select2" data-hide-search="true">
                                                        <option value="0">Không đặt lại</option>
                                                        <option value="1">Đặt lại ngày đặt hàng</option>
                                                        <option value="2">Đặt lại vào ngày 1 hàng tháng</option>
                                                    </select>
                                                    <label class="form-label" for="speed_limit">Giới hạn tốc độ</label>
                                                    <div class="input-group mb-5">
                                                        <input class="form-control" id="speed_limit" name="speed_limit" type="number" placeholder="Mặc định là không giới hạn" value="0" data-bs-toggle="tooltip" title="0 Nghĩa là không có giới hạn">
                                                        <span class="input-group-text">Mbps</span>
                                                    </div>
                                                    <label class="form-label" for="ip_limit">Giới hạn thiết bị</label>
                                                    <div class="input-group mb-5">
                                                        <input class="form-control" id="ip_limit" name="ip_limit" type="number" placeholder="Mặc định là không giới hạn" value="0" data-bs-toggle="tooltip" title="0 Nghĩa là không có giới hạn">
                                                        <span class="input-group-text">IP</span>
                                                    </div>
                                                    <label class="form-label required" for="sort">Thứ tự sắp xếp</label>
                                                    <input class="form-control mb-5" id="sort" name="sort" title="Thứ tự sắp xếp của gói" type="number" placeholder="Thứ tự sắp xếp" value="0">
                                                    <label class="form-label required" for="group">Nhóm của gói</label>
                                                    <input class="form-control" data-bs-toggle="tooltip" title="0 Nghĩa là không nhóm" id="group" name="group" type="number" placeholder="Mặc định là không nhóm" value="0">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title">Mô tả gói</div>
                                        </div>
                                        <div class="card-body h-250px" id="custom_content"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {include file='admin/footer.tpl'}
                    </div>
                </div>
            </div>
        </div>
        {include file='admin/script.tpl'}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.9.6/ace.js"></script>
        <script>
            function zeroAdminCreateProduct() {
                $.ajax({
                    type: "POST",
                    url: "/{$config['website_admin_path']}/product/create",
                    dataType: "JSON",
                    data: {
                        name: $('#name').val(),
                        month_price: $('#month_price').val(),
                        quarter_price: $('#quarter_price').val(),
                        half_year_price: $('#half_year_price').val(),
                        year_price: $('#year_price').val(),
                        two_year_price: $('#two_year_price').val(),
                        onetime_price: $('#onetime_price').val(),
                        type: $('#type').val(),
                        traffic: $('#traffic').val(),
                        class: $('#class').val(),
                        group: $('#group').val(),
                        stock: $('#stock').val(),
                        reset: $('#reset').val(),
                        speed_limit: $('#speed_limit').val(),
                        ip_limit: $('#ip_limit').val(),
                        sort: $('#sort').val(),
                        custom_content: $('#custom_content').val()
                    },
                    success: function(data){
                        if (data.ret === 1){
                            Swal.fire({
                                text: data.msg,
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "OK",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            }).then(function (result) {
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            });
                        } else {
                            getResult(data.msg, '', 'error');
                        }
                    }
                })
            }
            var editor = ace.edit("custom_content");
            const aceTheme = themeMode == 'light' ? 'github' : 'monokai';
            editor.setTheme("ace/theme/"+aceTheme);
            editor.session.setMode("ace/mode/html");
        </script>
    </body>
</html>