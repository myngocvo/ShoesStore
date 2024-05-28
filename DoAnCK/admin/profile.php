<?php
session_start();
if ($_SERVER['REQUEST_METHOD']==='POST')
{
    
    $idd = "0";
    if(isset($_POST['13']))
    {
        $idd = "13";
    }
    if(isset($_POST['14']))
    {
        $idd = "14";
    }
    if(isset($_POST['15']))
    {
        $idd = "15";
    }
    if(isset($_POST['16']))
    {
        $idd = "16";
    }
    if(isset($_POST['17']))
    {
        $idd = "17";
    }
    if(isset($_POST['18']))
    {
        $idd = "18";
    }
    if(isset($_POST['19']))
    {
        $idd = "19";
    }
    if(isset($_POST['20']))
    {
        $idd = "20";
    }
    if(isset($_POST['21']))
    {
        $idd = "21";
    }
    if(isset($_POST['23']))
    {
        $idd = "23";
    }
    if(isset($_POST['24']))
            {
                $idd = "24";
            }
            if(isset($_POST['25']))
            {
                $idd = "25";
            }
    if(array_key_exists('26',$_POST))
    {
        $keyy = $_POST['26'];
        $sql = "SELECT * FROM tbl_product WHERE product_name LIKE '%$keyy%'";
    }
    if($idd != "0")
    {
        $_SESSION['id'] = $idd;
        $file_php = 'cartegory.php';
        header("Location: $file_php");
        exit;
    }
}
?>
<?php
    $phone = $_SESSION['phone'];
    $conn = mysqli_connect('localhost', 'root', '', 'website_ivydemo');
    if(! $conn)
    {
        echo 'Connection error: ' . mysqli_connect_error();
    }

    $sql = "SELECT * FROM tbl_account WHERE account_phone = $phone";
    $result = mysqli_query($conn, $sql);
    $index = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);

    $sq = "SELECT * FROM tbl_bill_desc b1 JOIN tbl_bill b2 ON b1.bill_code = b2.bill_code and b2.account_phone = $phone
    JOIN tbl_product b3 ON b1.product_id = b3.product_id";
    $resul = mysqli_query($conn, $sq);
    $inde = mysqli_fetch_all($resul, MYSQLI_ASSOC);
    mysqli_free_result($resul);

    mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="Website Icon" type="png" href="image/logoweb.png">
    <script src="https://kit.fontawesome.com/1147679ae7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <link rel="stylesheet" href="style copy.css">
    <title>Trang cá nhân | CayKheShoes</title>
</head>
<body>
<header>
    <div class="logo">
        <img src="image/logo.png" alt="">
    </div>

    <form action ="" method = "post">
        <div class="menu_responsive"><i class="fas fa-bars"></i></div>
        <div class="menu" >
            <li><a href="index1.php" >TRANG CHỦ</a></li>
            <li><button name = "24" type = "submit">NỮ</button>
              <ul class="sub-menu"> 
                    <button name = "13" type = "submit">GIÀY THỂ THAO</button>
                    <button name = "14" type = "submit">GIÀY CAO GÓT</button>
                    <button name = "15" type = "submit">GIÀY SANDAL</button>
                    <button name = "16" type = "submit">GIÀY BÚP BÊ</button>
                    <button name = "17" type = "submit">DÉP NỮ</button> 
                </ul>      
            </li>

            <li><button name = "25" type = "submit">NAM</button>
                <ul class="sub-menu"> 
                    <button name = "18" type = "submit">GIÀY THỂ THAO</button>
                    <button name = "19" type = "submit">GIÀY TÂY</button>
                    <button name = "20" type = "submit">GIÀY SANDAL</button>
                    <button name = "21" type = "submit">DÉP NAM</button>  
                </ul> 
            </li>
            <li><button name = "23" type = "submit">SALE</button></li> 
            <li><button>HÀNG BÁN CHẠY</button></li> 
            <li><button>THÔNG TIN</button></li> 
        </div>
    </form>

    <div class="others">
    <li><input id = "26" placeholder="Tìm kiếm" type="text"> <i onclick = "TimKiem1()" class="fas fa-search" ></i></li>
        <li><a class="fa fa-user" <?php if($_SESSION['phone'] != null ) 
                echo "href=\"profile.php\"";
              else
                echo "href=\"account_add.php\"";
         ?>></a></li>
        
        <li><a class="fa fa-shopping-cart" <?php if($_SESSION['phone'] != null) echo "href=\"cart.php\"" ?>></a></li>
        <li><a class="fa-solid fa-screwdriver-wrench" style="color: #202124;" <?php if($_SESSION['customer_own'] == 1 ) echo "href = cartegoryadd.php";?>></a></li>

    </div>
