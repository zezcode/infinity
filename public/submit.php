<?php
// Lấy dữ liệu từ đường link
$money = isset($_GET['money']) ? $_GET['money'] : '';
$name = isset($_GET['name']) ? $_GET['name'] : '';
$pid = isset($_GET['pid']) ? $_GET['pid'] : '';
$out_trade_no = isset($_GET['out_trade_no']) ? $_GET['out_trade_no'] : '';

$out_trade_no = substr($out_trade_no, -8);

// Tạo chuỗi QR Code
$qrCodeData = "https://momosv3.apimienphi.com/api/QRCode?phone=$pid&amount=$money&note=HT4G$out_trade_no";

// In thông tin ra màn hình
echo "Số tài khoản: $pid<br>";
echo "Chủ tài khoản: $name<br>";
echo "Số tiền: {$money}đ<br>";
echo "Nội dung: HT4G$out_trade_no<br>";

// Tạo và hiển thị mã QR với kích thước 100x100px
echo "<img src='$qrCodeData' width='300' height='300'>"
?>
