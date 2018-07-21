<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!--<![endif]-->
<style> 
.top


{
	 background-image:url(images/sss.jpg);
	background-size:100%100%; 
	border-radius:25px;
	border:2px solid white;
	margin-top:30px;
	margin-left:30px;
	height:260px;
	width:500px;
	background-color:white;
	float:left;
	overflow:hidden; 

}
.last
{
border-radius:25px;
	border:2px solid white;
	margin-top:70px;
	margin-left:110px;
	height:160px;
	width:450px;
	background-color:white;
	float:left;
	overflow:hidden; 

}

.last table
{
margin-top: 30px;
margin-left: 80px;
}
</style>
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
      <h2 class="color2">Admin Login Page</h2>
      <div id="filters" class="button-group">
       
        <a href="#skills" class="btn" data-filter="userlogin.jsp">Back</a>
        <a href="index.html" class="btn" data-filter=".photo">logout</a>
       <!--  <a href="index.html#portfolio" class="btn" data-filter=".design">Back</a> -->
       
       
      </div>
  
   

    </div>
    <div class="top">
    </div>
    <div class="last">
   <form name="" action="admindb.jsp" method="post">
   <table align="center">
   <tr><td><font color=""> Name :</font></td>
   <td><input type="text" name="uname" autocomplete="off"></td></tr>
   <tr><td><font color="">Password  :</font></td>
   <td><input type="password" name="pwd"></td></tr>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<tr>
   <td align="center">
<button type="submit" value="submit">Login</button></td></tr>
   </table>
   </form>
</div>
    <div class="clear"></div>
  </div>
</section>
</body>
</html>