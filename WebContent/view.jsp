<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String uname=(String)session.getAttribute("un");
    System.out.println("uname "+uname);
    String p=(String)session.getAttribute("password");
    System.out.println("p "+p);
    String pp=(String)session.getAttribute("chh");
    System.out.println("pp "+pp);
      String idd=(String)session.getAttribute("uid");
      System.out.println("idd "+idd);
       
    %>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
*
{
	margin:0px;
	padding:opx;
}
body
	{
   background-image:url(images/.jpg);
	background-size:100%100%;
	}

.new
	{
	
	background-color:#fcfc23;
	height:120px;
	width:150px;
	margin-top:-485px;
	margin-left:840px;
	float:left;
	overflow:hidden; 
	}

.new ul li
	{
	float:left;
	color:#0892D0; 
	text-decoration:none;
	overflow:hidden; 
	margin:45px auto 30px auto;
	/* width:200px; */
	/* margin-left: 20px; */
   
	}
.new ul li a
	{
	text-decoration: none;
	}
.new ul li a:visited {
    color: green;
}
.new ul li a:hover{
    color: hotpink;
}
.searchdb
{
height: 600px;
width: 6oopx;
margin-top:190px;
margin-left: 250px;
}
.searchdb table {
    border-collapse: collapse;
    width: 100%;
    margin-left: 100px;
    margin-top: -100px;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.searchdb tr:hover{background-color:;}

</style>

</head>
<body>






<% 

String id=null;
try
{
	 Connection con =Databasecon.getConnection();
	PreparedStatement ps=con.prepareStatement("SELECT * from addimage ");
ResultSet rs=ps.executeQuery();

while(rs.next())
{
      /* 
      id=rs.getString("id"); */
      
String aa=rs.getString("pname");
//session.setAttribute("a1", aa);

String bb=rs.getString("message");
//session.setAttribute("a2", bb);


%>
<div class="searchdb">
<table>
<tr>
<%-- <td><%=id%></td>  --%>

<%--  <td><%=aa%></td> --%> 
<%--  <td><%=bb%></td> --%>
<td><img src="viewimage2.jsp?id=<%=rs.getString("id")%>" width="450px" height="400px" ><br><%=aa %> : <%=bb %></td>
</tr>
</table>.
</div>
<div class="new">
<ul>
<li><a href="userpage.jsp" class="active"><h2><font color="#09b4f7">Go Next</font></h2></a></li>


</ul>
</div>

<%
}
}

catch(Exception e2)
{
	System.out.println(e2.getMessage());
}
%>



    
</body>
</html>