<!DOCTYPE html>
<html lang="vi">

<head>
    <title>{$config["website_name"]} Chỉnh sửa máy chủ</title>
    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit" />
    <meta name="description" content="Updates and statistics" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
    <meta http-equiv="expires" content="0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <link href="/theme/zero/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/theme/zero/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/theme/zero/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jsoneditor/9.10.2/jsoneditor.min.css" rel="stylesheet"
        type="text/css">
    <link href="/favicon.png" rel="shortcut icon">
    <link href="/apple-touch-icon.png" rel="apple-touch-icon">
</head>
{include file ='admin/menu.tpl'}
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
    <div class="d-flex flex-column flex-column-fluid mt-10">
        <div id="kt_app_content" class="app-content flex-column-fluid">
            <div id="kt_app_content_container" class="app-container container-xxl">
                <div class="card mb-5">
                    <div class="card-header card-flush">
                        <div class="card-title fw-bolder">Cấu hình máy chủ</div>
                        <div class="card-toolbar">
                            <button class="btn btn-sm btn-primary fw-bold me-3" data-bs-toggle="modal"
                                data-bs-target="#zero_modal_node_config_template">Mẫu cấu hình</button>
                            <button class="btn btn-sm btn-primary fw-bold" onclick="zeroAdminUpdateNode('{$node->id}')">
                                <i class="bi bi-cloud-plus fs-3"></i>Lưu thay đổi
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="custom_config"></div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-xxl-6">
                        <div class="card card-stretch">
                            <div class="card-body">
                                <label class="form-label required" for="name">Tên máy chủ</label>
                                <input class="form-control mb-5" id="name" name="name" type="text"
                                    placeholder="Nhập tên máy chủ" value="{$node->name}">
                                <label class="form-label required" for="server">Địa chỉ máy chủ</label>
                                <input class="form-control mb-5" data-bs-toggle="tooltip"
                                    title="Nhập địa chỉ máy chủ (SubDomain)" id="server" name="server" type="text"
                                    placeholder="Nhập địa chỉ máy chủ" value="{$node->server}">
                                <label class="form-label required" for="node_ip">IP Máy chủ</label>
                                <input class="form-control mb-5" id="node_ip" name="node_ip"
                                    title="Có thể không nhập nếu đã nhập địa chỉ" type="text"
                                    placeholder="Nhập IP máy chủ" value="{$node->node_ip}">
                                <label class="form-label required" for="traffic_rate">Tỉ lệ tính lưu lượng</label>
                                <input class="form-control mb-5" id="traffic_rate" name="traffic_rate" type="text"
                                    placeholder="Nhập tỉ lệ tính lưu lượng" value="{$node->traffic_rate}">
                                <label class="form-label required" for="node_flag">Cờ máy chủ</label>
                                <select class="form-select mb-5" id="node_flag">
                                    <option value="vietnam"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/vn.svg">Việt Nam
                                    </option>
                                    <option value="singapore"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/singapore.svg">Singapore
                                    </option>
                                    <option value="japan"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/japan.svg">Nhật Bản
                                    </option>
                                    <option value="united-states"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/united-states.svg">Hoa
                                        Kỳ</option>
                                    <option value="united-kingdom"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/united-kingdom.svg">
                                        Vương Quốc Anh</option>
                                    <option value="canada"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/canada.svg">Canada
                                    </option>
                                    <option value="hong-kong"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/hong-kong.svg">HongKong
                                    </option>
                                    <option value="south-korea"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/south-korea.svg">Hàn
                                        Quốc</option>
                                    <option value="australia"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/australia.svg">Úc
                                    </option>
                                    <option value="brazil"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/brazil.svg">Brazil
                                    </option>
                                    <option value="france"
                                        data-kt-select2-country="/theme/zero/assets/media/flags/france.svg">Pháp
                                    </option>
                                </select>
                                <label class="form-label required" for="node_type">Loại máy chủ</label>
                                <select class="form-select mb-5" id="node_type" data-control="select2"
                                    data-hide-search="true">
                                    <option value="1">Shadowsocks</option>
                                    <option value="2">VMESS</option>
                                    <option value="3">VLESS</option>
                                    <option value="4">TROJAN</option>
                                    <option value="5">Hysteria</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-xxl-6">
                        <div class="card">
                            <div class="card-body">
                                <label class="form-label required" for="node_class">Cấp độ máy chủ</label>
                                <input class="form-control mb-5" id="node_class" name="node_class" type="number"
                                    placeholder="Nhập cấp độ máy chủ" value="{$node->node_class}">
                                <label class="form-label required" for="node_group">Nhóm máy chủ</label>
                                <input class="form-control mb-5" data-bs-toggle="tooltip"
                                    title="0 Nghĩa là không có nhóm" id="node_group" name="node_group" type="number"
                                    placeholder="Nhập nhóm máy chủ" value="{$node->node_group}">
                                <label class="form-label required" for="node_traffic_limit">Giới hạn lưu lượng</label>
                                <div class="input-group mb-5">
                                    <input class="form-control" data-bs-toggle="tooltip"
                                        title="0 Nghĩa là không giới hạn" id="node_traffic_limit"
                                        name="node_traffic_limit" type="text"
                                        value="{$node->node_traffic_limit/1024/1024/1024}"
                                        placeholder="Nhập giới hạn máy chủ">
                                    <span class="input-group-text">GB</span>
                                </div>
                                <label class="form-label required" for="node_traffic_limit_reset_date">Ngày làm mới lưu
                                    lượng</label>
                                <input class="form-control mb-5" id="node_traffic_limit_reset_date"
                                    name="node_traffic_limit_reset_date" title="Nhập số ngày, 0 tức là không làm mới"
                                    type="text" value="{$node->node_traffic_limit_reset_date}"
                                    placeholder="Nhập ngày làm mới lưu lượng">
                                <label class="form-label required" for="node_speedlimit">Giới hạn tốc độ</label>
                                <div class="input-group mb-5">
                                    <input class="form-control" data-bs-toggle="tooltip"
                                        title="0 Nghĩa là không giới hạn" id="node_speedlimit" name="node_speedlimit"
                                        type="text" value="{$node->node_speedlimit}" placeholder="Nhập giới hạn tốc độ">
                                    <span class="input-group-text">Mbps</span>
                                </div>
                                <label class="form-label required" for="node_sort">Thứ tự sắp xếp</label>
                                <input class="form-control mb-5" data-bs-toggle="tooltip" title="Càng cao càng xếp dưới"
                                    id="node_sort" name="node_sort" type="text" value="{$node->node_sort}"
                                    placeholder="Nhập thứ tự sắp xếp">
                            </div>
                        </div>
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
<div class="modal fade" id="zero_modal_node_config_template" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded">
            <div class="modal-header justify-content-end border-0 pb-0">
                <a class="btn btn-sm btn-light-primary" id="zero_modal_use_selected_template">Dùng mẫu này</a>
            </div>
            <div class="modal-body scroll-y pt-0 pb-5 px-5">
                <div class="mb-5 text-center">
                    <h1 class="mb-3">Mẫu cấu hình</h1>
                </div>
                <div class="mb-5 hover-scroll-x">
                    <div class="d-grid">
                        <ul class="nav nav-tabs flex-nowrap text-nowrap" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0"
                                    data-bs-toggle="tab" data-bs-target="#vmess_ws">vmess+ws</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0"
                                    data-bs-toggle="tab" data-bs-target="#trojan">trojan</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0"
                                    data-bs-toggle="tab" data-bs-target="#vmess_tcp">vmess+tcp</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0"
                                    data-bs-toggle="tab" data-bs-target="#vmess_tcp_tls">vmess+tcp+tls</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0"
                                    data-bs-toggle="tab" data-bs-target="#vless_tcp_reality">vless+tcp+reality</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0 active"
                                    data-bs-toggle="tab" data-bs-target="#ss">SS</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-active-light btn-color-gray-600 btn-active-color-primary rounded-bottom-0"
                                    data-bs-toggle="tab" data-bs-target="#ss_2022">SS-2022</a>
                            <li>
                        </ul>
                    </div>
                </div>

                <div class="tab-content" id="zero_modal_node_template_content">
                    <div class="tab-pane fade show active" id="ss" role="tabpanel">
                        <pre>
                                {
                                    "ss_encryption": "aes-256-gcm",
                                    "offset_port_user": "44",
                                    "offset_port_node": "44"
                                }
                                                                </pre>
                    </div>
                    <div class="tab-pane fade" id="ss_2022" role="tabpanel">
                        <pre>
                                {
                                    "ss_encryption": "2022-blake3-aes-256-gcm",
                                    "server_psk": "",
                                    "offset_port_user": "33",
                                    "offset_port_node": "33"
                                }
                                                                </pre>
                    </div>
                    <div class="tab-pane fade" id="vmess_tcp" role="tabpanel">
                        <pre>
                                {
                                    "offset_port_user": "443",
                                    "offset_port_node": "443",
                                    "network": "tcp"
                                    "host": "dl.kgvn.garenanow.com",
                                }                              
                                                                </pre>
                    </div>
                    <div class="tab-pane fade" id="vmess_ws" role="tabpanel">
                        <pre>
                                {
                                    "offset_port_user": "80",
                                    "offset_port_node": "80",
                                    "network": "ws",
                                    "host": "dl.kgvn.garenanow.com",
                                    "path": "/ht4gvpn"
                                }                             
                                                                </pre>
                    </div>
                    <div class="tab-pane fade" id="vmess_tcp_tls" role="tabpanel">
                        <pre>
                                {
                                    "offset_port_user": "443",
                                    "offset_port_node": "443",
                                    "network": "tcp",
                                    "security": "tls",
                                    "host": "dl.kgvn.garenanow.com"
                                }                           
                                                                </pre>
                    </div>
                    <div class="tab-pane fade" id="vless_tcp_reality" role="tabpanel">
                        <pre>
                                {
                                    "offset_port_user": "443",
                                    "offset_port_node": "443",
                                    "network": "tcp",
                                    "security": "reality",
                                    "reality_config": {
                                        "show": "false",
                                        "dest": "dl.google.com:443",
                                        "proxy_protocol_ver": "0",
                                        "min_client_ver": "",
                                        "max_client_ver": "",
                                        "max_time_diff": "0",
                                        "short_ids": [
                                        "",
                                        "0123456789abcdef"
                                        ],
                                        "fingerprint": "chrome",
                                        "public_key": "",
                                        "private_key": "",
                                        "server_names": [
                                        "bing.com",
                                        "dl.google.com"
                                        ],
                                        "flow": "xtls-rprx-vision"
                                    }
                                }                         
                                                                </pre>
                    </div>
                    <div class="tab-pane fade" id="trojan" role="tabpanel">
                        <pre>
                                {
                                    "offset_port_user": "443",
                                    "offset_port_node": "443",
                                    "network": "tcp",
                                    "host": "dl.kgvn.garenanow.com",
                                    "security": "tls",
                                    "insecure": "true"
                                }                           
                                </pre>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='admin/script.tpl'}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jsoneditor/9.10.2/jsoneditor.min.js"></script>
