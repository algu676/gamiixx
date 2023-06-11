
<%@ page session="true" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost";
Connection con = DriverManager.getConnection(url, "root", "1234");
String sql = "use game";
con.createStatement().execute(sql);
%>
<%
request.setCharacterEncoding("utf-8");
request.getSession(true);

sql = "select * from gamesqlpage";
ResultSet rs = con.createStatement().executeQuery(sql);

%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GAMIIX</title>
  <link rel="icon" type="image/x-icon" href="image/1234.png">
  <link rel="stylesheet" href="assets/style.css">
  <link rel="stylesheet" href="assets/product.css">
  <link rel="stylesheet" href="assets/slide.css">
  <script src="https://code.jquery.com/jquery-3.6.3.js"
    integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
  <script src="logout.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

  <script>
   
  </script>
  
  <script>
    var num = 1;
    function plus() {
      var node = document.getElementById("num");
      var num = Number(node.innerHTML);
      num++;
      node.innerHTML = num;
    }

    function reduce() {
      var node = document.getElementById("num");
      var num = Number(node.innerHTML);
      if (num > 1) {
        num--;
      } else {
        alert("錯誤");
      }
      node.innerHTML = num;
    }

    function redirectToBuyPage() {
      window.location.href = "buy.html";
    }
    function showAlert() {
      alert(num);
    }
  </script>
  <script>
    function showAlert() {
      Swal.fire({
        title: '購買:'num,
        text: '您確定要執行這個操作嗎？',
        icon: 'buy',
        showCancelButton: true,
        confirmButtonText: '確定',
        cancelButtonText: '取消'
      }).then((result) => {
        if (result.isConfirmed) {
          // 使用者點擊了「確定」按鈕
          console.log('使用者點擊了「確定」按鈕');
        } else if (result.isDismissed) {
          // 使用者點擊了「取消」按鈕或關閉彈出視窗
          console.log('使用者點擊了「取消」按鈕或關閉彈出視窗');
        }
      });
    }
    function clean(){
            alert("付款成功");
            var a = "";
            var node = document.getElementById("goods").childNodes;
            for(var i = 3 ; i < node.length ; i++) {
                node[i].remove();
            }
        }
  </script>
  
  <style>
    form {
      text-align: center;
      border-radius: 10px;
      border: 1px solid #ccc; /* 外框樣式 */
      background-color: #CCCCCC; /* 底色 */
      padding: 20px; /* 內距 */
      margin: 30px;
      margin-right: 200px;
      margin-left: 200px;
    
    }
    input[type="button"],
    input[type="submit"] {
      position: relative;
      background-color: #2a2524;
      color: #fff;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s;
    }

    .form1 {
  display: flex;
  justify-content: center;
  align-items: center;
}

.form1 input[type="button"],
.form1 input[type="submit"] {
  margin: 0 10px;
}
    body {
      background-color: #8e8ca8;
    }

    .product {
      display: flex;
      background-color: #ccc;
      padding: 20px;
    }

    .price {
      flex: 1;
      background-color: #8e8ca8;
      padding: 20px;
    }

    .introduce {
      float: right;
      width: 100%;
      padding: 20%;
      box-sizing: border-box;
    }

    .introduce-container {
      width: 100%;
      height: auto;
      margin-left: auto;
      margin-right: auto;
      float: right;
    }

    .product-info {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      position: absolute;
      border-radius: 10px;
      top: 550px;
      left: 30px;
      border:30px;
    }

    .slideshow {
      width: 40%;
    }

footer {
      position: fixed; /* 將頁尾固定在網頁底部 */
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #444486;
      padding: 10px;
      text-align: center;
    }
iframe{
  text-align: center;
}
.Konami {
    background-color: #512c9d; /* 背景色 */
    border-radius: 10px; /* 圆角 */
    padding: 20px; /* 内边距，根据需要进行调整 */
    color: rgb(255, 255, 255); /* 字体颜色，与代码样式相匹配 */
  }
  </style>
</head>

