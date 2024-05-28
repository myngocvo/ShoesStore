<?php
    include "class/product_class.php";
    $product = new product;
    $produc_id = $_POST['product_id'];
    $product_delta = $_POST['product_delta'];
    $update_product = $product -> update_amount($product_id,$product_delta);
   
    
     $conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }
    /*$i = 29;
    while($i < 110)
    {
        
        $sum = 0;
        $sql = "SELECT * FROM tbl_product_size WHERE product_id = $i";
        $result = mysqli_query($conn, $sql);
        $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
        mysqli_free_result($result);
        foreach($index as $Row)
        {
            $sum += $Row['product_size_number'];
        }
        $update_product = $product -> update_amount($i,$sum);
        $i++;
        //echo "$i  $sum  \n";
    }
    mysqli_close($conn);
    echo "OKKKKKKKKKKKKKKKKKKKKKK";
    */
    ?>

    