<?php
    session_start();
    $product_id = $_POST['product_id'];
    $product_number = $_POST['product_number'];
    $product_size = $_POST['product_size'];
    
    $conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }

    $sql = "SELECT * FROM tbl_product_size WHERE product_id = $product_id and product_size = $product_size";
    $result = mysqli_query($conn, $sql);
    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    mysqli_close($conn);
    if($index[0]['product_size_number'] >= $product_number)
    {
         echo "0";
    }
    else 
         echo $index[0]['product_size_number'];
?>