<script src="/js/sodium.js" async></script>
<script>
    function executeX25519(inputBase64) {

        let privateKey;
        let publicKey;

        // Decode privateKey from base64 if provided
        if (inputBase64) {
            privateKey = sodium.from_base64(inputBase64, sodium.base64_variants.URLSAFE_NO_PADDING);
            if (privateKey.length !== sodium.crypto_scalarmult_SCALARBYTES) {
                console.error("Invalid length of private key.");
                return;
            }
        } else {
            // Generate random privateKey if not provided
            privateKey = sodium.randombytes_buf(sodium.crypto_scalarmult_SCALARBYTES);

            // Adjust bytes according to the X25519 protocol
            privateKey[0] &= 248;
            privateKey[31] &= 127;
            privateKey[31] |= 64;
        }

        // Compute the publicKey
        publicKey = sodium.crypto_scalarmult_base(privateKey);

        // Output base64 encoded privateKey and publicKey
        const privateKeyBase64 = sodium.to_base64(privateKey, sodium.base64_variants.URLSAFE_NO_PADDING);
        const publicKeyBase64 = sodium.to_base64(publicKey, sodium.base64_variants.URLSAFE_NO_PADDING);
        const keys = {
            'private_key': privateKeyBase64,
            'public_key': publicKeyBase64
        }
        return keys;
    }

    function generateBase64Random() {
        const randomValues = new Uint8Array(32);
        window.crypto.getRandomValues(randomValues);
        const base64String = btoa(String.fromCharCode(...randomValues));
        return base64String;
    }

    function generateRandomHex() {
        let chars = '0123456789abcdef';
        let result = '';
        for (let i = 0; i < 16; i++) {
            let randomIndex = Math.floor(Math.random() * chars.length);
            result += chars[randomIndex];
        }
        return result;
    }

    function generate5ShortIDs() {
        let shortids = [];
        for (let i = 0; i < 5; i++) {
            shortids.push(generateRandomHex());
        }
        return shortids;
    }
    const container = document.getElementById('custom_config');
    var options = {
        mode: 'text',
        modes: ['code', 'form', 'text', 'tree', 'view', 'preview'], // allowed modes
        onModeChange: function(newMode, oldMode) {
            console.log('Mode switched from', oldMode, 'to', newMode)
        }
    };
    var editor = new JSONEditor(container, options);
    editor.set({$node->custom_config})

    $('#zero_modal_use_selected_template').on('click', function() {
        const template = $('#zero_modal_node_template_content div.active pre').html();
        const jsonObj = JSON.parse(template);

        if ('reality_config' in jsonObj) {
            const keys = executeX25519();
            jsonObj['reality_config'].private_key = keys.private_key;
            jsonObj['reality_config'].public_key = keys.public_key;
            jsonObj['reality_config']['short_ids'].push(...generate5ShortIDs());
        }
        if ('server_psk' in jsonObj) {
            jsonObj.server_psk = generateBase64Random();
        }
        editor.set(jsonObj);
    });
