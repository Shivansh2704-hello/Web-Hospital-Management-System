<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f5f5f5; }
        .container { max-width: 500px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; margin-bottom: 20px; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; border: 1px solid #ddd; border-radius: 5px; }
        button { padding: 12px 30px; background: #28a745; color: white; border: none; cursor: pointer; border-radius: 5px; font-size: 16px; }
        button:hover { background: #218838; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Book Appointment</h2>
        <form action="AppointmentServlet" method="post">
            <select name="patient_id" required>
                <option value="">Select Patient</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT patient_id, name FROM patients");
                        
                        while(rs.next()) {
                %>
                <option value="<%= rs.getInt("patient_id") %>"><%= rs.getString("name") %></option>
                <%
                        }
                        con.close();
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            
            <select name="doctor_id" required>
                <option value="">Select Doctor</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT doctor_id, name, specialization FROM doctors");
                        
                        while(rs.next()) {
                %>
                <option value="<%= rs.getInt("doctor_id") %>"><%= rs.getString("name") %> - <%= rs.getString("specialization") %></option>
                <%
                        }
                        con.close();
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            
            <input type="date" name="appointment_date" required>
            <button type="submit">Book Appointment</button>
        </form>
        <br><a href="dashboard.jsp">&larr; Back to Dashboard</a>
    </div>
</body>
</html>
