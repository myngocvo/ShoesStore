
//------cartegory--------
const itemsliderbar= document.querySelectorAll(".cartegory-left-li")
itemsliderbar.forEach(function (menu, index) {
    menu.addEventListener("click", function () {
       menu.classList.toggle("block") 
    })
    
})

$(document).ready(() => {
    $(".chat-btn").click(() => {
        $(".chat-box").slideToggle("slow")
    })
})


function DoiMK(pass)
{
    var passcu = document.getElementById("passcu").value;
    var passmoi = document.getElementById("passmoi").value;
    var repass = document.getElementById("repass").value;
    var sdt = document.getElementById("sdt").value;
    if(passcu == pass)
    {
        if(passmoi == repass)
        {
            var form = document.createElement("form");
            form.method = "POST";
            form.action = "account_update_pass.php";
        
            var input1 = document.createElement("input");
            input1.type = "hidden";
            input1.name = "account_phone";
            input1.value = sdt;

            var input2 = document.createElement("input");
            input2.type = "hidden";
            input2.name = "account_pass";
            input2.value = passmoi;

            form.appendChild(input1);
            form.appendChild(input2);
            document.body.appendChild(form);
            alert("Cập nhật mật khẩu thành công");
            form.submit();

        }
        else
        {
            alert("Mật khẩu mới không khớp nhau");
        }
    }
    else
    {
        alert("Bạn đã nhập sai mật khẩu cũ");
    }
}

function LuuTT()
{
    
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "account_edit.php";
  
    var input1 = document.createElement("input");
    input1.type = "hidden";
    input1.name = "account_phone";
    input1.value = document.getElementById("sdt").value;
  
    var input2 = document.createElement("input");
    input2.type = "hidden";
    input2.name = "account_name";
    input2.value = document.getElementById("TenDN").value;
  
    var input3 = document.createElement("input");
    input3.type = "hidden";
    input3.name = "customer_name";
    input3.value = document.getElementById("Name").value;

    var input4 = document.createElement("input");
    input4.type = "hidden";
    input4.name = "customer_date";
    input4.value = document.getElementById("NgaySinh").value;

    var input5 = document.createElement("input");
    input5.type = "hidden";
    input5.name = "customer_province";
    var selectElement = document.getElementById("city");
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var selectedValue = selectedOption.value;
    var selectedText = selectedOption.textContent;
    input5.value = selectedText;

    var input6 = document.createElement("input");
    input6.type = "hidden";
    input6.name = "customer_district";
    var selectElement2 = document.getElementById("district");
    var selectedOption2 = selectElement2.options[selectElement2.selectedIndex];
    var selectedValue2 = selectedOption2.value;
    var selectedText2 = selectedOption2.textContent;
    input6.value = selectedText2;

    var input7 = document.createElement("input");
    input7.type = "hidden";
    input7.name = "customer_ward";
    var selectElement3 = document.getElementById("ward");
    var selectedOption3 = selectElement3.options[selectElement3.selectedIndex];
    var selectedValue3 = selectedOption3.value;
    var selectedText3 = selectedOption3.textContent;
    input7.value = selectedText3;

    var input8 = document.createElement("input");
    input8.type = "hidden";
    input8.name = "customer_address";
    input8.value = document.getElementById("DiaChi").value;

    var input9 = document.createElement("input");
    input9.type = "hidden";
    input9.name = "sex";
    input9.value = 0;
    if(document.getElementById("Nu").checked)
        input9.value = 1;
    if(document.getElementById("Khac").checked)
        input9.value = 2;
    
    alert(input1.value + " " + input2.value + input3.value + " " + input4.value + input5.value + " " + input6.value + input7.value + " " + input8.value + " " + input9.value );

    form.appendChild(input1);
    form.appendChild(input2);
    form.appendChild(input3);
    form.appendChild(input4);
    form.appendChild(input5);
    form.appendChild(input6);
    form.appendChild(input7);
    form.appendChild(input8);
    form.appendChild(input9);
    document.body.appendChild(form);
    
    form.submit();
}
var soluong = 1;
function Soluong(sl) 
{
    soluong = sl;
}
var dd = "0";

