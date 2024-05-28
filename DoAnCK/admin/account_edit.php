
<?php
	include "header.php";
	include "class/account_class2.php";
?>
<?php
    $account = new account2;
    $account_phone = $_POST['account_phone'];
    $account_name = $_POST['account_name'];
    $customer_name = $_POST['customer_name'];
    $customer_date = $_POST['customer_date'];
    $customer_province = $_POST['customer_province'];
    $customer_district = $_POST['customer_district'];
    $customer_ward = $_POST['customer_ward'];
    $customer_address = $_POST['customer_address'];
    $sex = $_POST['sex'];
    $insert_account = $account -> update_account2( $account_phone,$account_name,$customer_name,$customer_province,$customer_district,$customer_ward,$customer_address,$sex,$customer_date );
    header("Location: profile.php");
    exit;
?>