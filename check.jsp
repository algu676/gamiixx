<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("MemberID") !=null && !request.getParameter("MemberID").equals("") 
	&& request.getParameter("pwd") != null && !request.getParameter("MemberID").equals("")){

    sql = "SELECT * FROM `members` WHERE `MemberID`='" +request.getParameter("MemberID") + 
	      "'  AND `pwd`='" + request.getParameter("pwd") + "'"  ; 
	
    ResultSet rs =con.createStatement().executeQuery(sql);
    int adimin=0;

    if(rs.next()){
        adimin=rs.getInt(7);
        session.setAttribute("MemberID",request.getParameter("MemberID"));
        if(adimin==1)
        {
            con.close();//結束資料庫連結
            response.sendRedirect("adminpage.jsp") ;
        }
        else if(adimin==2){
            con.close();//結束資料庫連結
            response.sendRedirect("index.html") ;
        }
        

	}
    else{
		//結束資料庫連結
        out.println("密碼帳號不符 !! <a href='login.html'>按此</a>重新登入") ;

	}
}
else{
	response.sendRedirect("login.html");
}
%>