function Size(idd)
{
    if(dd != "0")
    {
        document.getElementById(dd).style.backgroundColor = "white";
        document.getElementById(dd).style.color = 'black';
    }
    document.getElementById("vui").innerHTML = "";
    dd = idd;
    document.getElementById(idd).style.backgroundColor = "#1e1174";
    document.getElementById(idd).style.color = 'white';
}


  
var mvr = null;
function Call(x) {
    var myVariable = x;
    mvr = x;
    window.location.href = "product.php?variable=" + encodeURIComponent(mvr);
}
function SuaCart(idd)
{
   // alert("okok");
    
    var arr = idd.split(" ");
    var id = arr[0];
    var size = arr[1];
    var phone = arr[2];
    var check =  arr[3];
    var idcheck ="";
    var idnumber = "";
    
    if(arr[3] == "number")
    {
        idnumber = idd;
        idcheck = idd.replace("number", "tick");

    }
    else
    {
        //alert("nay");
        idcheck = idd;
        idnumber = idd.replace("tick", "number");
        ticks = document.getElementById(idcheck);
    }

    var form = document.createElement("form");
    form.method = "POST";
    form.action = "cart_edit.php";
    
    var input1 = document.createElement("input");
    input1.type = "hidden";
    input1.name = "account_phone";
    input1.value = phone;
  
    var input2 = document.createElement("input");
    input2.type = "hidden";
    input2.name = "product_id";
    input2.value = id;
  
    var input3 = document.createElement("input");
    input3.type = "hidden";
    input3.name = "product_size";
    input3.value = size;

    var input4 = document.createElement("input");
    input4.type = "hidden";
    input4.name = "cart_number";
    input4.value = document.getElementById(idnumber).value;

    var input5 = document.createElement("input");
    input5.type = "hidden";
    input5.name = "cart_tick";
    var ticks = document.getElementById(idcheck);
    if(ticks.checked)
    {
        input5.value = 1;
    }
    else
    {
        input5.value = 0;
    }
   // alert(input5.value);
    form.appendChild(input1);
    form.appendChild(input2);
    form.appendChild(input3);
    form.appendChild(input4);
    form.appendChild(input5);
    document.body.appendChild(form);
    
    form.submit();
    
}
function Xoacart(idd) 
{
    alert("Xóa thành công");
    var span = document.getElementById(idd);
    var str = span.dataset.value;
    var arr = str.split(" ");
    var size = arr[0];
    var phone = arr[1];
    var form = document.createElement("form");
    form.method = "POST";
    form.action = "cart_delete.php";
  
    var input1 = document.createElement("input");
    input1.type = "hidden";
    input1.name = "account_phone";
    input1.value = phone;
  
    var input2 = document.createElement("input");
    input2.type = "hidden";
    input2.name = "product_id";
    input2.value = idd;
  
    var input3 = document.createElement("input");
    input3.type = "hidden";
    input3.name = "product_size";
    input3.value = size;
  

    form.appendChild(input1);
    form.appendChild(input2);
    form.appendChild(input3);
    document.body.appendChild(form);
    
    form.submit();
}
function Giohang() {
    var phone = document.getElementById("phone").value;
    if(phone == "")
    {
        alert("Bạn chưa đăng nhập");
    }
    else
    {

        //alert(phone);
        var size = dd;
        if (dd == "0")
        {
            alert("Mời bạn chọn size");
            return;
        }
        else 
        {
            size = dd.substring(1);
        }
        dd = "0";
        var ID = document.getElementById("idd").value;
        
        var formData = new FormData();
        formData.append('product_id', ID);
        formData.append('account_phone', phone);
        formData.append('product_size', size);
        // Gửi yêu cầu POST đến trang hh.php
        fetch('cart_check.php', {
        method: 'POST',
        body: formData
        })
        .then(function(response) {
        // Nhận phản hồi từ trang hh.php
        return response.text();
        })
        .then(function(data) {
        // Xử lý phản hồi
        //alert(data);
        if(data == 1)
            alert("Sản phẩm đã có sẵn trong giỏ hàng");
        else
        {
            alert("Đã thêm vào giỏ hàng");
            var form = document.createElement("form");
            form.method = "POST";
            form.action = "cart_add.php";
        
            var input1 = document.createElement("input");
            input1.type = "hidden";
            input1.name = "account_phone";
            input1.value = phone;
        
            var input2 = document.createElement("input");
            input2.type = "hidden";
            input2.name = "product_id";
            input2.value = ID;
        
            var input3 = document.createElement("input");
            input3.type = "hidden";
            input3.name = "product_size";
            input3.value = size;
        
            var input4 = document.createElement("input");
            input4.type = "hidden";
            input4.name = "cart_number";
            input4.value = document.getElementById("soluong").value;

            form.appendChild(input1);
            form.appendChild(input2);
            form.appendChild(input3);
            form.appendChild(input4);
            document.body.appendChild(form);
            
            form.submit();
        }
            
        })
        .catch(function(error) {
        // Xử lý lỗi (nếu có)
        console.error(error);
        });

        
    }
    //window.location.href = "product.php?variable=" + encodeURIComponent(mvr);
  }
