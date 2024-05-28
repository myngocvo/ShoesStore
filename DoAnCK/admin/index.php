<?php
    $conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }
    
    $sql = 'SELECT * FROM tbl_product WHERE cartegory_id = 13 AND brand_id = 14';
    $result = mysqli_query($conn, $sql);

    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    mysqli_close($conn);
    //print_r($index);
    
    foreach($index as $roww)
    {
        echo $roww['product_name'];
        echo "<br>";
    }
?>