</header>
<!-- ----profile--- -->
<div class="profile">
    <div class="container">
        <div class="profile-content">
            <div class="profile-content-left">
                <div class="profile-content-left-top">
                    <div class="change-avatar">
                        <img src="uploads/<?php echo ( $index[0]['customer_ava']) ?>" alt="avatar" class="avt" id="avt-img">
                        <input type="file" name="product_img" id="input-file" class="input-label" onchange="handleFileChange()">
                    </div>
                    <button><img src="image/edit.png" alt="" style="width: 20px;">Sửa hồ sơ</button>
                </div>
                
                <div class="profile-content-left-bottom">
                    <div class="profile-content-left-bottom-item hoso">
                        <i class="fas fa-user"></i>
                        <p>Hồ sơ</p>
                    </div>
                    <div class="profile-content-left-bottom-item avatar">
                        <i class="fas fa-camera-retro"></i>
                        <p class="btn-change" onclick="document.querySelector('#input-file').click()">Đổi ảnh đại diện</p>
                    </div>
                    <div class="profile-content-left-bottom-item doimatkhau">
                        <i class="fas fa-key"></i>
                        <p>Đổi mật khẩu</p>
                    </div>
                    <div class="profile-content-left-bottom-item donmua">
                        <i class="far fa-file-alt" style="color: black;"></i>
                        <p>Đơn mua</p>
                    </div>
                    <div class="profile-content-left-bottom-item logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <p onclick="LogOut()">Đăng xuất</p>
                    </div>
                </div>
            </div>
            <div class="profile-content-right">
                <div class="profile-hosocuatui">
                    <div class="profile-content-right-top">
                        <h3>Hồ sơ của tôi</h3>
                        <div class="profile-content-right-input">
                            <div class="profile-content-right-input-item">
                                <label for="">Tên đăng nhập</label>
                                <input id = "TenDN" type="text" value="<?php echo $index[0]['account_name'] ?>">
                            </div>
                            <div class="profile-content-right-input-item">
                                <label for="">Họ và tên</label>
                                <input id = "Name" type="text" value = "<?php echo $index[0]['customer_name'] ?>">
                            </div>
                            <div class="profile-content-right-input-item">
                                <label for="">Số điện thoại</label>
                                <input id = "sdt" type="text" value="<?php echo $phone; ?>">
                            </div>
                            <div class="profile-content-right-input-item gender">
                                <label for="">Giới tính</label>
                                <input type="radio" name="gender" id = "Nu" <?php if($index[0]['sex'] == 1) echo "checked"; ?> ><label for="">Nữ</label>
                                <input type="radio" name="gender" id = "Nam" <?php if($index[0]['sex'] == 0) echo "checked"; ?>><label for="">Nam</label>
                                <input type="radio" name="gender" id = "Khac" <?php if($index[0]['sex'] == 2) echo "checked"; ?>><label for="">Khác</label> 
                            </div>
                            <div class="profile-content-right-input-item">
                                <label for="">Ngày sinh</label>
                                <input id = "NgaySinh" type="date" pattern="\d{4}/\d{2}/\d{2}" value="<?php echo $index[0]['customer_date'] ?>"/>
                            </div>
                        </div>
                       
                    </div>
                    <div class="profile-content-right-bottom">
                        <h3>Thông tin nhận hàng</h3>
                        <div class="profile-content-right-bottom-item">
                            <label>Tỉnh/Thành Phố</label>
                            <select class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                                <option id = "Tinh" value="" selected><?php if($index[0]['customer_province'] != "") echo $index[0]['customer_province']; else echo "--Tỉnh/Thành Phố--" ?></option>           
                            </select>
                        </div>
                        <div class="profile-content-right-bottom-item">
                            <label>Quận/Huyện</label>
                            <select class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                                <option id = "Quan" value="" selected><?php if($index[0]['customer_district'] != "") echo $index[0]['customer_district']; else echo "--Quận/Huyện--" ?></option>
                            </select>
                        </div>
                        <div class="profile-content-right-bottom-item">
                            <label for="">Phường/Xã</label>
                            <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                                <option id = "Phuong" value="" selected><?php if($index[0]['customer_ward'] != "") echo $index[0]['customer_ward']; else echo "--Phường/Xã--" ?></option>
                            </select>
                            
                        </div>
                        <div class="profile-content-right-bottom-item diachi">
                                <label for="">Địa chỉ</label>
                                <input type="text" id = "DiaChi" value="<?php echo $index[0]['customer_address']; ?>">
                        </div>
                        <div class="profile-content-right-bottom-item luu">
                            <button onclick = "LuuTT()">Lưu thông tin</button>
                        </div>
                            
                    </div>
                </div>
                    
                <div class="profile-doimatkhau">
                    <h2>-- Đổi mật khẩu --</h2>
                    <div class="profile-doimatkhau-con">
                        
                        <div class="profile-doimatkhau-input">
                            <label for="">Nhập lại mật khẩu cũ</label>
                            <input type="password" id = "passcu">
                        </div>
                        <div class="profile-doimatkhau-input">
                            <label for="">Mật khẩu mới</label>
                            <input type="password" id = "passmoi">
                        </div>
                        <div class="profile-doimatkhau-input">
                            <label for="">Xác nhận lại mật khẩu</label>
                            <input type="password" id = "repass">
                        </div>

                        <div class="profile-doimatkhau-input button">
                            <button id = "<?php echo $index[0]['account_pass']?>" onclick = "DoiMK(this.id)">Lưu mật khẩu</button>
                        </div>
                    </div>
                </div>

                <div class="profile-donmua">
                    <h3>Đơn mua</h3>
                    <div class="profile-donmua-item">
                        <table>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Size</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                            <?php $tong = 0; foreach($inde as $Row) {?>
                            <tr>
                                <td><img src= "uploads/<?php echo ( $Row['product_img']) ?>" alt=""></td>
                                <td><p><?php echo htmlspecialchars( $Row['product_name'])?></p></td>
                                <td><p><?php echo htmlspecialchars( $Row['bill_desc_size'])?></p></td>
                                <td><p><?php echo htmlspecialchars( $Row['bill_desc_number'])?></p></td>
                                <td><p>
                                <?php
                              $s = $Row['product_price']* ( 100 - $Row['product_price_new'])/100;
                              $tong += $s;
                              //echo "$ss ";
                              $num = array();
                              $i = 0;
                              while ($s > 0)
                              {
                                  $num[$i] = $s%10;
                                  
                                  $s = intval($s/10);
                              
                                  $i++;
                              }
                              
                              while($i > 0 )
                              {
                                  $i--;
                                  echo $num[$i];
                                  if($i !=0 and $i%3 == 0)
                                      echo ".";
                              }
                              //echo htmlspecialchars( $roww['product_price'])
                              ?>
                                <sup>đ</sup></p></td>
                            </tr>
                            <?php } ?>
                            
                        </table>
                    </div>
                        <p> Tổng thanh toán: <span>
                            <?php
                             $s = $tong;
                            //echo "$ss ";
                            $num = array();
                            $i = 0;
                            while ($s > 0)
                            {
                                $num[$i] = $s%10;
                                
                                $s = intval($s/10);
                            
                                $i++;
                            }
                            
                            while($i > 0 )
                            {
                                $i--;
                                echo $num[$i];
                                if($i !=0 and $i%3 == 0)
                                    echo ".";
                            }
                             ?> <sup>đ</sup> </span></p>
                </div>
                
            </div>
        </div>
    </div>
</div>


<!-- ------footer ------>
<section class="mail-container">
    <img src="image/logo.png" alt="" ><br>
    <p>Nhận bản tin từ CAYKHE Shoes Store</p>
    <input type="text" placeholder="Nhập mail của bạn..." >
</section>

<div class="footer-top">
  <li>Liên hệ</li>
  <li>Tuyển dụng</li>
  <li>Giới thiệu</li>
  <li>
    <a href="" class="fab fa-facebook"></a>
    <a href="" class="fab fa-twitter"></a>
    <a href="" class="fab fa-youtube"></a>
  </li>
</div>
<script src="script.js"></script>
</body>

</html>