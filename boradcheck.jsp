<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
	if( session.getAttribute("id") != null ){
	
		response.sendRedirect("board.jsp") ;
	
	
	}
    else{
%>
未登入
    <% }
%>