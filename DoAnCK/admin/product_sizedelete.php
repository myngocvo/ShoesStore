<?php
    include "class/product_size_class.php";

    $product_size = new product_size;
    $product_id = $_GET['product_id'];
    $product_size_1 = $_GET['product_size'];
    echo "$product_id     $product_id ";
    $delete_product_size =  $product_size -> delete_product_size($product_id,$product_size);
    
?>
