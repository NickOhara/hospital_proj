/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitalPackage;

import java.io.IOException;
import java.io.PrintWriter;
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
public class StaffAssignment extends HttpServlet {

    int staff_id = 0;

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
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;
        HttpSession _session = request.getSession();
        UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
        String stmt = "";
        try {
            con = Connect_DB._testConnection();
            if (request.getParameter("fire") != null) {
                  stmt = "UPDATE staff_permission set permission = 0 where staff_id = ? AND doctor_id = ?";
                   pst = con.prepareStatement(stmt);
                   pst.setInt(2, _login.getUserID());
                   pst.setInt(1, Integer.parseInt(request.getParameter("fire")));
                    pst.executeUpdate();
            } else {
                pst = con.prepareStatement("SELECT COUNT(staff_id) as s from staff_permission where staff_id = ? AND doctor_id = ?");
                pst.setInt(1, staff_id);
                pst.setInt(2, _login.getUserID());
                ResultSet rs = pst.executeQuery();
                rs.next();
                int c = rs.getInt("s");
                if (c == 0) {
                    stmt = "INSERT INTO staff_permission VALUES (?,?,?)";
                    pst = con.prepareStatement(stmt);
                    pst.setInt(1, _login.getUserID());
                    pst.setInt(2, staff_id);
                    pst.setInt(3, 1);
                } else {
                    stmt = "UPDATE staff_permission set permission = 1 where staff_id = ? AND doctor_id = ?";
                    pst = con.prepareStatement(stmt);
                    pst.setInt(2, _login.getUserID());
                    pst.setInt(1, staff_id);
                }
                pst.executeUpdate();
            }
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/DoctorPageServlet");
            requestDispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
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
        staff_id = Integer.parseInt(request.getParameter("staff"));
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
