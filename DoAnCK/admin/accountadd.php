<?php
    include "header.php";
    include "slider.php";
    include "class/account_class.php";
?>

<?php
    $account = new account;
    if($_SERVER['REQUEST_METHOD']==='POST')
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
?>

<div class="admin-content-right">
            <div class="admin-content-right-cartegory_add">
                <h1>Đăng nhập</h1>
                <form action="" method="post">
                    <input name="account_name" type="text" placeholder="Nhập tên đăng nhập">
                    <input name="account_phone" type="text" placeholder="Nhập số điện thoại">
                    <input name="account_pass" type="text" placeholder="Nhập password">
                    <button type="submit">Thêm</button>
                </form>
            </div>
        </div>
    </section>
</body>
</html>