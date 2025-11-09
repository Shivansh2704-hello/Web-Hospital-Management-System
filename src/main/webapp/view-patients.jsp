<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Patients</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background: #007bff; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        tr:hover { background: #f1f1f1; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
        .no-data { text-align: center; padding: 20px; color: #999; }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Patients</h2>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Age</th><th>Gender</th><th>Phone</th><th>Email</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM patients");
                    
                    boolean hasData = false;
                    while(rs.next()) {
                        hasData = true;
            %>
            <tr>
                <td><%= rs.getInt("patient_id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getInt("age") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("email") != null ? rs.getString("email") : "-" %></td>
            </tr>
            <%
                    }
                    if(!hasData) {
            %>
            <tr><td colspan="6" class="no-data">No patients found. Add a patient first.</td></tr>
            <%
                    }
                    con.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='6' class='no-data'>Error: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                }
            %>
        </table>
        <br><a href="dashboard.jsp">&larr; Back to Dashboard</a>
    </div>
</body>
</html>
