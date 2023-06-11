<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=Big5"
    pageEncoding="utf-8"%>
<html>
<head>
<title>counter</title>
</head>
<body>
<%
int count;
String countString;
try {
String sql="";
String url="jdbc:mysql://localhost";
Connection con=DriverManager.getConnection(url,"root","1234");
if(con.isClosed())
out.println("無法連接");
else{
sql="use `game`";
con.createStatement().execute(sql);	
sql="select * from counter" ;
ResultSet rs=con.createStatement().executeQuery(sql);

if (rs.next()){
countString = rs.getString(1);
count = Integer.parseInt(countString);
//Object obj = session.getAttribute("online");
//if (obj == null){ 
if (session.isNew())
{
    count=count + 1;
countString = String.valueOf(count);
sql="update counter set count = " + countString ;
con.createStatement().execute(sql);
session.setAttribute("online",count);
}
out.println("<font color=\"white\">Viewers：" + count);
}

       con.close();
      }


}
catch(Exception err)
{
    out.println(err.toString());
}
%>
</body>
</html>
