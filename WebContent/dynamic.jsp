 <!DOCTYPE html>
    <html>
    <head>
        <title>Google Chart with jsp Mysql Json</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery-3.1.1.min (1).js"></script>
        <script type="text/javascript" src="js/google.js"></script>
        <script type="text/javascript">
            var queryObject="";
            var queryObjectLen="";
            $.ajax({
                type : 'POST',
                url : 'getdata.jsp',
                dataType:'json',
                success : function(data) {
                    queryObject = eval('(' + JSON.stringify(data) + ')');
                    queryObjectLen = queryObject.empdetails.length;
                },
                    error : function(xhr, type) {
                    alert('server error occoured')
                }
            });
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
           var data = new google.visualization.DataTable();
                data.addColumn('string', 'name');
                data.addColumn('number', 'Start time');
             


                
                for(var i=0;i<queryObjectLen;i++)
                {
                    var name = queryObject.empdetails[i].name;
                    var id= queryObject.empdetails[i].Start time;
                  

             
                    data.addRows([
                        [name,parseInt(Starttime)]
                    ]);
                }
                var options = {
                    title: 'most number of file view using time securet key generation:',
                };
  var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));

 chart.draw(data,options);
 }
        </script>
        </head>
        <style>
        #chart_div
        {
        width:1300px;
        height:600px;
        margin-top:10px;
        
        
   }
   h2
   {
   font-style:italic;
   }
        
        </style>
    
        <body>
       <center> <h2>chart based on Securing Cloud Data under Key Exposure</h2></center>
      
              <div id="chart_div">
              
              </div>
         </body>
        </html>