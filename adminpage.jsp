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

    sql = "select * from gamesqlpage";
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

        form input[type="text"], form input[type="password"], form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            background-color: white;
            border: none;
            color: black;
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
      <script src="logout.js"></script>
</head>
<body>
    <div class="container">
        <canvas id="personaCanvas"></canvas>
        <h1>管理者頁面</h1>
        
        <form name="gameadd" action="addgame.jsp" method="post">
            <% int x = 0;
                while (rs.next()) {
                        x = rs.getInt(1) + 1;
                        
                    }
                out.print("當前加入商品id:" + x);
            %>
            <br>
            遊戲:<input type="text" name="gameName" required><br>
            封面圖片:<input type="text" name="GemaTilePic" required><br>
            尹片1:<input type="text" name="GameMovie_1" required><br>
            圖片:<input type="text" name="GamePic_2" required><br>
            圖片2:<input type="text" name="GamePic_3" required><br>
            顯示價格:<input type="text" name="Gameprice" required><br>
            實際價格:<input type="text" name="GamePriceNum" required><br>
            庫存:<input type="text" name="product_left" required><br>
            大綱:<input type="text" name="GameIntroduction" required height="300"><br>
            種類:<input type="text" name="GameType" required><br>
            <input type="hidden" name="ID" value="<%=x%>"><br>
            <input type="submit" value="確定"><br>
        </form>
        <h2>修改產品內容</h2>
        <form name="updategame" action="updategame.jsp" method="post">
            遊戲ID:<input type="text" name="gameId" required><br>
            遊戲名稱:<input type="text" name="gameName" required><br>
            封面圖片:<input type="text" name="GemaTilePic" required><br>
            影片1:<input type="text" name="GameMovie_1" required><br>
            圖片1:<input type="text" name="GamePic_2" required><br>
            圖片2:<input type="text" name="GamePic_3" required><br>
            顯示價格:<input type="text" name="Gameprice" required><br>
            實際價格:<input type="text" name="GamePriceNum" required><br>
            庫存:<input type="text" name="product_left" required><br>
            大綱:<input type="text" name="GameIntroduction" required><br>
            種類:<input type="text" name="GameType" required><br>
            <input type="submit" value="確定"><br>
        </form>
        <form name="deletegame" action="deletegame.jsp" method="post">
            <select name="deletegame">
                <option>請選擇要刪除的產品</option>
                <%
                    while (rs.previous()) {
                        out.println("<option>" + rs.getString(2) + "</option>");
                    }
                    
                %>
            </select>
            <input type="submit" value="確定"><br>
        </form>
       <a href="adminadminpage.jsp">管理管理者</a><br>
       <button onclick="logout()">登出</button>
        <div id="message"></div></p>
        
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
