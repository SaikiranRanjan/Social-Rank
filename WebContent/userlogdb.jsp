<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>Community-Aware Opportunistic<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Routing in
Mobile Social Networks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%



String name = request.getParameter("uname");
String password = request.getParameter("pw");
String ch = request.getParameter("sn");
session.setAttribute("chh",ch);
session.setAttribute("name",name);
session.setAttribute("password",password);


try{
	Connection con=Databasecon.getConnection();
	PreparedStatement ps=con.prepareStatement("select * from ureg where name ='"+name+"' AND pass='"+password+"' AND website ='"+ch+"'");
	ResultSet rs=ps.executeQuery();
	if(!rs.next()){
		
		//out.println("Enter correct username, password,website ");
		 %>
			<script type="text/javascript">
		        alert("Not correct........");
		        window.location='userlogin.jsp';</script>
			<%
	}
	else
		session.setAttribute("uid",Integer.toString(rs.getInt("id")));
	    session.setAttribute("un",rs.getString("name"));
		session.setAttribute("mylocation",rs.getString("location"));
		response.sendRedirect("middle.jsp");

}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


