<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<% 
    
    if(session.getAttribute("MemberID") != null){            

		//request.getSession().removeAttribute( "MemberID");
		//request.getSession(true).invalidate(); 
		
		session.removeAttribute("MemberID");
        response.sendRedirect("index.html") ;
	}else{
        out.println("沒登入~") ;
		%><a href="login.html" target="_self">Login</a>
		<%
	}
%>