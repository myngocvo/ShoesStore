<?php
    include "database.php";
    include "header.php";
    include "slider.php";
    include "class/product_size_class.php";
?>

<?php
    $product_size = new product_size;
    $show_product_size = $product_size -> show_product_size();                                                  
?>

<div class="admin-content-right">
        <div class="admin-content-right-cartegory_list">
                <h1>Danh sách Size Sản Phẩm</h1>
                <table>
                    <tr>
                        <th>STT</th>
                        <th>ID</th>
                        <th>Số size</th>
                        <th>Số lượng</th>
                        
                    </tr>
                    <?php
                        if($show_product_size)
                        { $i=0;
                            while ($result = $show_product_size -> fetch_assoc()) { $i++;
                    ?>
                     <tr>
                        <td><?php echo $i ?></td>
                        <td><?php echo $result['product_id'] ?></td>
                        <td><?php echo $result['product_size'] ?></td>
                        <td><?php echo $result['product_size_number'] ?></td>
                        
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