/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitalPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikededys
 */
public class DoctorPremissions extends HttpServlet {

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
        try {
            HttpSession _session = request.getSession();
            //need to get appointment data
            Connection con = Connect_DB._testConnection();
            String apt_id = (String) _session.getAttribute("apt-id");
            int a_id = Integer.parseInt(apt_id);
            int perms = Integer.parseInt(request.getParameter("p"));
           
                PreparedStatement pst = con.prepareStatement("SELECT COUNT(doctor_code) FROM doctor_appointment where doctor_code = ? AND appointment_code = ?");
                pst.setInt(1, Integer.parseInt(request.getParameter("doctors")));
                pst.setInt(2, a_id);
                ResultSet rs = pst.executeQuery();
                rs.next();
                if (rs.getInt(1) == 0) {
                    pst = con.prepareStatement("INSERT INTO doctor_appointment (doctor_code, appointment_code, permission) VALUES(?,?,?)");
                    pst.setInt(1, Integer.parseInt(request.getParameter("doctors")));
                    pst.setInt(2, a_id);
                    pst.setInt(3, perms);
                } else {
                    pst = con.prepareStatement("UPDATE doctor_appointment set permission = ? where doctor_code = ? AND appointment_code = ?");
                    pst.setInt(2, Integer.parseInt(request.getParameter("doctors")));
                    pst.setInt(3, a_id);
                    pst.setInt(1, perms);
                }
                pst.executeUpdate();

            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/DoctorPageServlet");
            requestDispatcher.forward(request, response);
        } catch (SQLException ex) {
            out.println(ex);
        } finally {
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
