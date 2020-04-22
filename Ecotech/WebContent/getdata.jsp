<%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="org.json.JSONObject" %>

<%
    Connection conn= null;
 try{
  Class.forName("com.mysql.cj.jdbc.Driver");
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pi2020_1?useTimezone=true&serverTimezone=America/Sao_Paulo&user=root&password=bomdesql312");

        ResultSet rs = null;
        List empdetails = new LinkedList();
        JSONObject responseObj = new JSONObject();

        String query = "SELECT * from umidade";
          PreparedStatement pstm= conn.prepareStatement(query);

           rs = pstm.executeQuery();
           JSONObject empObj = null;

        while (rs.next()) {
            String nivel = rs.getString("nivel");
         
            int id = rs.getInt("id");

            empObj = new JSONObject();

            empObj.put("nivel", nivel);
          
            empObj.put("id", id);

            empdetails.add(empObj);
        }
        responseObj.put("empdetails", empdetails);
    out.print(responseObj.toString());
    }
    catch(Exception e){
        e.printStackTrace();
    }finally{
        if(conn!= null){
            try{
            conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
 %>