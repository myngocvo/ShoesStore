   <?php
    include "database.php";
    include "header.php";
    include "slider.php";
    include "class/product_size_class.php";
    ?> 

<?php
    $product_size = new product_size;
    if($_SERVER['REQUEST_METHOD']==='POST')
    {
        if(isset($_POST['add']))
        {
        $product_id = intval( $_POST['product_id']);
        $product_size_1 = intval($_POST['product_size']);
        $product_size_number = intval($_POST['product_size_number']);
        $id = 0;
        
       $insert_product_size = $product_size -> insert_product_size($product_id , $product_size_1, $product_size_number);
        //     $i = 29;
        //    while($i < 110)
        //    {
        //         $j = 35;
        //         while($j < 40)
        //         {
        //             $insert_product_size = $product_size -> insert_product_size($i, $j, ($i*$j)%30);
        //             $j++;
        //         }
        //         $i++;
        //    }
        }

        if(isset($_POST['edit']))
        {
            $product_id = intval( $_POST['product_id']);
            $product_size_1 = intval($_POST['product_size']);
            $product_size_number = intval($_POST['product_size_number']);
            $insert_product_size = $product_size -> update_product_size($product_id , $product_size_1, $product_size_number);
        }
        if(isset($_POST['delete']))
        {
            $product_id = intval( $_POST['product_id']);
            $product_size_1 = intval($_POST['product_size']);
            $insert_product_size = $product_size -> delete_product_size($product_id , $product_size_1);
        }
    }  
                                                     
?>  

 <div class="admin-content-right">
            <div class="admin-content-right-cartegory_add">
                <h1>Size sản phẩm</h1>
                <form action="" method="post">
                    <input name="product_id" type="text" placeholder="Nhập id sản phẩm">
                    <input name="product_size" type="text" placeholder="Nhập size sản phẩm">
                    <input name="product_size_number" type="text" placeholder="Nhập số lượng">
                    <button name = "add" type="submit">Thêm</button>
                    <button name ="edit" type="submit">Sửa</button>
                    <button name ="delete" type="submit">Xóa</button> 
                </form>
            </div>
        </div>
    </section>
</body>
</html>  










