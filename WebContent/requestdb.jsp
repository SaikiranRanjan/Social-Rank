<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String a=request.getParameter("id");
System.out.println("aaaaaaaa"+a); 
String id=null;
String b ="accept";

 try
 {
	 Connection con=Databasecon.getConnection();
	 PreparedStatement ps=con.prepareStatement("update request set status='"+b+"' where id='"+a+"'");
	 ps.executeUpdate();
	 response.sendRedirect("viewrequest.jsp?message=success");
	 
 }catch(Exception e)
 {
	System.out.println(e.getMessage()); 
 }

%>
