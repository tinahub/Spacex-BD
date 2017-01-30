<%-- 
    Document   : index
    Created on : 06-oct-2016, 13:14:06
    Author     : alumno
--%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*" %>
<%@page import="com.mysql.jdbc.Driver" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <% 
           
          // Pool de conexiones
            // Obtener el DataSource de un pool en concreto (context.xml)
            InitialContext initCtx=new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource dataSource = (DataSource)envCtx.lookup("jdbc/spacex");
            // Obtener conexión del pool
            Connection connection=dataSource.getConnection();
          
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

