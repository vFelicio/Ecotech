     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Histórico de umidade</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
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
                data.addColumn('number', 'id');
                data.addColumn('number', 'nivel');
                for(var i=0;i<queryObjectLen;i++)
                {
                    var nivel = queryObject.empdetails[i].nivel;
                    var id = queryObject.empdetails[i].id;
                    data.addRows([
                        [parseInt(id),parseFloat(nivel)]
                    ]);
                }
                var options = {
                    title: 'Histórico de umidade',
                    
                    hAxis: {
                    	format: '0',
                    	title: 'ID de Registro'
                    	},
                    vAxis: {
                    	title: 'Nivel de umidade'
                    }
                };
  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));


 chart.draw(data,options);
 }
        </script>
        </head>
        <body>
        <c:import url="Menu.jsp"/>
              <div id="chart_div"></div>
         </body>
        </html>