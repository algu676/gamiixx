<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("MemberID") != null ){
    sql = "SELECT * FROM `members` WHERE `MemberID`='" +session.getAttribute("MemberID")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String MemberID="", password="";
	//讀出MemberID, password當成使用者要更改時的內定值
	while(rs.next()){
	    MemberID=rs.getString("MemberID");
		password=rs.getString("password");
	}
    con.close();//結束資料庫連結
%>
<%=MemberID%>，<a href='logout.jsp' target="_blank" >登出</a><br />
<%
}
else{
	con.close();//結束資料庫連結
%>

<a href='login.html' target="_blank" >登入</a><br />
<%
}
%>
