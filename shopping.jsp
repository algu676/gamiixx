<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping</title>
</head>
<body>
<%  
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // 加載 MySQL JDBC 驅動程序
        Class.forName("com.mysql.jdbc.Driver");

        // 建立數據庫連接
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String username = "root";
        String password = "1234";
        conn = DriverManager.getConnection(url, username, password);

        // 創建 SQL 查詢語句
        String sql = "SELECT * FROM gamesqlpage";
        stmt = conn.createStatement();

        // 執行查詢
        rs = stmt.executeQuery(sql);

        // 處理查詢結果
        while (rs.next()) {
            String productName = rs.getString("GameName");
            double productPrice = rs.getDouble("GamePriceNum");
            %>
            <p>Product Name: <%= productName %></p>
            <p>Product Price: <%= productPrice %></p>
            <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 關閉資源
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

</body>
</html>