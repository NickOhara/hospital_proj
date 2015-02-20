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
import javax.servlet.RequestDispatcher;
import java.sql.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nick
 */

@WebServlet(urlPatterns = {"/StaffServlet"})
public class StaffServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;
            HttpSession _session = request.getSession();
            UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
            if (_login.getAccessLevel() == 3) {
                pst = con.prepareStatement("SELECT p.patient_id,name,OHIP,dob,gender,concat(doctor.last_name,',',doctor.first_name) as doc_name,end_date,patient_status.status_type FROM patient as p JOIN patient_status ON patient_status_code = status_code JOIN doctor ON p.doctor_id = doctor.doctor_id and p.doctor_id in (select sp.doctor_id from staff_permission sp join staff s on s.staff_id = sp.staff_id and s.staff_id = ? where sp.permission = true) LEFT JOIN appointment as a1 ON (a1.patient_id = p.patient_id) AND a1.end_date = (SELECT MAX(end_date) FROM appointment as a2 WHERE a2.patient_id = p.patient_id) where p.doctor_id = doctor.doctor_id");
                pst.setInt(1, _login.getUserID());
                ResultSet resultSet = pst.executeQuery();

                ArrayList Rows = new ArrayList();

                while (resultSet.next()) {
                    ArrayList row = new ArrayList();
                    for (int i = 1; i <= 8; i++) {
                        if(resultSet.getString(i) == null){
                            row.add("");
                        }else {
                            row.add(resultSet.getString(i));
                        }
                    }

                    Rows.add(row);
                }
                request.setAttribute("userDataList", Rows);

                pst = con.prepareStatement("SELECT DISTINCT d.doctor_id,concat(d.last_name,',',d.first_name) as doc_name,ds.specialization,sp.permission FROM staff_permission as sp JOIN doctor as d ON d.doctor_id = sp.doctor_id JOIN doctor_specialization as ds ON d.specialization = ds.id  JOIN patient as p on p.doctor_id = d.doctor_id where staff_id = ?");
                pst.setInt(1, _login.getUserID());
                
                resultSet = pst.executeQuery();
                String out_html = "";
                
                while (resultSet.next()) {
                out_html += "<tr>";
                    for (int i = 1; i <= 5; i++) {
                        if(i == 5) {
                            if(resultSet.getString(i - 1).equalsIgnoreCase("1")){
                                out_html += "<td>YES</td>";
                            }else{
                                out_html += "<td>NO</td>";
                            }
                        }else if(i == 4){
                            int doc_id = Integer.parseInt(resultSet.getString(1));
                            pst = con.prepareStatement("SELECT COUNT(patient_id) from patient as p JOIN doctor as d ON d.doctor_id = p.doctor_id WHERE p.doctor_id = ?");
                            pst.setInt(1,doc_id);
                            ResultSet rs2 = pst.executeQuery();
                            rs2.next();
                            out_html += "<td>" + rs2.getString(1) + "</td>";
                        
                        }else {
                            out_html += "<td>" + resultSet.getString(i) + "</td>";
                        }
                    }
                    out_html += "</tr>";
                }
                request.setAttribute("doctor-list", out_html);
                
                
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/staff-main.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException ex) {

            out.println(ex);

            ex.printStackTrace();

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
