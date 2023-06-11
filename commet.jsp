
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

if (session.getAttribute("MemberID") != null) {
  sql = "SELECT * FROM `gamesqlpage` WHERE `ID`='" + session.getAttribute("aID") + "';";
  int x = 0; // 修正为合适的整数值
  String ID = ""; // 修正为合适的初始值
  session.setAttribute("ID", ID);
  Object MemberID = session.getAttribute("MemberID");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <style>
    .form-container {
        border: 1px solid black;
        border-radius: 10px;
        background-color: rgb(101, 80, 6);
        padding: 20px;
        width: 200px;
        margin: auto;
    }
</style>


<%
String parentUrl = request.getHeader("referer");
String idParam = ""; // 在此先定义idParam变量

if (parentUrl != null) {
    int idIndex = parentUrl.indexOf("ID=");
    if (idIndex != -1) {
        idParam = parentUrl.substring(idIndex + 3);
    }
    // 移除参数部分
    int queryIndex = parentUrl.indexOf("&");
    if (queryIndex != -1) {
        parentUrl = parentUrl.substring(idIndex + 3, queryIndex);
    }
}

// 在此可以使用idParam变量和更新后的parentUrl变量
%>






<div class="form-container">
<form id="SHIVA" method="get" action="post_comment.jsp">
  <input type="hidden"  name="ID" value="<%=parentUrl%>">
  <input type="hidden"  name="MemberID" value="<%=MemberID%>">
        <div class="form-group">
        </div>
        <label for="star">評分： </label>
        <select name="star" id="star" required>
            <option value="5">五星</option>
            <option value="4">四星</option>
            <option value="3">三星</option>
            <option value="2">二星</option>
            <option value="1">一星</option>
        </select>
        <br>
        <label for="comment">留言內容：<label for="comment"></label>
        <br>
        <textarea name="comment" rows="5" required></textarea>
        <br>
        <br>
        <input type="submit" " value="送出留言">
        
</div>
</form>
</body>
</html>
<%
	} else {
		out.println("請登入");
	}
%>
