<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <title>addadmin</title>
</head>
<body>
    <%!
        String newline(String str) {
            int index = 0;
            while ((index = str.indexOf("\n")) != -1)
                str = str.substring(0, index) + "<br>" + str.substring(index + 1);
            return str;
        }
    %>

    <%
        try {
            // Step 1: 載入資料庫驅動程式
            Class.forName("com.mysql.jdbc.Driver");
            try {
                // Step 2: 建立連線
                String url = "jdbc:mysql://localhost/game?serverTimezone=UTC";
                Connection con = DriverManager.getConnection(url, "root", "1234");
                if (con.isClosed())
                    out.println("連線建立失敗");
                else {
                    // Step 3: 選擇資料庫
                    String sql = "SELECT * FROM gamesqlpage";
                    con.createStatement().execute(sql);
                    request.setCharacterEncoding("UTF-8");
                    String new_id = request.getParameter("ID");
                    String new_name = request.getParameter("GameName");
                    String new_gameprice = request.getParameter("Gameprice");
                    String new_GamePriceNum = request.getParameter("GamePriceNum");
                    String new_GameIntroduction = request.getParameter("GameIntroduction");
                    String new_GemaTilePic = request.getParameter("GemaTilePic");
                    String new_GameMovie_1 = request.getParameter("GameMovie_1");
                    String new_GamePic_2 = request.getParameter("GamePic_2");
                    String new_GamePic_3 = request.getParameter("GamePic_3");
                    String new_GameType = request.getParameter("GameType");
                    String new_product_left = request.getParameter("product_left");

                    // 舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
                    // String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
                    // String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
                    // String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
                    java.sql.Date new_date = new java.sql.Date(System.currentTimeMillis());
                    // Step 4: 執行 SQL 指令
                    sql = "INSERT INTO gamesqlpage (`ID`, `GameName`, `Gameprice`, `GamePriceNum`, `GameIntroduction`,  `GemaTilePic`,`GameMovie_1`,`GamePic_2`,`GamePic_3`,`GameType`,`product_left`) ";
                    sql += "VALUES ('" + new_id + "', ";
                    sql += "'" + new_name + "\', ";
                    sql += "'" + new_gameprice + "', ";
                    sql += "'" + new_GamePriceNum + "', ";
                    sql += "'" + new_GameIntroduction + "', ";
                    sql += "'" + new_GemaTilePic + "', ";
                    sql += "'" + new_GameMovie_1 + "', ";
                    sql += "'" + new_GamePic_2 + "', ";
                    sql += "'" + new_GamePic_3 + "', ";
                    sql += "'" + new_GameType + "', ";
                    sql += "'" + new_product_left + "')";

                    con.createStatement().execute(sql);
                    // Step 6: 關閉連線
                    con.close();
                    // Step 5: 顯示結果
                    // 直接顯示最新的資料
                    response.sendRedirect("LogIn.html");
                }
            } catch (SQLException sExec) {
                out.println("SQL錯誤" + sExec.toString());
            }
        } catch (ClassNotFoundException err) {
            out.println("class錯誤" + err.toString());
        }
    %>
</body>
</html>
