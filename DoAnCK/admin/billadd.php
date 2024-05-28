
<?php
include "class/bill_class.php";
include "class/bill_desc_class.php";
include "class/product_size_class.php";
include "class/product_class.php";
session_start();
    $bill = new bill;
    $account_phone = $_SESSION['account_phone'];
    $bill_money = $_POST['bill_money'];
    $insert_bill = $bill -> insert_bill($account_phone, $bill_money);
    $bill_desc = new bill_desc;
    $product_id = $_SESSION['vr'];
    $bill_desc_number = $_SESSION['product_number'];
    $bill_desc_size = $_SESSION['product_size'];
    $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }
    $sql = "SELECT * FROM tbl_bill WHERE account_phone = $account_phone and bill_flag = 0";
    $result = mysqli_query($conn, $sql);
    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    
    $sql = "SELECT * FROM tbl_product WHERE product_id = $product_id";
    $rs = mysqli_query($conn, $sql);
    $ind = mysqli_fetch_all($rs, MYSQLI_ASSOC);
    mysqli_free_result($rs);
    mysqli_close($conn);
    $bill_code = $index[0]['bill_code'];
    $bill_money = $ind[0]['product_price'] * $bill_desc_number * (100 + $ind[0]['product_tax'])/100;
    $bill_desc_sale = $ind[0]['product_price'] * $bill_desc_number * (100 + $ind[0]['product_tax'])/100 * ($ind[0]['product_price_new'])/100;
    $insert_bill_desc = $bill_desc -> insert_bill_desc($bill_code, $product_id, $bill_desc_number, $bill_money, $bill_desc_sale,$bill_desc_size);
    $complete = $bill -> complete_bill($bill_code);
    $product_size_cl = new product_size;
    $bill_desc_number = -$bill_desc_number;
    $update = $product_size_cl -> update_product_size($product_id,$bill_desc_size,$bill_desc_number);
    $product = new product;
    $update_product = $product -> update_amount($product_id,$bill_desc_number);

    echo "1";                                               
?>
