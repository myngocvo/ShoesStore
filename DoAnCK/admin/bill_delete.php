<?php
    include "database.php";
    include "class/bill_class.php";
    include "class/bill_desc_class.php";

    $bill = new bill;
    $bill_desc = new bill_desc;
    $bill_code = $_GET['bill_code'];
    $delete_bill_desc = $bill_desc -> delete_bill($bill_code);
    $delete_bill =  $bill -> delete_bill($bill_code);
        
?>
