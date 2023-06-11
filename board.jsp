
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM `members` WHERE `id`='" +session.getAttribute("id")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String id="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    id=rs.getString("id");
	}
    con.close();//結束資料庫連結
%>

<html>
<head>
<title>留言版</title>
</head>
<body>
<a href="view.jsp?page=1">觀看留言</a><p>
    <div class="comment">
<form name="form1" method="get" action="add.jsp" >
    <label for="fname" class="commenttext"><h4>留下對商品的評論</h4> </label>
    <br>
    <input type="hidden" name="id" value="<%=id%>">
    <textarea name="comment" cols="60" rows="5"></textarea>
    <div class="commentbtn">
        <input type="submit" name="Submit" value="送出">
        </div>
        </form>
</form>
</body>
</html>
<%
}
else{
	con.close();//結束資料庫連結
}
%>