<?php
    $account_phone = $_POST['account_phone'];
    $product_id = $_POST['product_id'];
    $product_size = $_POST['product_size'];
    
    $conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }

    $sql = "SELECT * FROM tbl_cart WHERE account_phone = '$account_phone' and product_id = $product_id and product_size = $product_size";
    $result = mysqli_query($conn, $sql);
    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    mysqli_close($conn);
    if(count($index) > 0)
         echo "1";
    else 
         echo "0";
?>