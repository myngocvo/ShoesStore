<?php 
    include "database.php";
    include "header.php";
    include "slider.php";
    include "class/bill_class.php";
?>

<?php
    $bill = new bill;
    $show_bill = $bill -> show_bill();
?>

<div class="admin-content-right">
        <div class="admin-content-right-cartegory_list">
                <h1>Danh sách Hóa Đơn</h1>
                <table>
                    <tr>
                        <th>STT</th>
                        <th>Mã hóa đơn</th>
                        <th>SĐT</th>
                        <th>Tổng tiền</th>
                        <th>Thời gian</th>
                        <th>Tùy biến</th>
                    </tr>
                    <?php
                        if($show_bill)
                        { $i=0;
                            while ($result = $show_bill -> fetch_assoc()) { $i++;
                    ?>
                     <tr>
                        <td><?php echo $i ?></td>
                        <td><?php echo $result['bill_code'] ?></td>
                        <td><?php echo $result['account_phone'] ?></td>
                        <td><?php echo $result['bill_money'] ?></td>
                        <td><?php echo $result['bill_date'] ?></td>
                        <td>
                            <a href="bill_delete.php?bill_code=<?php echo $result['bill_code'] ?>">Xoá</a>
                        </td>
                     </tr>
                     <?php
                        }
                    }
                     ?>
                </table>
        </div>
</div>