<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="databaseconnection.*"%>
    
    <%
    String uname=(String)session.getAttribute("un");
    String idd=(String)session.getAttribute("uid");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String name=(String)session.getAttribute("n");

//String name =request.getParameter("");

//String fname =request.getParameter("");

String id2 =request.getParameter("id");

String b ="request";

Connection con=null;

              try
              {
            	  
            	  con = Databasecon.getConnection();
            	  String query= "insert into request(name,uid,fname,status)values('"+name+"','"+id2+"','"+uname+"','"+b+"')";
            	  PreparedStatement pstmt=con.prepareStatement(query);
            	  
            	  int x= pstmt.executeUpdate();
            	  response.sendRedirect("find.jsp?message=success");
              }catch(Exception e)
              {
            	  System.out.println(e.getMessage());
              }
%>
</body>
</html>