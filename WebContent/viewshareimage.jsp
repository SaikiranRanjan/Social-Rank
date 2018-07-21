<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String uname=(String)session.getAttribute("un");
    String idd=(String)session.getAttribute("uid");
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

.first
	{
	
	background-color:#277569;
	height:120px;
	width:1350px;
	margin-top:5px;
	magin-left:80px;
	float:left;
	overflow:hidden; 
	}
.first
{


}
.first ul li
	{
	float:left;
	color:#0892D0; 
	text-decoration:none;
	overflow:hidden; 
	margin:30px auto 30px auto;
	width:200px;
	/* margin-left: 20px; */
   
	}
.first ul li a
	{
	text-decoration: none;
	}
.first ul li a:visited {
    color: green;
}
.first ul li a:hover{
    color: hotpink;
}
.searchdb
{
margin-left: 450px;

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

</style>

</head>
<body>
<div class="first">
<ul>
<li><a href="find.jsp" class="active"><h2><font color="#09b4f7">Send friend Request</font></h2></a></li>

<li><a href="viewrequest.jsp"><h2><font color="#09b4f7">View request</font></h2></a></li>
<li><a href="shareimage.jsp"><h2><font color="#09b4f7">ShareImage</font></h2></a></li>
<li><a href="viewshareimage.jsp"><h2><font color="#09b4f7">ViewImage</font></h2></a></li>
<!-- <li><a href="viewcomment.jsp"><h2><font color="#09b4f7"> Comments</font></h2></a></li> -->
<li><a href="viewlikes.jsp"><h2><font color="#09b4f7">Likes Status</font></h2></a></li>
<li><a href="selecttime.jsp"><h2><font color="#09b4f7"> Logout</font></h2></a></li>
</ul>
</div>

<div class="searchdb">
<table align="center">
<tr>
<% 

String id=null;
try
{
	 Connection con =Databasecon.getConnection();
	PreparedStatement ps=con.prepareStatement("SELECT * from shareimage");
ResultSet rs=ps.executeQuery();

while(rs.next())
{
      
      id=rs.getString("id");
      
String aa=rs.getString("name");
//session.setAttribute("a1", aa);

String bb=rs.getString("message");
//session.setAttribute("a2", bb);


%>


<td><br><%=aa %></br><img src="viewimage1.jsp?id=<%=rs.getString("id")%>" width="250px" height="200px"><br><%=bb %></br><br><a href="like.jsp?id=<%=rs.getString("id")%>">Like</a></br></td>


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


   
</body>
</html>