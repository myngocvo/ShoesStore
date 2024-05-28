<?php
    session_start();
    $account_phone = $_SESSION['phone'];
    
    $conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }

    $sql = "SELECT * FROM tbl_cart JOIN tbl_product_size  ON account_phone = $account_phone and cart_tick = 1 and tbl_cart.product_id = tbl_product_size.product_id and tbl_cart.product_size = tbl_product_size.product_size JOIN tbl_product ON tbl_cart.product_id = tbl_product.product_id ";
    $result = mysqli_query($conn, $sql);
    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    mysqli_close($conn);
    foreach($index as $Row)
    {
        if($Row['product_size_number'] < $Row['cart_number'])
        {
            echo $Row['product_name'];
            echo " chỉ còn ";
            echo $Row['product_size_number'];
            echo " sản phẩm";
            exit;
        }
    }
    echo "1";
?>