function MuaNgay() 
{
    var size = dd;
    if (dd == "0")
    {
        alert("Mời bạn chọn size");
        return;
    }
    else 
    {
        size = dd.substring(1);
    }
    
    var formData = new FormData();
    var number = document.getElementById("soluong").value;
    var iddd = document.getElementById("idd").value;
    formData.append('product_size', size);
    formData.append('product_number', number);
    formData.append('product_id', iddd);
                // Gửi yêu cầu POST đến trang hh.php
    fetch('check_amount.php', {
        method: 'POST',
        body: formData
    })
    .then(function(response) {
                // Nhận phản hồi từ trang hh.php
        return response.text();
    })
    .then(function(data) {
                // Xử lý phản hồi
                //alert(data);
        if(data != 0)
        {
            if (!confirm("Chỉ còn " + data.toString() + " sản phẩm. Bạn có muốn tiếp tục mua ?")) 
            {
                return;
            }
            else
            {
                dd = "0";
                number = data;
            }
        }
        var phone = document.getElementById("phone").value;
        var form = document.createElement("form");
        form.method = "GET";
        form.action = "delivery.php";
    
        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "MuaNgay";
        input1.value = phone;

        var input2 = document.createElement("input");
        input2.type = "hidden";
        input2.name = "product_size";
        input2.value = size;

        var input3 = document.createElement("input");
        input3.type = "hidden";
        input3.name = "product_number";
        input3.value = number;
        form.appendChild(input3);
        form.appendChild(input2);
        form.appendChild(input1);
        document.body.appendChild(form);
        form.submit();
    })
    .catch(function(error) {
                // Xử lý lỗi (nếu có)
        console.error(error);
    });
    
}
function CartTT()
{
    //alert ("YEE");
    var formData = new FormData();
                // Gửi yêu cầu POST đến trang hh.php
            fetch('check_amount_cart.php', {
            method: 'POST',
            body: formData
            })
            .then(function(response) {
                // Nhận phản hồi từ trang hh.php
            return response.text();
            })
            .then(function(data) {
                if( data == 1)
                {
                    var form = document.createElement("form");
                    form.method = "GET";
                    form.action = "delivery.php";
                    var input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "GioHang";
                    input.value = 1;
                    form.appendChild(input);
                    document.body.appendChild(form);
                    form.submit();
                }
                else
                {
                    alert(data);
                }
                
            })
            .catch(function(error) {
                // Xử lý lỗi (nếu có)
            console.error(error);
            });
    
    
}
function GHTN()
{
    //alert("hhhhhhhhhhhhhh");
    var sl = document.getElementById('sll').value;
    var form = document.createElement("form");
    form.method = "GET";
    form.action = "payment.php";
    //alert("okokokokok");
    var input1 = document.createElement("input");
    input1.type = "hidden";
    if(sl != "")
        input1.name = "MuaNgay";
    else
        input1.name = "GioHang";
    input1.value = 1;
    //alert("okokokokok");
    var input4 = document.createElement("input");
    input4.type = "hidden";
    input4.name = "account_phone";
    input4.value = document.getElementById("account_phone").value;
    //alert("okokokokok");
    var input2 = document.createElement("input");
    input2.type = "hidden";
    input2.name = "customer_name";
    input2.value = document.getElementById("customer_name").value;
    //alert("okokokokok");
    var input3 = document.createElement("input");
    input3.type = "hidden";
    input3.name = "customer_province";
    input3.value = document.getElementById("Tinh").value;
   // alert("okokokokok");
    var input5 = document.createElement("input");
    input5.type = "hidden";
    input5.name = "customer_district";
    input5.value = document.getElementById("Quan").value;

    var input6 = document.createElement("input");
    input6.type = "hidden";
    input6.name = "customer_address";
    input6.value = document.getElementById("customer_address").value;

    var input7 = document.createElement("input");
    input7.type = "hidden";
    input7.name = "customer_ward";
    input7.value = document.getElementById("Xa").value;
    //alert("okokokokok");
    form.appendChild(input1);
    form.appendChild(input2);
    form.appendChild(input3);
    form.appendChild(input4);
    form.appendChild(input5);
    form.appendChild(input6);
    form.appendChild(input7);
    document.body.appendChild(form);
    form.submit();
   
}
function gioHang(x) {
    var myVariable = x;
    window.location.href = "cart.php?variable=" + encodeURIComponent(myVariable) + '&var2=' + encodeURIComponent(dd);
}

