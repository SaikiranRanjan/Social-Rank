<%-- <%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
 --%>
<%-- <%@page import="javax.mail.Multipart"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.struts2.dispatcher.multipart.MultiPartRequest"%> --%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
</head>
<body>

<%

		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con1=Databasecon.getConnection();
			st=con1.createStatement();
			String sql1="select max(id) from ureg";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String uname=null,gender=null,email=null,password=null,website=null,mobile=null,location=null,image=null;
		int report=0;
		int upload=0;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		File file1 = null;
			
		
		try {
			
			//MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
           MultipartRequest multi= new MultipartRequest(request, dirName,10 * 1024 * 1024); 
			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("uname"))
				{
					uname=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("gender"))
				{
					gender=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("email"))
				{
					email=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("mob"))
				{
					mobile=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("pass"))
				{
					password=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("loca"))
				{
					location=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("web"))
				{
					website=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			String nn ="0";
			Connection con =Databasecon.getConnection();
			PreparedStatement ps=con.prepareStatement("INSERT INTO ureg VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			 
	            ps.setInt(1,id);
	            ps.setString(2,uname);	
		        ps.setString(3,email);
       			ps.setString(4,password);
			    ps.setString(5,mobile);
			    ps.setString(6,gender);
				ps.setString(7,location);
				ps.setString(8,website);
				ps.setString(9,image);
				ps.setString(10,strDateNew);
				ps.setString(11,nn);											
				
       if(f == 0)
			ps.setObject(1,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(9,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("userlogin.jsp?message=success");
			}
			else
			{
				response.sendRedirect("index.html?message=fail");
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