<body>
  <script>window.onload=function(){
  var url = new URL(window.location.href);
  var idValue = url.searchParams.get('ID');
  document.getElementById("myVariableInput").value = idValue;
  document.getElementById("myForm").submit()}
  </script>
  <!-- header -->
  <nav class="topmenu">
    <div class="gotop">
      <a href="#top">
        <img src="image/img/up.png" alt="goup" width="50px" />
      </a>
    </div>
    <div class="logo">
      <h1>
        <a href="about.html"></a>
      </h1>
    </div>

    <div class="list">
      <div>
        <a href="index.html" style="text-decoration:none;" class="nav1">回到首頁</a>
        <a href="cate.jsp" style="text-decoration:none;" class="nav2">遊戲選單</a>
        <a href="checklogin.jsp" style="text-decoration:none;" class="nav5">會員專區</a>
        <a href="buy.html" style="text-decoration:none;" class="nav6">購物車</a>
      </div>
    </div>
  </nav>
  <!-- header end -->

  <% if (request.getParameter("ID") != null) {
    sql = "SELECT * FROM `gamesqlpage` WHERE `ID`='" + session.getAttribute("ID") + "';";
    int x = Integer.parseInt(request.getParameter("ID"));
    String ID = "", product_name = "", product_note = "", author = "", publish = "", introduce = "", product_price = "", file_path = "", book_file = "";
    int product_left = 1000;
    session.setAttribute("ID", ID);

    while (rs.next()) {
      ID = rs.getString("ID");
      product_name = rs.getString("GameName");
      introduce = rs.getString("GameIntroduction");
      product_price = rs.getString("Gameprice");
      file_path = rs.getString("Gamevideo_1");

      if (rs.getInt(1) == x) {
        break;
      }
    }
  %>

  <div style="height: 100px;"></div>
  <hr color="black">

  <section class="product">
    <div class="sidebar">
    </div>

    <div class="main-content">
      <div class="ad">
        <div class="mySlides fade">
          <video width="540" height="388" controls>
            <source src="video/<%=file_path%>.webm" type="video/webm">
            <source src="video/<%=file_path%>.mp4" type="video/mp4">
            <source src="video/<%=file_path%>.ogg" type="video/ogg">
            no video
          </video>
        </div>

        <div class="mySlides fade">
          <%=rs.getString(8)%>
        </div>

        <div class="mySlides fade">
          <%=rs.getString(9)%>
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

        <div style="text-align:30px">
          <span class="dot" onclick="currentSlide(1)"></span>
          <span class="dot" onclick="currentSlide(2)"></span>
          <span class="dot" onclick="currentSlide(3)"></span>
        </div>
       
        <script>
          /* Slideshow Manual */

          var slideIndex = 1;
          showSlides(slideIndex);

          // Next/previous controls
          function plusSlides(n) {
            showSlides(slideIndex += n);
          }

          // Thumbnail image controls
          function currentSlide(n) {
            showSlides(slideIndex = n);
          }

          function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
          }
        </script>
      </div>
    </div>

    <div class="introduce-container">
      <div class="introduce">
        <pre style="white-space: pre-wrap">
          <%=introduce%>
        </pre>
      </div>
    </div>

    <div class="product-info">
      <h1>商品名: <%=product_name%></h1>
      <h2>價錢: <%=product_price%></h2>
      <h2>庫存: <%=product_left%></h2>
      <div class="center w2 p">
          <div class="tb tbb">
              <table style="border-collapse: collapse; margin: 0;">
                  <tr>
                      <td><h2>購買數量: </h2></td>
                      <td><button class="b1-1 w1" onclick="reduce()">-</button></td>
                      <td>
                          <p class="w2" id="num">1</p>
                      </td>
                      <td><button class="b1-2 w1" onclick="plus()">+</button></td>
                  </tr>
              </table>
          </div>
      </div>
      <form name="BUY" action="buy.html" method="post" class="form1">
          <input type="hidden" name="ID" value="<%=ID%>">
          <div class="e04">
              <input type="button" value="加入購物車" id="addToCartButton"onclick="redirectToBuyPage()" name="按鈕名稱" style="width:150px;height:50px;">

          </div>
          <input type="hidden" name="product_price" value="<%=product_price%>">
          <input type="hidden" name="ID" value="<%=ID%>">
          <input type="hidden" name="product_left" value="<%=product_left%>">
          <%} else {
            con.close(); //結束資料庫連結
          }%>
          <div class="e04">
              <input type="submit" value="訂購" onclick="clean()" name="buy" style="width:150px;height:50px;">
          </div>
      </form>
  </div>
  <form action="commet.jsp" method="post">
    <input type="hidden" name="ID" id="ID" value=<script>document.write(idValue)</script>>
  </form>
    </div>
  </section>

  <hr color="">
  <!-- 留言表單 -->

  
  <br>
  <br>
  <iframe src="commet.jsp" height="300px" frameborder="0"></iframe>
  <!-- 顯示留言與評分 -->
  <% 
   if (request.getParameter("ID") != null) {
    sql = "SELECT * FROM `comment` WHERE `ID`='" + session.getAttribute("ID") + "';";
    int x = Integer.parseInt(request.getParameter("ID"));
    String ID = "",  MemberID = "", star = "", comment = "";
    session.setAttribute("ID", ID);

    while (rs.next()) {
      ID = rs.getString("ID");
      MemberID = rs.getString("MemberID");
      star = rs.getString("star");
      comment = rs.getString("comment");

      if (rs.getInt(1) == x) {
        break;
      }
    }
  %>
  <div class="Konami">
    <h1>留言帳戶: <%=MemberID%></h1>
    <h2>星級: <%=star%></h2>
    <h2>評價: <%=comment%></h2>
  </div>

<div class="product-info">
  <div class="slideshow">
    <!-- slideshow 內容 -->
  </div>

  <%
  } else {
    con.close(); //結束資料庫連結
  }
  %>

  <div style="height: 100px;"></div>
  <footer>
    <div class="footer">
      <p class="footer-text">Copyright© 2023 by GAMIIX |<iframe  width=300 height=27 frameborder=0 scrolling=no src="counter.jsp" >
        <div id="message"></div></p>
    </div>
</footer>
</body>

</html>