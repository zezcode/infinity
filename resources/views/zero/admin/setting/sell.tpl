                                                <div class="tab-pane fade" id="zero_admin_nav_sell" role="tabpanel" aria-labelledby="zero_admin_nav_sell_tab" tabindex="0">
                                                    <div class="row g-5">
                                                        <div class="col-xxl-6">
                                                            <div class="card card-bordered">
                                                                <div class="card-header">
                                                                    <div class="card-title d-flex flex-column">
                                                                        <span class="fw-bolder">Phân bổ tiền tệ</span>
                                                                        <span class="text-gray-400 pt-1 fw-semibold fs-6">Nhà cung cấp API: <a href="https://app.abstractapi.com">https://app.abstractapi.com</a></span>
                                                                    </div>
                                                                    <div class="card-toolbar">
                                                                        <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('currency')">
                                                                        <i class="bi bi-save"></i>Lưu cấu hình
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <div class="card-body">
                                                                    <label class="form-label" for="enable_currency">Kích hoạt các loại tiền tệ khác (Mặc định là VND)</label>
                                                                    <select class="form-select mb-5" id="enable_currency" data-control="select2" data-hide-search="true"> 
                                                                        <option value="0" {if $settings['enable_currency'] == false}selected{/if}>Tắt</option>
                                                                        <option value="1" {if $settings['enable_currency'] == true}selected{/if}>Bật</option>
                                                                    </select>
                                                                    <label class="form-label" for="currency_unit">Đơn vị tiền tệ</label>
                                                                    <select class="form-select mb-5" id="currency_unit">
                                                                        <option value="VND" data-kt-select2-country="/theme/zero/assets/media/flags/vn.svg">VND</option>
                                                                        <option value="USD" data-kt-select2-country="/theme/zero/assets/media/flags/united-states.svg">USD</option>
                                                                        <option value="JPY" data-kt-select2-country="/theme/zero/assets/media/flags/japan.svg">JPY</option>
                                                                        <option value="SGD" data-kt-select2-country="/theme/zero/assets/media/flags/singapore.svg">SGD</option>
                                                                        <option value="EUR" data-kt-select2-country="/theme/zero/assets/media/flags/european-union.svg">EUR</option>
                                                                    </select>
                                                                    <label class="form-label" for="currency_exchange_rate">Tỉ lệ quy đổi</label>
                                                                    <input class="form-control mb-5" id="currency_exchange_rate" value="{$settings['currency_exchange_rate']}" type="text" placeholder="Tỷ lệ quy đổi" />
                                                                    <label class="form-label" for="currency_exchange_rate_api_key">API KEY Tỉ lệ quy đổi</label>
                                                                    <input class="form-control mb-5" id="currency_exchange_rate_api_key" value="{$settings['currency_exchange_rate_api_key']}" type="text" placeholder="API KEY" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xxl-6">
                                                            <div class="card card-bordered">
                                                                <div class="card-header">
                                                                    <div class="card-title fw-bolder">Cấu hình rút tiền</div>
                                                                    <div class="card-toolbar">
                                                                        <button class="btn btn-light-primary btn-sm" type="button" onclick="updateAdminConfigSettings('withdraw')">
                                                                        <i class="bi bi-save"></i>Lưu cấu hình
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <div class="card-body">
                                                                    <label class="form-label" for="enable_withdraw">Cho phép rút tiền</label>
                                                                    <select class="form-select mb-5" id="enable_withdraw" data-control="select2" data-hide-search="true">
                                                                        <option value="0">Tắt</option>
                                                                        <option value="1">Bật</option>
                                                                    </select>
                                                                    <label class="form-label" for="withdraw_method">Phương thức rút tiền</label>
                                                                    <select class="form-select mb-5" id="withdraw_method">
                                                                        <option value="USDT" data-kt-select2-image="/theme/zero/assets/media/payment_logo/tether.svg">USDT</option>
                                                                    </select>
                                                                    <label class="form-label" for="withdraw_minimum_amount">Số tiền rút tối thiểu</label>
                                                                    <input class="form-control mb-5" id="withdraw_minimum_amount" value="{$settings['withdraw_minimum_amount']}" type="number" placeholder="Số tiền rút tối thiểu" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>