</script>
<script>
    function zeroAdminUpdateNode(id) {
        $.ajax({
            type: "PUT",
            url: "/{$config['website_admin_path']}/node/update",
            dataType: "JSON",
            data: {
                id,
                name: $('#name').val(),
                server: $('#server').val(),
                node_ip: $('#node_ip').val(),
                traffic_rate: $('#traffic_rate').val(),
                node_flag: $('#node_flag').val(),
                node_type: $('#node_type').val(),
                node_class: $('#node_class').val(),
                node_group: $('#node_group').val(),
                node_traffic_limit: $('#node_traffic_limit').val(),
                node_traffic_limit_reset_date: $('#node_traffic_limit_reset_date').val(),
                node_speedlimit: $('#node_speedlimit').val(),
                node_sort: $('#node_sort').val(),
                custom_config: Object.keys(editor.get()).length <= 0 ? '' : editor.get(),
            },
            success: function(data) {
                if (data.ret === 1) {
                    Swal.fire({
                        text: data.msg,
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    }).then(function(result) {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                } else {
                    getResult(data.msg, '', 'error');
                }
            }
        });
    }
</script>

<script>
    // Format options
    var optionFormat = function(item) {
        if (!item.id) {
            return item.text;
        }

        var span = document.createElement('span');
        var imgUrl = item.element.getAttribute('data-kt-select2-country');
        var template = '';

        template += '<img src="' + imgUrl + '" class="rounded-circle h-20px me-2" alt="image"/>';
        template += item.text;

        span.innerHTML = template;

        return $(span);
    }

    // Init Select2 --- more info: https://select2.org/
    $('#node_flag').select2({
        templateSelection: optionFormat,
        templateResult: optionFormat
    });
</script>
<script>
    $('#node_flag').val("{$node->node_flag}").trigger('change');
    $('#node_type').val("{$node->node_type}").trigger('change');
</script>
</body>

</html>