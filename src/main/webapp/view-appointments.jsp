<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Appointments</title>
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
        .status { padding: 5px 10px; border-radius: 3px; font-weight: bold; }
        .status-scheduled { background: #ffc107; color: #000; }
        .status-completed { background: #28a745; color: white; }
        .status-cancelled { background: #dc3545; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Appointments</h2>
        <table>
            <tr>
                <th>ID</th><th>Patient Name</th><th>Doctor Name</th><th>Date</th><th>Status</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
                    
                    String query = "SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, " +
                                   "a.appointment_date, a.status " +
                                   "FROM appointments a " +
                                   "JOIN patients p ON a.patient_id = p.patient_id " +
                                   "JOIN doctors d ON a.doctor_id = d.doctor_id " +
                                   "ORDER BY a.appointment_date DESC";
                    
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    
                    boolean hasData = false;
                    while(rs.next()) {
                        hasData = true;
                        String status = rs.getString("status");
                        String statusClass = "status-scheduled";
                        if("Completed".equals(status)) statusClass = "status-completed";
                        if("Cancelled".equals(status)) statusClass = "status-cancelled";
            %>
            <tr>
                <td><%= rs.getInt("appointment_id") %></td>
                <td><%= rs.getString("patient_name") %></td>
                <td><%= rs.getString("doctor_name") %></td>
                <td><%= rs.getDate("appointment_date") %></td>
                <td><span class="status <%= statusClass %>"><%= status %></span></td>
            </tr>
            <%
                    }
                    if(!hasData) {
            %>
            <tr><td colspan="5" class="no-data">No appointments found. Book an appointment first.</td></tr>
            <%
                    }
                    con.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='5' class='no-data'>Error: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                }
            %>
        </table>
        <br><a href="dashboard.jsp">&larr; Back to Dashboard</a>
    </div>
</body>
</html>
