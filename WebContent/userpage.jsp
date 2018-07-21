<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String uname=(String)session.getAttribute("un");
    String pp=(String)session.getAttribute("chh");
    String idd=(String)session.getAttribute("uid");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/animation.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/contact-form.css">
<link rel="stylesheet" href="css/touchTouch.css">
<link rel="stylesheet" href="css/style.css">
  <script src='//maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false'></script>
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/touchTouch.jquery.js"></script>
<script src="js/isotope.pkgd.js"></script>
<script src="js/TMForm.js"></script>
<script src="js/modal.js"></script>
<script src="js/camera.js"></script>
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="js/jquery.mobile.customized.min.js"></script>

<style> 
.top


{
	 background-image:url(images/a.jpg);
	background-size:100%100%;
	border-radius:25px;
	border:2px solid white;
	margin-top:10px;
	margin-left:30px;
	height:260px;
	width:1110px;
	background-color:white;
	float:left;
	overflow:hidden; 

}

</style>
<!--<![endif]-->

<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('.gallery .gall_item').touchTouch();
 });
 $(document).ready(function(){
     jQuery('#camera_wrap').camera({
      loader: false,
      pagination: true ,
      minHeight: '500',
      thumbnails: false,
      height: '44.42708333333333%',
      caption: true,
      navigation: false,
      fx: 'mosaic'
    });
    $('.gallery .gall-item').touchTouch();
  });
</script>
</head>
<body>
<section id="portfolio" class="page">
  <div class="container_12">
    <div class="grid_12">
      <h2 class="color2">User Home  Page</h2>
      <div id="filters" class="button-group">
        <a href="find.jsp" class="btn" >Send Friend Request</a>
        <a href="viewrequest.jsp" class="btn" >View  Request</a>
        <a href="shareimage.jsp" class="btn" data-filter="userlogin.jsp">Share Image</a>
        <a href="viewshareimage.jsp" class="btn" data-filter=".photo">View Image</a>
     <!--    <a href="search.jsp" class="btn" data-filter=".design">Search</a>  -->
       <a href="selecttime.jsp" class="btn" data-filter="userlogin.jsp">Logout</a>
       
      </div>
  
   

    </div>
    <div class="top">
  
</div>
    <div class="clear"></div>
  </div>
</section>
</body>
</html>