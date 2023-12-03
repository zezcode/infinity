
                                            <div class="tab-pane fade show active" id="zero_admin_nav_website" role="tabpanel" aria-labelledby="zero_admin_nav_website_tab" tabindex="0">
                                                <div class="card card-bordered mb-5">
                                                    <div class="card-header">
                                                        <div class="card-title fw-bolder">Cấu hình cơ bản</div>
                                                        <div class="card-toolbar">
                                                            <button class="btn btn-light-primary btn-sm" onclick="updateAdminConfigSettings('website')">
                                                                <i class="bi bi-save"></i>Lưu cấu hình
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row g-5">
                                                            <div class="col-xxl-6">
                                                                <label class="form-label" for="website_url">Địa chỉ trang web</label>
                                                                <input class="form-control mb-5" id="website_url" name="website_url" type="text" placeholder="Địa chỉ trang web" value="{$settings['website_url']}" />
                                                                <label class="form-label" for="website_name">Tên trang web</label>
                                                                <input class="form-control mb-5" id="website_name" name="website_name" type="text" placeholder="Tên trang web" value="{$settings['website_name']}" />
                                                                <label class="form-label" for="website_landing_index">LANDING INDEX</label>
                                                                <input class="form-control mb-5" data-bs-toggle="tooltip" title="Không chỉnh sửa nếu không hiểu rõ" id="website_landing_index" name="website_landing_index" type="text" placeholder="" value="{$settings['website_landing_index']}" />
                                                                <label class="form-label" for="website_admin_path">Đường đẫn trang quản lý</label>
                                                                <input class="form-control mb-5" id="website_admin_path" name="website_admin_path" type="text" placeholder="Đường dẫn trang quản " value="{$settings['website_admin_path']}" />
                                                            </div>
                                                            <div class="col-xxl-6">
                                                                <label class="form-label" for="website_security_token">TOKEN Bảo mật</label>
                                                                <input class="form-control mb-5" data-bs-toggle="tooltip" title="Điền theo ý muốn, phức tạp nhất có thể" id="website_security_token" name="website_security_token" type="text" placeholder="TOKEN" value="{$settings['website_security_token']}" />
                                                                <label class="form-label" for="website_backend_token">TOKEN Phụ trợ</label>
                                                                <input class="form-control mb-5" data-bs-toggle="tooltip" title="Cần dùng khi chạy node" id="website_backend_token" name="website_backend_token" type="text" placeholder="token" value="{$settings['website_backend_token']}" />
                                                                <label class="form-label" for="website_auth_background_image">Hình nền trang web</label>
                                                                <input class="form-control mb-5" data-bs-toggle="tooltip" title="Hình nền ở trang đăng nhập" id="website_auth_background_image" name="website_auth_background_image" type="text" placeholder="Nhập link hình ảnh" value="{$settings['website_auth_background_image']}" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row g-5">
                                                    <div class="col-xxl-6">
                                                        <div class="card card-bordered">
                                                            <div class="card-header">
                                                                <div class="card-title fw-bolder">Tùy chỉnh nhóm quyền</div>
                                                                <div class="card-toolbar">
                                                                    <button class="btn btn-light-primary btn-sm" onclick="updateAdminConfigSettings('permission_group')">
                                                                        <i class="bi bi-save"></i>Lưu cấu hình
                                                                    </button>
                                                                </div>
                                                            </div>
                                                            <div class="card-body">                                                                  
                                                                <label class="form-label" for="enable_permission_group">Bật/tắt tùy chỉnh nhóm quyền</label>
                                                                <select class="form-select mb-5" id="enable_permission_group" data-control="select2" data-hide-search="true">
                                                                    <option value="0">Tắt</option>
                                                                    <option value="1">Bật</option>
                                                                </select>
                                                                <span class="form-label">Cài đặt tên nhóm quyền</span>
                                                                <div id="permission_group_detail" class="mt-3"></div>                                                                   
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            