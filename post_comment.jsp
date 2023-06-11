<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <title>addcommet</title>
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
                    String sql = "SELECT * FROM comment";
                    con.createStatement().execute(sql);
                    request.setCharacterEncoding("UTF-8");
                    String new_id = request.getParameter("ID");
                    String new_name = request.getParameter("MemberID");
                    String new_star = request.getParameter("star");
                    String new_comment = request.getParameter("comment");
                  
                    // 舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
                    // String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
                    // String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
                    // String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
                    java.sql.Date new_date = new java.sql.Date(System.currentTimeMillis());
                    // Step 4: 執行 SQL 指令
                    sql = "INSERT INTO comment (`ID`, `MemberID`, `star`, `comment`) ";
                    sql += "VALUES ('" + new_id + "', ";
                    sql += "'" + new_name + "\', ";
                    sql += "'" + new_star + "', ";
                    sql += "'" + new_comment + "')";

                    con.createStatement().execute(sql);
                    // Step 6: 關閉連線
                    con.close();
                    // Step 5: 顯示結果
                    // 直接顯示最新的資料
                    response.sendRedirect("commet.jsp");
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
