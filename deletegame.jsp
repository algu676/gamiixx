<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
    if(request.getParameter("deletegame")!=null){

	sql = "DELETE FROM gamesqlpage WHERE GameName='"+request.getParameter("deletegame")+"'";
	con.createStatement().execute(sql);	
	con.close();//結束資料庫連結
	out.print("更新成功!! 請<a href='adminpage.jsp'>按此</a>回管理頁面!!");
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("更新失敗!! 請填寫完整，<a href='adminpage.jsp'>按此</a>回管理頁面!!");
	}

%>