<?php
    include "header.php";
    include "slider.php";
    include "class/product_class.php";
?>

<?php
    $product = new product;
    $show_product = $product -> show_product();                                                  
?>
<html>
<div class="admin-content-right">
        <div class="admin-content-right-cartegory_list">
                <h1>Danh sách Sản Phẩm</h1>
                <table>
                    <tr>
                        <th>STT</th>
                        <th>ID Sản Phẩm</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Loại Danh Mục</th>
                        <th>Loại Sản Phẩm</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                        <th>Khuyến mãi</th>
                        <th>Mô tả</th>
                        <th>Ảnh Sản Phẩm</th>
                        <th>Tùy biến</th>
                    </tr>
                    <?php
                        if($show_product)
                        { $i=0;
                            while ($result = $show_product -> fetch_assoc()) { $i++;
                    ?>
                     <tr>
                        <td><?php echo $i ?></td>
                        <td><?php echo $result['product_id'] ?></td>
                        <td><?php echo $result['product_name'] ?></td>
                        <td><?php echo $result['cartegory_id'] ?></td>
                        <td><?php echo $result['brand_id'] ?></td>
                        <td><?php echo $result['product_number'] ?></td>
                        <td><?php echo $result['product_price'] ?></td>
                        <td><?php echo $result['product_price_new'] ?></td>
                        <td><?php echo $result['product_desc'] ?> </td>
                        <td><img src="uploads/<?php echo ( $result['product_img']) ?>" style="width: 100px; height:100px;"></td>

                        <td style="width: 100px; height:100px;">
                            <a href="product_edit.php?product_id=<?php echo $result['product_id'] ?>">Sửa</a> | 
                            <a href="product_delete.php?product_id=<?php echo $result['product_id'] ?>">Xoá</a>
                        </td>
                     </tr>
                     <?php
                        }
                    }
                     ?>
                </table>
        </div>
</div>
    </section>
</body>
</html>