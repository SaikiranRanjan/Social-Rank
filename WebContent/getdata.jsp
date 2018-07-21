
<%@page import="databaseconnection.Databasecon"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

 try{
 Connection con=Databasecon.getConnection();
PreparedStatement ps=con.prepareStatement("SELECT name,stime FROM middle order by name");
 ResultSet rs=ps.executeQuery();
 List empdetails = new LinkedList();
 JSONObject responseObj = new JSONObject();
    JSONObject empObj = null;

        while (rs.next())
        {
        	 String dis = rs.getString("name");
        
        	
            int sid = rs.getInt("stime");
            
            empObj = new JSONObject();
            
          empObj.put("name", dis);
            empObj.put("stime", sid);
            
          
            
            empdetails.add(empObj);
        }
        responseObj.put("empdetails", empdetails);
    out.print(responseObj.toString());
    }
    catch(Exception e){
        e.printStackTrace();
    }
 %>