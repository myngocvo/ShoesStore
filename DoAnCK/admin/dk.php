<?php
    session_start();
    include "class/account_class.php";
    if(array_key_exists('DNGH',$_SESSION))
    {
        $DNGH = $_SESSION['DNGH'];
    }
    else
    {
        $DNGH = null;
    }
    $account = new account;
    if($_SERVER['REQUEST_METHOD']==='POST') 
    {
        
        if(array_key_exists('account_phone',$_POST))
        {
            $account_name = $_POST['account_name'];
            $account_phone = $_POST['account_phone'];
            $account_pass = $_POST['account_pass'];

            $conn = mysqli_connect('localhost', 'root', '', 'caykhe_doanck_sql');
            if(! $conn)
            {
                echo 'Connection error: ' . mysqli_connect_error();
            }
            $sql = "SELECT * FROM tbl_account WHERE account_phone = $account_phone";
            $result = mysqli_query($conn, $sql);
            $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);
            mysqli_close($conn);
            if(count($index) > 0)
                echo "1";
            else
            {
                echo "0";
                $insert_account = $account -> insert_account($account_name, $account_phone, $account_pass);
            }
        }
        else
        {
            $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
            if(! $conn)
            {
                echo 'Connection error: ' . mysqli_connect_error();
            }
            $ten = $_POST['taikhoan'];
            $mk = $_POST['matkhau'];
            
            
            $sql = "SELECT * FROM tbl_account WHERE account_name = '$ten' AND account_pass = '$mk'";
            $result = mysqli_query($conn, $sql);
        
            $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
            mysqli_free_result($result);
            mysqli_close($conn);
            //print_r($index);
            
            if(count($index) > 0)
            {
                $_SESSION['phone'] = $index[0]['account_phone'];
                $file_php = 'cartegory.php';
                if($DNGH != null)
                {
                    $file_php = 'delivery.php';
                    $_SESSION['DNGH'] = null;
                }
                $_SESSION['customer_own'] = $index[0]['customer_own'];
                echo $file_php;
            }
            else
            {
                echo "1";
            }
        }
    }                                                      
?>