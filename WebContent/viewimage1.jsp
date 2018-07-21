<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
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

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;
String id=request.getParameter("id");

try {

	con=Databasecon.getConnection();

stmt = con.createStatement();

rs = stmt.executeQuery("select image from shareimage where id = '"+id+"' ");

if (rs.next()) {

image = rs.getBlob(1);

imgData = image.getBytes(1,(int)image.length());

} else {

out.println("Display Blob Example");

out.println("image not found for given image");

return;

}

// display the image

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {

rs.close();

stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}

%> 