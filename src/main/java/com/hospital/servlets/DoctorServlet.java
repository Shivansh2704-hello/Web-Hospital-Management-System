package com.hospital.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
            
            String query = "INSERT INTO doctors (name, specialization, phone) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, specialization);
            ps.setString(3, phone);
            
            int result = ps.executeUpdate();
            
            if(result > 0) {
                response.sendRedirect("view-doctors.jsp?msg=success");
            } else {
                response.sendRedirect("add-doctor.jsp?msg=error");
            }
            
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-doctor.jsp?msg=error");
        }
    }
}
