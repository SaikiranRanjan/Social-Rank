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
       
   


String id=null;
try
{
	 Connection con =Databasecon.getConnection();
	PreparedStatement ps=con.prepareStatement("SELECT * from ureg  rating where id ='"+idd+"' AND rating >5; ");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("view.jsp");
		
	}
	else
	{
		response.sendRedirect("userpage.jsp");

}
}
catch(Exception ex){
	out.println(ex);
}
%>

</table>.
</div>


    <div class="clear"></div>
  </div>
</section>
</body>
</html>