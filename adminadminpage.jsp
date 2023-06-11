<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost";
    Connection con = DriverManager.getConnection(url, "root", "1234");
    String sql = "use game";
    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    stmt.execute(sql);
%>
<%
    request.setCharacterEncoding("utf-8");
    request.getSession(true);

    sql = "select * from members";
    ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
    <title>管理者頁面</title>
    <style>
        body {
            background-color: #425186;
            color: white;
            font-family: "Montserrat", sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 30px;
        }

        form {
            margin-bottom: 20px;
        }

        form input[type="text"],
        form input[type="password"],
        form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            background-color: white;
            border: none;
        }

        form input[type="submit"] {
            padding: 10px 20px;
            background-color: #bf4080;
            color: white;
            border: none;
            cursor: pointer;
        }

        form select {
            background-color: white;
        }

        canvas {
            width: 100%;
            height: auto;
            max-width: 400px;
            display: block;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <canvas id="personaCanvas"></canvas>
        <h1>管理管理者頁面</h1>
        <h2>新增管理員</h2>
        <form name="addadmin" action="addadmin.jsp" method="post">
            <label for="MemberID">MemberID:</label>
            <input type="text" name="MemberID" id="MemberID" required><br>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required><br>
            <label for="gender">Gender:</label>
            <input type="text" name="gender" id="gender" required><br>
            <label for="email">Email:</label>
            <input type="text" name="email" id="email" required><br>
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required><br>
            <input type="submit" value="確定"><br>
        </form>
        <form name="deleteadmin" action="deleteadmin.jsp" method="post">
            <select name="deleteadmin">
                <option>請選擇要刪除的人員</option>
                <% while (rs.next()) { %>
                    <option><%= rs.getString("MemberID") %></option>
                <% } %>
            </select>
            <input type="submit" value="確定"><br>
        </form>
                
        <a href="adminpage.jsp">管理商品</a>
        <!-- 新增修改產品內容的表單 -->
        
    </div>

    <script>
        const canvas = document.getElementById('personaCanvas');
        const ctx = canvas.getContext('2d');
    
        // 在這裡繪製 Persona 5 的風格化排版
    
        // 設定陰影效果
        ctx.shadowColor = 'rgba(0, 0, 0, 5)'; // 陰影的顏色
        ctx.shadowBlur = 10; // 陰影的模糊程度
        ctx.shadowOffsetX = 10; // 陰影在 X 軸方向上的偏移量
        ctx.shadowOffsetY = 2; // 陰影在 Y 軸方向上的偏移量
    
        // 繪製文字
        ctx.font = '48px "Montserrat", sans-serif';
        ctx.fillStyle = 'white';
        ctx.fillText('   GamiiX', 20, 60);
        // 其他排版元素
    
        // 重設陰影效果
        ctx.shadowColor = 'transparent';
        ctx.shadowBlur = 0;
        ctx.shadowOffsetX = 0;
        ctx.shadowOffsetY = 0;
    </script>
   
    
    
    
</body>
</html>
