<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
    String MemberID = "", email = "", pwd = "", gender = "", address = "", name = "", admin = "";

    // 檢查session中是否存在id
    if(session.getAttribute("MemberID") != null) {
        String memberId = (String) session.getAttribute("MemberID");

        // 創建資料庫連接
        try {
            Class.forName("com.mysql.jdbc.Driver");

            // 構建SQL查詢語句
            sql = "SELECT * FROM members WHERE MemberID=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, memberId);

            // 執行查詢
            ResultSet rs = pstmt.executeQuery();

            // 讀取結果集
            if (rs.next()) {
                MemberID = rs.getString("MemberID");
                pwd = rs.getString("pwd");
                gender = rs.getString("gender");
                email=rs.getString("email");
                address = rs.getString("address");
                name = rs.getString("name");
                admin = rs.getString("admin");
            }

            // 關閉資源
            rs.close();
            pstmt.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } else {
        out.println("未登入");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body {
            background-color: #8e8ca8;
            font-family: Arial, sans-serif;
        }

        
        .user-info {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .form {
            width: 500px;
            background-color: #82778e;
            padding: 30px;
            border: 2px solid #000000;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .form-group label {
            width: 120px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            flex: 1;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            padding: 5px 10px;
            border: 2px solid #463c07;
            border-radius: 5px;
            background-color: #d4d710;
            color: #000000;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <nav class="topmenu">
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
    <div class="user-info">
        <form class="form" action="update.jsp" method="POST">
            <div class="form-group">
                <label for="MemberID">會員ID:</label>
                <input type="text" id="MemberID" name="MemberID" value="<%= MemberID %>"  style="background-color: #fff;">
            </div>
            <div class="form-group">
                <label for="pwd">密碼:</label>
                <input type="text" id="pwd" name="pwd" value="<%= pwd %>"  style="background-color: #fff;">
            </div>
            <div class="form-group">
                <label for="gender">性別:</label>
                <input type="text" id="gender" name="gender" value="<%= gender %>"  style="background-color: #fff;">
            </div>
            <div class="form-group">
                <label for="email">email:</label>
                <input type="text" id="email" name="email" value="<%= email %>"  style="background-color: #fff;">
            </div>
            <div class="form-group">
                <label for="address">地址:</label>
                <input type="text" id="address" name="address" value="<%= address %>"  style="background-color: #fff;">
            </div>
            <div class="form-group">
                <label for="name">姓名:</label>
                <input type="text" id="name" name="name" value="<%= name %>"  style="background-color: #fff;">
            </div>
            <div class="form-group">
                <button type="submit" name="submit" value="submit">確認更改</button>
                <button type="button" onclick="location.href='logout.jsp'">登出</button>
            </div>
        </form>
    </div>
</body>
</html>
