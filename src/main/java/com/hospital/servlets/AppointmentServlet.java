package com.hospital.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String patientId = request.getParameter("patient_id");
        String doctorId = request.getParameter("doctor_id");
        String date = request.getParameter("appointment_date");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
            
            String query = "INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(patientId));
            ps.setInt(2, Integer.parseInt(doctorId));
            ps.setDate(3, Date.valueOf(date));
            
            int result = ps.executeUpdate();
            
            if(result > 0) {
                response.sendRedirect("view-appointments.jsp?msg=success");
            } else {
                response.sendRedirect("book-appointment.jsp?msg=error");
            }
            
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("book-appointment.jsp?msg=error");
        }
    }
}
