/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitalPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminAddDoctorServlet", urlPatterns = {"/AdminAddDoctorServlet"})
public class AdminAddDoctorServlet extends HttpServlet {

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
            pst = con.prepareStatement("INSERT INTO doctor (last_name,first_name,specialization) VALUES (?,?,?)");
            pst.setString(1, _doctor.getLName());
            pst.setString(2, _doctor.getFName());
            pst.setInt(3, _doctor.getSpecialization());
            pst.execute();
            con.close();
            response.sendRedirect("AdminServlet");
        } catch (SQLException ex) {
            System.out.println(ex);

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
        try {
            java.sql.Connection con = Connect_DB._testConnection();
            if (con != null) {
                java.sql.PreparedStatement pst = con.prepareStatement("select id, specialization from doctor_specialization;");
                ResultSet result = pst.executeQuery();
                
                ArrayList<ArrayList<String>> specs = new ArrayList<ArrayList<String>>();
                while (result.next()) {
                    ArrayList<String> spec = new ArrayList<String>();
                    spec.add(Integer.toString(result.getInt(1)));
                    spec.add(result.getString(2));
                    
                    specs.add(spec);
                }
                
                request.setAttribute("specializations", specs);
                 RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin-add-doctor.jsp");
        requestDispatcher.forward(request,response);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
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
        _doctor.setFName(request.getParameter("fname"));
        _doctor.setLName(request.getParameter("lname"));
        _doctor.setSpecialization(Integer.parseInt(request.getParameter("specialization")));
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
