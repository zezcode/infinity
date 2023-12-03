                                                <div class="tab-pane fade" id="zero_admin_nav_account" role="tabpanel" aria-labelledby="zero_admin_nav_account_tab" tabindex="0">
                                                    <div class="card card-bordered mb-5">
                                                        <div class="card-header">
                                                            <div class="card-title fw-bolder">Cấu hình đăng ký</div>
                                                            <div class="card-toolbar">
                                                                <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('register')">
                                                                <i class="bi bi-save"></i>Lưu cấu hình
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row g-5">
                                                                <div class="col-xxl-6">
                                                                    <label class="form-label" for="reg_mode">Chế độ đăng ký</label>
                                                                    <select class="form-select mb-5" id="reg_mode" data-control="select2" data-hide-search="true">
                                                                        <option value="close">Đóng đăng ký</option>
                                                                        <option value="open">Mở đăng ký</option>
                                                                        <option value="invite">Chỉ đăng ký bằng lời mời</option>
                                                                    </select>
                                                                    <label class="form-label" for="signup_default_class">Cấp độ mặc định</label>
                                                                    <input class="form-control mb-5" id="signup_default_class" value="{$settings['signup_default_class']}" type="text" placeholder="Cấp độ mặc định" />
                                                                    <label class="form-label" for="signup_default_class_time">Thời gian hiệu lực của cấp độ</label>
                                                                    <div class="input-group mb-5">
                                                                        <input class="form-control" id="signup_default_class_time" value="{$settings['signup_default_class_time']}" type="text" placeholder="Thời gian hiệu lực" />
                                                                        <span class="input-group-text">Ngày</span>
                                                                    </div>
                                                                    <label class="form-label" for="verify_email">Xác nhận Email<i class="bi bi-question-circle ms-2" data-bs-toggle="tooltip" title="Sau khi chức năng được bật, người dùng không xác minh địa chỉ email của mình sẽ không thể mua gói dịch vụ"></i></label>
                                                                    <select class="form-select mb-5" id="verify_email" data-control="select2" data-hide-search="true">
                                                                        <option value="close">Tắt</option>
                                                                        <option value="open">Bật</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-xxl-6">
                                                                    <label class="form-label" for="signup_default_traffic">Lưu lượng truy cập mặc định</label>
                                                                    <div class="input-group mb-5">
                                                                        <input class="form-control" id="signup_default_traffic" value="{$settings['signup_default_traffic']}" type="text" placeholder="Lưu lượng truy cập" />
                                                                        <span class="input-group-text">GB</span>
                                                                    </div>
                                                                    <label class="form-label" for="signup_default_ip_limit">Giới hạn thiết bị mặc định</label>
                                                                    <div class="input-group mb-5">
                                                                        <input class="form-control" id="signup_default_ip_limit" value="{$settings['signup_default_ip_limit']}" type="text" placeholder="Giới hạn thiết bị" />
                                                                        <span class="input-group-text">IP</span>
                                                                    </div>
                                                                    <label class="form-label" for="signup_default_speed_limit">Giới hạn tốc độ mặc định</label>
                                                                    <div class="input-group mb-5">
                                                                        <input class="form-control" id="signup_default_speed_limit" value="{$settings['signup_default_speed_limit']}" type="text" placeholder="Tốc độ giới hạn" />
                                                                        <span class="input-group-text">Mbps</span>
                                                                    </div>
                                                                    <label class="form-label" for="limit_email_suffix">Giới hạn đuôi email<i class="bi bi-question-circle ms-2" data-bs-toggle="tooltip" title="Sau khi bật chức năng, chỉ có hậu tố email đã đặt mới được phép đăng ký tài khoản"></i></label>
                                                                    <select class="form-select" id="limit_email_suffix" data-control="select2" data-placeholder="Chỉ định đuôi email" data-allow-clear="true" multiple="multiple" data-tags="true" >
                                                                        <option></option>                              
                                                                        {foreach json_decode($settings['limit_email_suffix']) as $email_domain}
                                                                            <option value="{$email_domain}">{$email_domain}</option>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card card-bordered mb-5">
                                                        <div class="card-header">
                                                            <div class="card-title fw-bolder">Cấu hình xác minh người dùng</div>
                                                            <div class="card-toolbar">
                                                                <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('captcha')">
                                                                <i class="bi bi-save"></i>Lưu cấu hình
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row -g-5">
                                                                <div class="col-xxl-6">
                                                                    <label class="form-label" for="captcha_provider">Nhà cung cấp captcha</label>
                                                                    <select id="captcha_provider" class="form-select mb-5" data-control="select2" data-hide-search="true">
                                                                        <option value="turnstile">Turnstile</option>
                                                                    </select>
                                                                    <label class="form-label" for="enable_signup_captcha">Mã xác minh đăng ký</label>
                                                                    <select id="enable_signup_captcha" class="form-select mb-5" data-control="select2" data-hide-search="true">
                                                                        <option value="0">Tắt</option>
                                                                        <option value="1">Bật</option>
                                                                    </select>
                                                                    <label class="form-label" for="enable_signin_captcha">Mã xác minh đăng nhập</label>
                                                                    <select id="enable_signin_captcha" class="form-select" data-control="select2" data-hide-search="true">
                                                                        <option value="0">Tắt</option>
                                                                        <option value="1">Bật</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-xxl-6">
                                                                    <label class="form-label" for="turnstile_sitekey">Turnstile Site Key</label>
                                                                    <input class="form-select mb-5" id="turnstile_sitekey" value="{$settings['turnstile_sitekey']}">
                                                                    <label class="form-label" for="turnstile_secret">Turnstile Secret</label>
                                                                    <input class="form-select mb-5" id="turnstile_secret" value="{$settings['turnstile_secret']}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card card-bordered">
                                                        <div class="card-header">
                                                            <div class="card-title fw-bolder">Cấu hình dịch vụ khách hàng</div>
                                                            <div class="card-toolbar">
                                                                <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('live_chat')">
                                                                <i class="bi bi-save"></i>Lưu cấu hình
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row g-5">
                                                                <div class="col-xxl-6">
                                                                    <label class="form-label" for="live_chat">Hệ thống hỗ trợ khách hàng</label>
                                                                    <select id="live_chat" class="form-control mb-5" data-control="select2" data-hide-search="true">
                                                                        <option value="none">Chưa bật</option>
                                                                        <option value="tawk">Tawk</option>
                                                                        <option value="crisp">Crisp</option>
                                                                        <option value="livechat">LiveChat</option>
                                                                        <option value="mylivechat">MyLiveChat</option>
                                                                    </select>
                                                                    <label class="form-label" for="tawk_id">Tawk</label>
                                                                    <input class="form-control mb-5" id="tawk_id" value="{$settings['tawk_id']}">
                                                                    <label class="form-label" for="crisp_id">Crisp</label>
                                                                    <input class="form-control" id="crisp_id" value="{$settings['crisp_id']}">
                                                                </div>
                                                                <div class="col-xxl-6">
                                                                    <label class="form-label" for="livechat_id">LiveChat</label>
                                                                    <input class="form-control mb-5" id="livechat_id" value="{$settings['livechat_id']}">
                                                                    <label class="form-label" for="mylivechat_id">MyLiveChat</label>
                                                                    <input class="form-control mb-5" id="mylivechat_id" value="{$settings['mylivechat_id']}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>