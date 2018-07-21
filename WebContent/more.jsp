<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%--  <%
    String uname=(String)session.getAttribute("un");
    String idd=(String)session.getAttribute("uid");
    %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
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

.first
	{
	
	background-color:#277569;
	height:120px;
	width:547px;
	margin-top:5px;
	magin-left:80px;
	float:left;
	}
.first h2
	{
	margin-top:20px;
	font-family:Kunstler Script;
	 font-size: 450%;
	 color:white;
	
	}

.last
	{
	/* border-radius:25px; */
	border:2px solid #277569;
	margin-top:-120px;
	margin-left:550px;
	height:120px;
	width:810px;
	background-color:#277569;
	float:left;
	overflow:hidden; 
}
.last h2
	{
	margin-top:15px;
	font-family:cursive;
	color: white;
	}
.last ul li
	{
	float:left;
	color:#0892D0; 
	text-decoration:none;
	overflow:hidden; 
	margin:30px auto 30px auto;
	width:230px;
	margin-left: 20px;
   
	}
.last ul li a
	{
	text-decoration: none;
	}
.last ul li a:visited {
    color: green;
}
.last ul li a:hover{
    color: hotpink;
}
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover{background-color:;}
.search 
{

margin-left: 500px;
margin-top: 50px;
}
</style>

</head>
<body>
<div class="first">
<h2 align="center">Social Network</h2>
</div>
<div class="last">
<ul>
<!-- <li><a href="cview.jsp" class="active"><h2><font color="#09b4f7">View Comments</font></h2></a></li> -->

<li><a href="adminview.jsp"><h2>&nbsp;&nbsp;&nbsp;&nbsp; Back</h2></a></li>
<li><a href="index.html"><h2>&nbsp;&nbsp;&nbsp;&nbsp; Logout</h2></a></li>
</ul>
</div>
<div class="searchdb">
<table align="center" border="1" magin="10">
<tr>
<td><h3><font color="red">Id</font></h3></td>
<td><h3><font color="red"> Name</font></h3></td>
<td><h3><font color="red"> Password</font></h3></td>
<td><h3><font color="red">Date</font></h3></td>
<td><h3><font color="red">Starting Time</font></h3></td>
<td><h3><font color="red">End Time</font></h3></td>
<td><h3><font color="red">Total</font></h3></td>
<td><h3><font color="red">Website</font></h3></td>



<% 

String id=null;
String d="facebook";
try
{
	 Connection con =Databasecon.getConnection();
PreparedStatement ps=con.prepareStatement("SELECT sum(time),name,idd,password,data,stime,etime,time,website FROM middle group by name ");
ResultSet rs=ps.executeQuery();

while(rs.next())
{
      
      id=rs.getString("idd");
      
String aa=rs.getString("name");
//session.setAttribute("a1", aa);

String bb=rs.getString("password");
//session.setAttribute("a2", bb);
String cc=rs.getString("data");
String dd=rs.getString("stime");
String ee=rs.getString("etime");
String ff=rs.getString("time");
String hh=rs.getString("website");


%>
<tr>
 <td><%=id%></td> 
<td><%=aa%></td>
 <td><%=bb%></td> 
 <td><%=cc%></td>
 <td><%=dd%></td>
 <td><%=ee%></td>
 <td><%=ff%></td>
 <td><%=hh%></td>
<%-- <td><img src="viewimage1.jsp?id=<%=rs.getString("id")%>" width="150px" height="100px"><br><a href="like.jsp?id=<%=rs.getString("id")%>">Like</a></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="comment.jsp?aa=<%=rs.getString("id")%>">Comment</a></br></td> --%>


</tr>
<%
}
}

catch(Exception e2)
{
	System.out.println(e2.getMessage());
}
%>

</table>.
</div>


    <div class="clear"></div>
  </div>
</section>
</body>
</html>