//------product--------

const bigImg = document.querySelector(".product-content-left-big-img img")
const smallImg = document.querySelectorAll(".product-content-left-small-img img")
smallImg.forEach(function(imgItem){
    imgItem.addEventListener("click", function () {
        bigImg.src = imgItem.src
    })
})

const baoquan = document.querySelector(".baoquan")
const chitiet = document.querySelector(".chitiet")
const thamkhaosize = document.querySelector(".thamkhaosize")
if(baoquan){
    baoquan.addEventListener("click", function () {
        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "none"
        document.querySelector(".product-content-right-bottom-content-baoquan").style.display = "block"
        document.querySelector(".product-content-right-bottom-content-tkhaosize").style.display = "none"
    })
}

if(chitiet){
    chitiet.addEventListener("click", function () {
        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "block"
        document.querySelector(".product-content-right-bottom-content-baoquan").style.display = "none"
        document.querySelector(".product-content-right-bottom-content-tkhaosize").style.display = "none"
    })
}
if(thamkhaosize){
    thamkhaosize.addEventListener("click", function () {
        document.querySelector(".product-content-right-bottom-content-chitiet").style.display = "none"
        document.querySelector(".product-content-right-bottom-content-baoquan").style.display = "none"
        document.querySelector(".product-content-right-bottom-content-tkhaosize").style.display = "block"
    })
}

const buttonB = document.querySelector(".product-content-right-bottom-top");
    let isExpanded = false;

    if (buttonB) {
      buttonB.addEventListener("click", function() {
        const contentBig = document.querySelector(".product-content-right-bottom-content-big");
        
        if (isExpanded) {
          contentBig.classList.remove("activeB");
          buttonB.innerHTML = '&#8744;';
        } else {
          contentBig.classList.add("activeB");
          buttonB.innerHTML = '&#8743;';
        }
        
        isExpanded = !isExpanded;
      });
    }
    // profile-------
