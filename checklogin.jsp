<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
	if( session.getAttribute("MemberID") != null ){
	
		response.sendRedirect("userinfo.jsp") ;
	
	
	}
    else{
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-size: 24px;
        }

        .user-info {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #714676;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        
        .form {
            background-color: #a091c1;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .form-group label {
            width: 120px;
            font-weight: bold;
            color: #fff;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            flex: 1;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            padding: 5px 10px;
            border: 2px solid #463c07;
            border-radius: 5px;
            background-color: #d4d710;
            color: #000000;
            cursor: pointer;
        }

        .a8 {
            padding: 5px 10px;
            border: 1px solid black;
            border-radius: 10px;
            font-weight: bolder;
            font-size: 120px;
            background-color: rgb(142, 25, 138);
            color: rgb(252, 245, 43);
            text-align: center;
            margin-top: 20px;
        }
        a {
            
            text-decoration: none;
            color: rgb(252, 245, 43);
            text-shadow: 6px 6px 0px rgba(0, 0, 5, 5);
        
        }
    </style>
</head>
<body>
    <meta http-equiv="refresh" content="0;url=login.html">

</div>
</body>
</html>
    <% }
%>