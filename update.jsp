<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>

</body>
</html>
<%
if(session.getAttribute("MemberID") != null ){
    if(request.getParameter("MemberID")!=null){
    sql = "UPDATE `members` SET `MemberID`='"+request.getParameter("MemberID")+"', `pwd`='"+request.getParameter("pwd")+"' WHERE `MemberID`='"+session.getAttribute("MemberID")+"'";
	con.createStatement().execute(sql);
    sql = "UPDATE `members` SET `pwd`='"+request.getParameter("pwd")+"' WHERE `MemberID`='"+session.getAttribute("MemberID")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `members` SET `name`='"+request.getParameter("name")+"' WHERE `MemberID`='"+session.getAttribute("MemberID")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `members` SET `gender`='"+request.getParameter("gender")+"' WHERE `MemberID`='"+session.getAttribute("MemberID")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `members` SET `email`='"+request.getParameter("email")+"' WHERE `MemberID`='"+session.getAttribute("MemberID")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `members` SET `address`='"+request.getParameter("address")+"' WHERE `MemberID`='"+session.getAttribute("MemberID")+"'";
	con.createStatement().execute(sql);	
	con.close();//結束資料庫連結
	%><style>
		 body {
        background-color: rgb(142, 25, 138);
    }
	p{
	font-weight: bolder;
	font-size: 120px;
	background-color: rgb(142, 25, 138);
	color: rgb(252, 245, 43);
	text-align: center;
	margin: auto;
	}
</style>
	<%="<p>更新成功!! 請<a href='userinfo.jsp'>按此</a>回會員頁面!!</p>"%><%
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("<p>更新失敗!! 請填寫完整，<a href='userinfo.jsp'>按此</a>回會員頁面!!</p>");
	}
}
else{
	con.close();//結束資料庫連結
}
%>

