<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %> 
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
 <%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%> 
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="org.jfree.data.jdbc.*" %>
<style>
.aa
{}
*
{
margin:0px;
padding:0px;
}
ul{
    list-style-type: none;
    margin: 20;
    margin-left:20px;
    margin-right:20px;
    margin-top:10px;
    padding:40;
    overflow: hidden;
    background-color: #326b5a;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 35px;
    text-decoration: none;
}

li a:hover {
    background-color: #111111;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
<div class="first">
<ul>
  <li><a href="index.html">Home</a></li>
  <li><a href="net.jsp">Back</a></li>
  <li><a href="index.html">Logout</a></li>
</ul>
</div>
<%
String query=("SELECT website,count(id) as count from ureg group by website");
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/socialnetwork","com.mysql.jdbc.Driver","root","admin");
dataset.executeQuery(query);
JFreeChart chart = ChartFactory.createBarChart3D("CHART BASED ON Networks","NETWORK NAME", "NO OF  ID",dataset, PlotOrientation.VERTICAL, true, true, false);
try
{
ChartUtilities.saveChartAsJPEG(new File("D:/new/social_networking/WebContent/images/cc.jpg"), chart, 700, 300);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>
<div class="aa">
<img src="images/cc.jpg" height="650" width="1300" border="0" />
</div>