const hoso = document.querySelector(".hoso")
const doimatkhau = document.querySelector(".doimatkhau")
const donmua = document.querySelector(".donmua")
if(hoso){
    hoso.addEventListener("click", function () {
        document.querySelector(".profile-hosocuatui").style.display = "block"
        document.querySelector(".profile-doimatkhau").style.display = "none"
        document.querySelector(".profile-donmua").style.display = "none"
    })
}

if(doimatkhau){
    doimatkhau.addEventListener("click", function () {
        document.querySelector(".profile-hosocuatui").style.display = "none"
        document.querySelector(".profile-doimatkhau").style.display = "block"
        document.querySelector(".profile-donmua").style.display = "none"
    })
}
if(donmua){
    donmua.addEventListener("click", function () {
        document.querySelector(".profile-hosocuatui").style.display = "none"
        document.querySelector(".profile-doimatkhau").style.display = "none"
        document.querySelector(".profile-donmua").style.display = "block"
    })
}


// ----------đổi avatar-----------

// const image = document.querySelector(".profile-content-left-top button:first-child img");
//     input  = document.querySelector(".avatar ");
   
//     input.addEventListener("click", () => {
//     image.src=URL.createObjectURL(input.files[0]);
// })

  
function handleFileChange() 
{
   /* var input = document.querySelector("#input-file");
    var image = document.querySelector("#avt-img");
    var fileName = document.querySelector("#file-name");
    var file = input.files[0];
    var reader = new FileReader();
  
    reader.onload = function(e) {
      image.src = e.target.result;
    };
    
    reader.readAsDataURL(file);
  */
    let input = document.querySelector("#input-file");
    let file = input.files[0];
  
    let formData = new FormData();
    formData.append("product_img", file);
  
    let xhr = new XMLHttpRequest();
    xhr.open("POST", "upava.php", true);
    xhr.send(formData);
}

