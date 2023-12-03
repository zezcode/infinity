                                                <div class="tab-pane fade" id="zero_admin_nav_tg" role="tabpanel" aria-labelledby="zero_admin_nav_tg_tab" tabindex="0">
                                                    <div class="row g-5">
                                                        <div class="col-xxl-6">
                                                            <div class="card card-bordered">
                                                                <div class="card-header">
                                                                    <div class="card-title fw-bolder">Cấu hìnhTelegram</div>
                                                                    <div class="card-toolbar">
                                                                        <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('telegram')">
                                                                        <i class="bi bi-save"></i>Lưu cấu hình
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <div class="card-body">
                                                                    <label class="form-label" for="telegram_group_id">ID Nhóm</label>
                                                                    <input class="form-control mb-5" id="telegram_group_id" value="{$settings['telegram_group_id']}" type="text" placeholder="ID" />
                                                                    <label class="form-label" for="telegram_group_url">Link nhóm</label>
                                                                    <input class="form-control mb-5" id="telegram_group_url" value="{$settings['telegram_group_url']}" type="text" placeholder="URL" />
                                                                    <label class="form-label" for="telegram_channel_id">ID Kênh</label>
                                                                    <input class="form-control mb-5" id="telegram_channel_id" value="{$settings['telegram_channel_id']}" type="text" placeholder="ID Kênh" />
                                                                    <label class="form-label" for="telegram_admin_id">ADMIN ID</label>
                                                                    <select class="form-select" id="telegram_admin_id" data-control="select2" data-close-on-select="true" data-placeholder="Chọn quản trị viên" data-allow-clear="true" multiple="multiple">
                                                                        <option></option>
                                                                        {foreach $adminUsers as $adminUser}
                                                                            <option value={$adminUser->telegram_id}>{$adminUser->email}</option>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xxl-6">
                                                            <div class="card card-bordered">
                                                                <div class="card-header">
                                                                    <div class="card-title fw-bolder">Telegram BOT</div>
                                                                    <div class="card-toolbar">
                                                                        <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('telegram_bot')">
                                                                        <i class="bi bi-save"></i>Lưu cấu hình
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <div class="card-body">
                                                                    <label class="form-label" for="enable_telegram_bot">Bật/tắt BOT</label>
                                                                    <select class="form-select mb-5" id="enable_telegram_bot" data-control="select2" data-hide-search="true">
                                                                        <option value="0" {if $settings['enable_telegram_bot'] == false} selected{/if}>Tắt</option>
                                                                        <option value="1" {if $settings['enable_telegram_bot'] == true} selected{/if}>Bật</option>
                                                                    </select>
                                                                    <label class="form-label" for="telegram_bot_token">BOT TOKEN</label>
                                                                    <input class="form-control mb-5" id="telegram_bot_token" value="{$settings['telegram_bot_token']}" type="text" placeholder="TOKEN" />
                                                                    <label class="form-label" for="telegram_bot_id">BOT ID</label>
                                                                    <input class="form-control mb-5" id="telegram_bot_id" value="{$settings['telegram_bot_id']}" type="text" placeholder="BOT ID" />
                                                                    <label class="form-label" for="telegram_bot_request_token">TOKEN Yêu cầu</label>
                                                                    <input class="form-control mb-5" id="telegram_bot_request_token" value="{$settings['telegram_bot_request_token']}" type="text" placeholder="TOKEN" />
                                                                    <label class="form-label" for="enable_push_top_up_message">BOT gửi thông báo nạp tiền</label>
                                                                    <select class="form-select mb-5" id="enable_push_top_up_message" data-control="select2" data-hide-search="true">
                                                                        <option value="0">Tắt</option>
                                                                        <option value="1">Bật</option>
                                                                    </select>
                                                                    <label class="form-label" for="enable_push_ticket_message">BOT gửi yêu cầu hỗ trợ</label>
                                                                    <select class="form-select mb-5" id="enable_push_ticket_message" data-control="select2" data-hide-search="true">
                                                                        <option value="0">Tắt</option>
                                                                        <option value="1">Bật</option>
                                                                    </select>
                                                                    <label class="form-label" for="enable_push_system_report">BOT thông báo tình trạng hoạt động của hệ thống</label>
                                                                    <select class="form-select mb-5" id="enable_push_system_report" data-control="select2" data-hide-search="true">
                                                                        <option value="0">Tắt</option>
                                                                        <option value="1">Bật</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>