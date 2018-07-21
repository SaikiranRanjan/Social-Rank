<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@
 page language="java" import="databaseconnection.*"
%>

<%   

/* String q=(String)session.getAttribute("id1"); */
String ki = request.getParameter("id");
session.setAttribute("kii",ki);
System.out.println("ath id :"+ki);

%>

<% 

int id = 0;
int ct;int c2=0;
			 
try 
		{
		
		Connection con=Databasecon.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from shareimage where id='"+ki+"'");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				id = rs.getInt("id");
				ct=rs.getInt("status");
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
PreparedStatement ps=con.prepareStatement("update shareimage set status ='"+c2+"' where id='"+ki+"'");
ps.executeUpdate();
response.sendRedirect("viewshareimage.jsp?Message=success");
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
