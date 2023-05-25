<%@page import="java.sql.*"%>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String dbURL = "jdbc:mysql://127.0.0.1:3306/rrhh";
    String user = "root";
    String password = "12345";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, user, password);
        stmt = conn.createStatement();

        // Ejecuta una consulta
        String sql = "SELECT * FROM usuarios";
        rs = stmt.executeQuery(sql);

        // Recorre el ResultSet y recupera los datos
        while (rs.next()) {
            // Por ejemplo, recuperando un valor de columna llamado "column_name"
            String columnData = rs.getString("username");
            out.print("<p>Usuario: " +  columnData + "</p>");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión</title>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    
</head>
<body>
    
    <form action="login" method="post">
        <div>
            <label for="username">Nombre de usuario:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <input type="submit" value="Iniciar sesión">
        </div>
    </form>
</body>
</html>