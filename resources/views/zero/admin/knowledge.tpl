<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>{$config["website_name"]} Quản lý hướng dẫn</title>
        
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
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Quản lý hướng dẫn</div>
                                            <div class="card-toolbar">
                                                <button class="btn btn-primary btn-sm fs-bold" data-bs-toggle="modal" data-bs-target="#zero_admin_modal_knowledge">
                                                    <i class="bi bi-plus-lg fs-2"></i>Thêm hướng dẫn
                                                </button>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            {include file='table/table.tpl'}
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        {include file='admin/footer.tpl'}
                    </div>
                </div>
            </div>
        </div>

        <!-- modal -->
        <div class="modal fade" id="zero_admin_modal_knowledge" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header justify-content-end border-0 pb-0">
                        <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                            
                            <span class="svg-icon svg-icon-1">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                    <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                </svg>
                            </span>
                            
                        </div>
                    </div>
                    <div class="modal-body scroll-y pt-0 pb-15 px-5 px-xl-20">
                        <div class="mb-13 text-center">
                            <h1 class="mb-3">Thêm hướng dẫn</h1>
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="form-label fw-bold" for="zero_admin_knowledge_title">Tiêu đề</label>
                            <input class="form-control mb-5" placeholder="Nhập ít hơn 20 ký tự" id="zero_admin_knowledge_title" value="">
                            <label class="form-label fw-bold" for="zero_admin_knowledge_platform">Hệ điều hành</label>
                            <select class="form-select mb-5" id="zero_admin_knowledge_platform" value="" data-control="select2" data-hide-search="true" data-placeholder="Chọn hệ điều hành">
                                <option></option>
                                <option value="windows">Windows</option>
                                <option value="android">Android</option>
                                <option value="ios">IOS</option>
                                <option value="macos">MACOS</option>
                                <option value="others">Others</option>
                            </select>
                            <label class="form-label fw-bold" for="zero_admin_knowledge_client">Ứng dụng<i class="bi bi-question-octagon mx-3" data-bs-toggle="tooltip" title="Nếu không có ứng dụng bạn cần, bạn có thể nhập trực tiếp tên ứng dụng vào hộp tìm kiếm.Lưu ý tên ứng dụng nhập vào phải hoàn toàn là chữ thường và không chứa bất kỳ ký tự đặc biệt nào"></i></label>
                            <select class="form-select mb-5" id="zero_admin_knowledge_client" value="" data-control="select2" data-hide-search="false" data-dropdown-parent="#zero_admin_modal_knowledge" data-placeholder="Chọn ứng dụng" data-tags="true">
                                <option></option>
                                <option value="clash">Clash</option>
                                <option value="v2rayng">V2RayNG</option>
                                <option value="singbox">SingBox</option>
                                <option value="surge">Surge</option>
                                <option value="sagernet">Sagernet</option>
                                <option value="shadowrocket">Shadowrocket</option>
                                <option value="quantumultx">Quantumultx</option>
                                <option value="v2rayn">V2rayN</option>
                                <option value="qv2ray">Qv2ray</option>
                                <option value="netch">Netch</option>
                                <option value="stash">Stash</option>
                            </select>                         
                            <div id="zero_admin_knowledge_editor" class="h-250px scroll"></div>
                        </div>
                        <div class="d-flex flex-center flex-row-fluid pt-12">
                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" data-kt-admin-knowledge-action="submit" onclick="zeroAdminKnowledge('create')">
                                <span class="indicator-label">Lưu lại</span>
                                <span class="indicator-progress">Vui lòng chờ
                                <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {include file='admin/script.tpl'}
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.9.6/ace.js"></script>
        <script>
            window.addEventListener('load', () => {
                {include file='table/js_2.tpl'}
            });

            var editor = ace.edit("zero_admin_knowledge_editor");
            const aceTheme = themeMode == 'light' ? 'github' : 'monokai';
            editor.setTheme("ace/theme/"+aceTheme);
            editor.session.setMode("ace/mode/html");

            function zeroAdminKnowledge(type, id) {
                const submitButton = document.querySelector('[data-kt-admin-knowledge-action="submit"]');
                submitButton.setAttribute('data-kt-indicator', 'on');
                submitButton.disabled = true;
                const content = editor.getValue();
                $.ajax({
                    type: 'POST',
                    url: '/{$config['website_admin_path']}/knowledge/'+type,
                    dataType: 'json',
                    data: {
                        title: $('#zero_admin_knowledge_title').val(),
                        platform: $('#zero_admin_knowledge_platform').val(),
                        client: $('#zero_admin_knowledge_client').val(),
                        content: content,
                        id
                    },
                    success: function(data){
                        if (data.ret === 1) {
                            submitButton.removeAttribute('data-kt-indicator');
                            submitButton.disabled = false;
                            table_1.ajax.reload();
                            getResult(data.msg, '', 'success');
                            $('#zero_admin_modal_knowledge').modal('hide');
                        } else {
                            getResult(data.msg, '', 'error');
                            submitButton.removeAttribute('data-kt-indicator');
                            submitButton.disabled = false;
                        }
                    }
                });
            }

            function zeroAdminKnowledgeGetInfo(id) {
                const submitButton = document.querySelector('[data-kt-admin-knowledge-action="submit"]');
                $.ajax({
                    type: 'POST',
                    url: '/{$config['website_admin_path']}/knowledge/getinfo',
                    dataType: 'json',
                    data: {
                        id
                    },
                    success: function(data) {
                        $('#zero_admin_knowledge_title').val(data.title),
                        $('#zero_admin_knowledge_platform').val(data.platform).trigger('change');
                        $('#zero_admin_knowledge_client').val(data.client).trigger('change');                      
                        editor.setValue(data.content, -1);
                        submitButton.setAttribute('onclick', 'zeroAdminKnowledge("update", '+id+')')
                        $('#zero_admin_modal_knowledge').modal('show');
                    }
                });
            }
            $('#zero_admin_modal_knowledge').on('hidden.bs.modal', function () {
                const submitButton = document.querySelector('[data-kt-admin-knowledge-action="submit"]');
                $('#zero_admin_knowledge_title').val('');
                $('#zero_admin_knowledge_platform').val('').trigger('change');
                $('#zero_admin_knowledge_client').val('').trigger('change');
                editor.setValue('', -1);
                submitButton.setAttribute('onclick', 'zeroAdminKnowledge("create")');
                console.log('success')
            });
        </script>
    </body>
</html>