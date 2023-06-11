
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use game";
con.createStatement().execute(sql);
%>
<%
request.setCharacterEncoding("utf-8");
request.getSession(true);

sql="select * from gamesqlpage";
ResultSet rs=con.createStatement().executeQuery(sql);


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAMIIX</title>
    <link rel="icon" type="image/x-icon" href="image/1234.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="assets/index.css">
    <link rel="stylesheet" href="assets/style.css">
    <script src="logout.js"></script>
</head>
<body>
    <style>
    .main {
        max-width: 1000px;
        margin: auto;
      }
      
      h1 {
        font-size: 50px;
        word-break: break-all;
      }
      footer{
        z-index: 9;
        text-align: center;
      }
      .row {
        background-color: #7f738d;
        margin: -50px -16px;
        border: 2px solid #000000;
        border-radius: 10px;
      }
      
      /* Add padding BETWEEN each column */
      .row,
      .row > .column {
       padding-top: 5%;
       padding-left: 10px;
       padding-right: 10px;
       padding-bottom: 10px;
      }
      
      /* Create three equal columns that floats next to each other */
      .column {
        float: left;
        width: 50%;
        display: none; /* Hide all elements by default */
      }
      
      /* Clear floats after rows */ 
      .row:after {
        content: "";
        display: table;
        clear: both;
      }
      
      /* Content */
      .content {
        padding: 10px;
  
      }
      
      /* The "show" class is added to the filtered elements */
      .show {
        display: block;
        
      }

      .btn {
        top: 20%;
        border: 1px solid purple;
        border-radius: 5px;
        outline: 1px;
        padding: 12px 16px;
        background-color: rgb(220, 214, 32);
        cursor: pointer;
        box-shadow: 0 -4px 6px 0 rgba(0, 0,0, 5);
        font-weight: bold;
      }
      
      .btn:hover {
        background-color: rgb(105, 9, 132);
        color: azure;
      }
      
      .btn.active {
       
        background-color: rgb(105, 9, 132);
        color: rgb(105, 9, 132);
      }
      .myBtnContainer {
        display: flex;
       
        height: 100vh;
        background-color: purple;

      }
      .gotop {
        z-index: 10;
        position: fixed;
        top: 90%;
        left: 95%;
        opacity: 0.80;
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
      .e04{
        box-shadow:  4px 4px 0px 4px rgba(0, 0,0, 0.5);;
      }
    </style>
    <script>
      
    function re() {
      
      var form = document.forms["c"];
    
      form.submit();
      };
  </script>
</body>
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
    <div class="main">
    <h1 style="height: 70px;"></h1>
    <hr>
    <button class="btn"  onclick="filterSelection('all')"> 全部</button>
    <button class="btn" onclick="filterSelection('topgame')">topgame</button>
    <button class="btn" onclick="filterSelection('newgame')"> newgame</button>
    <button class="btn" onclick="filterSelection('mostlike')">mostlike</button>
    <button class="btn" onclick="filterSelection('Fumo')">周邊</button>
    <div class="row">
            <%
            while(rs.next())
            {%>
              <form name="c" method="get" action="commet.jsp" style="display: none;" onsubmit="submitForm(event)">
                <input type="hidden" name="aID" value="<%=rs.getString(1)%>">
                <input type="image" onclick="re()" class="e04" name="GameName" <%=rs.getString(6)%>  value="submit" />
              </form>
              <form name="F" method="get" action="1.jsp" >
                <div class="column book<%=rs.getString(10)%>">
                  <div class="content">
                    <input type="hidden" onclick="re()" name="ID" value="<%=rs.getString(1)%>">
                    <input type="image" onclick="re()" class="e04" name="GameName" <%=rs.getString(6)%> alt="<%=rs.getString(2)%>" value="<%=rs.getString(2)%>" />
                    <h1 style="height: 20px;"></h1>
                    <h4>商品名:<br><%=rs.getString(2)%></h4>
                    <p>價錢:<br><%=rs.getString(3)%></p>
                  </div>
                </div>
              </form>
            <%}%>
        </div>
    </div>
    <script>
        filterSelection("all")
        function filterSelection(c) {
          var x, i;
          x = document.getElementsByClassName("column");
          if (c == "all") c = "";
          for (i = 0; i < x.length; i++) {
            w3RemoveClass(x[i], "show");
            if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
          }
        }
        
        function w3AddClass(element, name) {
          var i, arr1, arr2;
          arr1 = element.className.split(" ");
          arr2 = name.split(" ");
          for (i = 0; i < arr2.length; i++) {
            if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
          }
        }
        
        function w3RemoveClass(element, name) {
          var i, arr1, arr2;
          arr1 = element.className.split(" ");
          arr2 = name.split(" ");
          for (i = 0; i < arr2.length; i++) {
            while (arr1.indexOf(arr2[i]) > -1) {
              arr1.splice(arr1.indexOf(arr2[i]), 1);     
            }
          }
          element.className = arr1.join(" ");
        }

        var btnContainer = document.getElementById("myBtnContainer");
        var btns = btnContainer.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
          btns[i].addEventListener("click", function(){
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
          });
        }
function doZoom(size){
document.getElementById('zoom').style.fontSize=size+'px'
}
var DOM = (document.getElementById) ? 1 : 0;
var NS4 = (document.layers) ? 1 : 0;
var IE4 = 0;
if (document.all)
{
IE4 = 1;
DOM = 0;
}
var win = window;
var n = 0;
function findIt() {
if (document.getElementById("searchstr").value != "")
findInPage(document.getElementById("searchstr").value);
}
function findInPage(str) {
var txt, i, found;
if (str == "")
return false;
if (DOM)
{
win.find(str, false, true);
return true;
}
if (NS4) {
if (!win.find(str))
while(win.find(str, false, true))
n++;
else
n++;
if (n == 0)
alert("未找到指定内容.");
}
if (IE4) {
txt = win.document.body.createTextRange();
for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
txt.moveStart("character", 1);
txt.moveEnd("textedit");
}
if (found) {
txt.moveStart("character", -1);
txt.findText(str);
txt.select();
txt.scrollIntoView();
n++;
}
else {
if (n > 0) {
n = 0;
findInPage(str);
}
else
alert("未找到指定内容.");
}
}
return false;
}

</script>
    <footer>
        <div class="footer">
            <p class="footer-text">Copyright© 2023 by GAMIIX |<iframe  width=300 height=27 frameborder=0 scrolling=no src="counter.jsp" >
              <div id="message"></div></p>
        </div>
    </footer>
    
</body>
</html>