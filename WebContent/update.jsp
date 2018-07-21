<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<%
		
		String search = (String)session.getAttribute("search");
		String stime=(String)session.getAttribute("stime");	
		String id=(String)session.getAttribute("id");
		int time=0,h1=0,h2=0;
		String temp1[]=null,temp2[]=null;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "hh:mm:ss";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
	
				temp1=stime.split(":",3);
				temp2=strDateNew.split(":",3);
				if(temp1[0].equals(temp2[0])){
					time=Integer.parseInt(temp2[1])-Integer.parseInt(temp1[1]);
				}
				else{
					h1=(Integer.parseInt(temp2[0])-Integer.parseInt(temp1[0]))*60;
					
					time=(h1-Integer.parseInt(temp1[1]))+Integer.parseInt(temp2[1]);
				}
												
				try{
				Connection con2 =Databasecon.getConnection();
				PreparedStatement ps=con2.prepareStatement("Update middle set etime=?,time=? where id='"+id+"' ");
				ps.setString(1,strDateNew);
				ps.setInt(2,time);
				int x=ps.executeUpdate();
				
				response.sendRedirect("index.html");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}

		
	
 %>
