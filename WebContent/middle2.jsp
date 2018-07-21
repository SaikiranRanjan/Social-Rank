<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@
 page language="java" import="databaseconnection.*"
%>

<%   

String uname=(String)session.getAttribute("un");
System.out.println("uname "+uname);
String p=(String)session.getAttribute("password");
System.out.println("p "+p);
String pp=(String)session.getAttribute("chh");
System.out.println("pp "+pp);
  String idd=(String)session.getAttribute("uid");
  System.out.println("idd "+idd);
   

/* String q=(String)session.getAttribute("id1"); */

/* String ki = request.getParameter("id");
session.setAttribute("kii",ki);
System.out.println("ath id :"+ki);
 */
%>

<% 

int id = 0;
int ct;int c2=0;
			 
try 
		{
		
		Connection con=Databasecon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from ureg where id ='"+idd+"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				id = rs.getInt("id");
				ct=rs.getInt("rating");
				c2=ct+1;
				
				
				%>
        
       
                <%
			}
		}
		
		catch(Exception e)
		{
			out.print(e);
		}
		%>
      
		<%
						 try
{

Connection con=Databasecon.getConnection();
PreparedStatement ps=con.prepareStatement("update ureg set rating ='"+c2+"' where id='"+idd+"'");
ps.executeUpdate();
//response.sendRedirect("userpage.jsp?Message=success");
response.sendRedirect("viewoffer.jsp?Message=success");
/* out.println("<script type=\"text/javascript\">");
out.println("alert('your vote is have done success');");
out.println("location='peopleview.jsp';");
out.println("</script>"); */
}

catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
