<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
        var jsonData = $.ajax({
            url: "getdata.jsp",
            dataType: "json",
            
            }).done(function (jsonData) {
            	  var data = new google.visualization.DataTable();
            	  data.addColumn('number', 'id');
            	  data.addColumn('number', 'nivel');

            	  jsonData.forEach(function (row) {
            	    data.addRow([
            	      row.id,
            	      row.nivel
            	    ]);
            	  });
 
            	  var chart = new google.visualization.LineChart(document.getElementById('chartDiv'));
            	  chart.draw(data, {
            	    width: 400,
            	    height: 240
            	  });
            	}).fail(function (jq, text, err) {
            	  console.log(text + ' - ' + err);
            	});
      }
    </script>
     <script type="text/javascript" src="js/jquery.min.js"></script>
   
  </head>
  <body>
     <div id="chart_div"></div>
  </body>
</html>