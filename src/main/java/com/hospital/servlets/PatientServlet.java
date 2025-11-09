package com.hospital.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PatientServlet")
public class PatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hospital_db", "root", "Singh@2704");
            
            String query = "INSERT INTO patients (name, age, gender, phone, email) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, Integer.parseInt(age));
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            
            int result = ps.executeUpdate();
            
            if(result > 0) {
                response.sendRedirect("view-patients.jsp?msg=success");
            } else {
                response.sendRedirect("add-patient.jsp?msg=error");
            }
            
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-patient.jsp?msg=error");
        }
    }
}
