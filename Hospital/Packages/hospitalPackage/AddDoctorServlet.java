/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package hospitalPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import hospitalPackage.AddDoctor;
import javax.servlet.http.HttpSession;
/**
 *
 * @author mikededys
 */
public class AddDoctorServlet extends HttpServlet {
    AddDoctor _doctor = new AddDoctor();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         java.sql.Connection con;
        try {
            con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;
            HttpSession _session = request.getSession();
            pst = con.prepareStatement("INSERT INTO doctor (doctor_id,last_name,first_name) VALUES (?,?,?)");
            pst.setInt(1,_doctor.getID());
            pst.setString(2,_doctor.getLName());
            pst.setString(3,_doctor.getFName());
            pst.execute();
            con.close();
            response.sendRedirect("index.jsp");
        }  catch(SQLException ex)
        {
            System.out.println(ex);
            
        }finally {
           
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        _doctor.setID(Integer.parseInt(request.getParameter("id")));
        _doctor.setFName(request.getParameter("fname"));
        _doctor.setLName(request.getParameter("lname"));
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
