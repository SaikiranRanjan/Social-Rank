<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
String  adname1=null,adpass1=null;

 
adname1=request.getParameter("uname");
adpass1=request.getParameter("pwd");

String msg="Invalid Name and Password";

if((adname1!=null) && (adpass1!=null) && (adname1.equals("admin"))&& (adpass1.equals("admin")))
{
	request.getRequestDispatcher("adminview.jsp").forward(request, response);
	
}
else
{
	request.setAttribute("msg1",msg);
	request.getRequestDispatcher("admin.jsp").forward(request, response);
	
}
%>