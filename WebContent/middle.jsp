 <%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

 
<%


String uname=(String)session.getAttribute("un");
String p=(String)session.getAttribute("password");
String pp=(String)session.getAttribute("chh");
   String idd=(String)session.getAttribute("uid");
   



	/* String uid = (String)session.getAttribute("uid");
	String uname = (String)session.getAttribute("name");
	String search=(String)session.getAttribute("communityname"); */	
	System.out.print(idd);
	System.out.print(uname);
	System.out.print(p);	
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
		/* String tid=(String)session.getAttribute("tid");
System.out.print(tid); */
	try{
		
			Connection con =Databasecon.getConnection();
			st=con.createStatement();
			String sql1="select max(id) from middle";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
					
			session.setAttribute("id",id);
//date
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ; 
//time

	String DATE_FORMAT1 = "hh:mm:ss";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now) ;
String etime="00:00:00";
int time=0;
	
		try {	
					
				Connection con1=Databasecon.getConnection();
			PreparedStatement ps=con1.prepareStatement("INSERT INTO middle VALUES(?,?,?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	//ps.setInt(2,Integer.parseInt(tid));
				ps.setString(2,idd);	
       			ps.setString(3,uname);
       			ps.setString(4,p);
			    ps.setString(5,strDateNew);
			    ps.setString(6,strDateNew1);
				ps.setString(7,etime);
				ps.setInt(8,time);
				ps.setString(9,pp);
			
				
	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				//response.sendRedirect("userpage.jsp");
				response.sendRedirect("middle2.jsp");
			}
			else
			{
				response.sendRedirect("userlogin.jsp");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		


	
 %>
</body>
</html>