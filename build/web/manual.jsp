<%-- 
    Document   : index
    Created on : 06-oct-2016, 13:14:06
    Author     : alumno
--%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conexión manual</title>
    </head>
    <body>
        
       <% 
           
          // Conexión manual
            // Obtener driver BD
            Class.forName("com.mysql.jdbc.Driver");
            // Obtener conexión
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spacex","root","root"); 
          
          String resultado;
          
            try {
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM cohete");
                rs.next();
                resultado = rs.getString("Nombre");
          
            } catch(SQLException e){
                throw new RuntimeException(e);
            } 
          
          finally{
              connection.close();
          }
       
       %>
       
        <%= resultado %>
       
       
    </body>
</html>