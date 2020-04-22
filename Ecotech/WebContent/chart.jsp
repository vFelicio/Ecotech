 <!DOCTYPE html>

<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">

  <script type="text/javascript" src="/js/lib/dummy.js"></script>

    <link rel="stylesheet" type="text/css" href="/css/result-light.css">

  <style type="text/css">

  </style>
 <title>Google Chart with jsp Mysql Json</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <a href="googlechart3.html">
    <button>Atualizar dados</button></a>
    

       <script type="text/javascript">

     //setTimeout(funcao, 40000);
    //document.write('dentro da função');
        var queryObject="";
        var queryObjectLen="";

        google.load("visualization", "1", {packages:["corechart"]});
        google.setOnLoadCallback(drawBasic);


      function drawBasic() {

      $.ajax({
            type : 'POST',
            url : 'getdata.jsp',
            dataType:'json',
            success : function(data) {
                queryObject = eval('(' + JSON.stringify(data) + ')');
                queryObjectLen = queryObject.empdetails.length;


            },
                error : function(xhr, type) {
                document.write('server error occoured ');
            }

        });
   var data = new google.visualization.DataTable();

            data.addColumn('number', 'id');
            data.addColumn('number', 'nivel');


            for(var i=0;i<queryObjectLen;i++){ 

                var nivel = parseString(queryObject.empdetails[i].nivel);
                var id = parseInt(queryObject.empdetails[i].id);

                data.addRows([
                   [id,nivel]
                ]);

            }

  var options = {
    hAxis: {
      title: 'ID'
    },
    vAxis: {
      title: 'Nivel'
    }
  };

  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

  chart.draw(data, options);

} 

     </script> 
     <script type="text/javascript" src="jQuery.js"></script>
    <script type="text/javascript">

            $(document).ready(function(){
                // First load the chart once 
                drawBasic();
                // Set interval to call the drawChart again
                setInterval(drawBasic, 1000);
                });
    </script>
    </head>
    <body>
    

         <div id="chart_div" style="width:100; height:300" ></div>

     </body>
    </html>