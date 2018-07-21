
 <%@page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.File"%>
<%@page import="org.jfree.chart.ChartRenderingInfo"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Social Networking</title>
<link href="ss.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- <div class="f">
<h2>Choose Your Leader</h2>
</div> -->
<div class="ff">
<a href="adminview.jsp"><h3>Back</h3></a>
</div>

<%

Connection con=null;
Statement st = null;
ResultSet rs = null;

StringBuffer community=new StringBuffer();
StringBuffer count=new StringBuffer();
String mycommunity[]=null;
String mydata=null;
int mylength=0; 

String dno=null;
//String a="Not Complaint";
final DefaultPieDataset data = new DefaultPieDataset();
try{
	 con=Databasecon.getConnection();
	st = con.createStatement();
	String qry ="SELECT name,rating FROM ureg"; 
	rs = st.executeQuery(qry);
	while(rs.next()){
		mydata=rs.getString("rating")+"----"+rs.getString("name");
		data.setValue(mydata, new Double((double)rs.getInt("rating")));
	
	}
	
	
	//match chart

		

		
								  						
		JFreeChart chart = ChartFactory.createPieChart
		("Pie Chart Representation Of User Ratings", data, true, true, false);
						
		try {
			final ChartRenderingInfo info = new 
			ChartRenderingInfo(new StandardEntityCollection());
						
			final File file1 = new File("D:/new/social_networking/WebContent/images/match.png");
			ChartUtilities.saveChartAsPNG(file1, chart, 600, 475, info);
						  
			} catch (Exception e) {
				out.println(e);
			}
	//chart
		
}
catch(Exception ex){
	out.println(ex);
}
%> 
<div class="la">
	<img src="images/match.png" width="1000" height="600">		
	</div>	 
	</body>
</html>			 