// --------------chọn địa chỉ------------
   /*         
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function(result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function() {
            district.length = 1;
            ward.length = 1;
            if (this.value != "") {
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        district.onchange = function() {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }

*/
    
    

    function LogOut()
    {
        var confirmed = confirm("Bạn có chắc chắn muốn đăng xuất?");
        if (confirmed) 
        {
            var mx = "DX";
            window.location.href = "account_add.php?DX=" + encodeURIComponent(mx);
        }
    }
    
    function DNGH()
    {
        var form = document.createElement("form");
        form.method = "GET";
        form.action = "account_add.php";
    
        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "GH";
        input1.value = "1";

        form.appendChild(input1);
        document.body.appendChild(form);
        form.submit();
    }
    function TimKiem1()
    {
        //alert("da tim");
        var form = document.createElement("form");
        form.method = "POST";
        form.action = "cartegory.php";
    
        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "26";
        input1.value = document.getElementById("26").value;
        form.appendChild(input1);
        document.body.appendChild(form);
        form.submit();
    }
    function BanChay()
    {
        
        var form = document.createElement("form");
        form.method = "POST";
        form.action = "cartegory.php";
    
        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "27";
        input1.value = 0;
        form.appendChild(input1);
        document.body.appendChild(form);
        form.submit();
        alert("OK");
    }
    function Xep()
    {
        var selectElement = document.getElementById("Xep");
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var selectedValue = selectedOption.id;
        var form = document.createElement("form");
        form.method = "GET";
        form.action = "cartegory.php";
    
        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "Xep";
        input1.value = selectedValue;
        form.appendChild(input1);
        document.body.appendChild(form);
        form.submit();
    }
    function DangKy()
    {
        var name = document.getElementById("account_name").value;
        var phone = document.getElementById("account_phone").value;
        var pass = document.getElementById("account_pass").value;
        var repass = document.getElementById("account_repass").value;
        if(name != "" && phone != "" && pass != "")
        {
            if(repass != pass)
                alert("Mật khẩu chưa trùng khớp");
            else
            {
                var formData = new FormData();
                formData.append('account_name', name);
                formData.append('account_phone', phone);
                formData.append('account_pass', pass);
                formData.append('account_repass', repass);
                // Gửi yêu cầu POST đến trang hh.php
                fetch('dk.php', {
                method: 'POST',
                body: formData
                })
                .then(function(response) {
                // Nhận phản hồi từ trang hh.php
                return response.text();
                })
                .then(function(data) {
                // Xử lý phản hồi
                //alert(data);
                if(data == 1)
                    alert("Số điện thoại đã được sử dụng");
                else
                    alert("Đăng ký thành công");
                })
                .catch(function(error) {
                // Xử lý lỗi (nếu có)
                console.error(error);
                });
            }
        }
        else
        {
            alert("Mời bạn điền đầy đủ thông tin");
        }
        
    }
    function DangNhap()
    {
        var taikhoan = document.getElementById("taikhoan").value;
        var matkhau = document.getElementById("matkhau").value;
        if(taikhoan == "" || matkhau == "")
        {
            alert("Mời bạn điền đầy đủ thông tin đăng nhập");
        }
        else
        {
            var formData = new FormData();
            formData.append('taikhoan', taikhoan);
            formData.append('matkhau', matkhau);
            
                // Gửi yêu cầu POST đến trang hh.php
            fetch('dk.php', {
            method: 'POST',
            body: formData
            })
            .then(function(response) {
                // Nhận phản hồi từ trang hh.php
            return response.text();
            })
            .then(function(data) {
                // Xử lý phản hồi
                //alert(data);
            if(data == 1)
                alert("Mật khẩu hoặc tài khoản không chính xác");
            else
            {
                window.location.href = data;
            }
            })
            .catch(function(error) {
                // Xử lý lỗi (nếu có)
            console.error(error);
            });
        }
        
                
    }
    function TTMS()
    {
        window.location.href = "cartegory.php";
    }

    function ThanhToan(flag)
    {
        if(flag == "1")
        {
            //alert("1");
            var money = document.getElementById("tong").value;
            var formData = new FormData();
            formData.append('bill_money', money);
            // Gửi yêu cầu POST đến trang hh.php
            fetch('billadd.php', {
            method: 'POST',
            body: formData
            })
            .then(function(response) {
            // Nhận phản hồi từ trang hh.php
            return response.text();
            })
            .then(function(data) {
            // Xử lý phản hồi
             alert(data);
           
            })
            .catch(function(error) {
            // Xử lý lỗi (nếu có)
            console.error(error);
            });
        }
        else
        {
            //alert("00");
            var money = document.getElementById("tong").value;
            var formData = new FormData();
            formData.append('bill_money', money);
            // Gửi yêu cầu POST đến trang hh.php
            fetch('bill_add.php', {
            method: 'POST',
            body: formData
            })
            .then(function(response) {
            // Nhận phản hồi từ trang hh.php
            return response.text();
            })
            .then(function(data) {
            // Xử lý phản hồi
             alert(data);
           
            })
            .catch(function(error) {
            // Xử lý lỗi (nếu có)
            console.error(error);
            });
        }
    }


    // bocloc
    function Loc()
    {
        var div = document.getElementById("loc");
        
            if (div.style.display == "none") {
                div.style.display = "block";
            } 
            else {
                div.style.display = "none";
            }
    }
    

    // chatbot

    
    function LLoc(gt)
    {
        var form = document.createElement("form");
        form.method = "GET";
        form.action = "cartegory.php";
    
        var input1 = document.createElement("input");
        input1.type = "hidden";
        input1.name = "Loc";
        input1.value = gt;
        form.appendChild(input1);
        document.body.appendChild(form);
        form.submit();
        
    }