/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitalPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hospitalPackage.UserLogin;
import javax.servlet.http.HttpSession;
import java.sql.*;
import hospitalPackage.Connect_DB;

/**
 *
 * @author Nick
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UserLogin _login = new UserLogin();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        java.sql.Connection con = Connect_DB._testConnection();
        java.sql.PreparedStatement pst = null;

        String url = "jdbc:mysql://localhost/hospital";
        String user = _login.getUserName();
        String pwd = _login.getPassword();
        HttpSession _session = request.getSession();
        _session.setAttribute("userLogin", _login);
       
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            //con = DriverManager.getConnection(url, user, pwd);
            if (con != null) {
                pst = con.prepareStatement("SELECT * FROM login WHERE user_name =? AND passwd=?;");
                pst.setString(1, user);
                pst.setString(2,pwd);
                ResultSet rslt = pst.executeQuery();
                if (rslt.next()) {
                    int _level = rslt.getInt("access_level");
                    int _id = rslt.getInt("id");
                    _login.setAccessLevel(_level);
                    _login.setUserID(_id);
                    if(_level == 0){
                        response.sendRedirect("AdminServlet");
                    } else if (_level == 1) {
                        response.sendRedirect("FinanceServlet");
                    } else if (_level == 2) {
                        response.sendRedirect("DoctorPageServlet");
                    } else if (_level == 3) {
                        response.sendRedirect("StaffServlet");
                    } else if (_level == 4) {
                        response.sendRedirect("PatientServlet");
                    } else {
                        response.sendRedirect("index.jsp?loginnotsuccessful=true");
                    }
                } else {
                    response.sendRedirect("index.jsp?loginsuccessful=false");
                }
                con.close();
            }
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
        _login.setPassword(request.getParameter("password"));
        _login.setUserName(request.getParameter("username"));

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
