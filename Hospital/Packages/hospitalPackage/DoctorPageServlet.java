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
import java.util.ArrayList;
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
public class DoctorPageServlet extends HttpServlet {

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
        try {
            con = Connect_DB._testConnection();
            pst = con.prepareStatement("SELECT DISTINCT p1.patient_id,name,ohip,ssn,dob,phone_no, end_date,status_Type FROM patient as p1 JOIN patient_status on status_code = patient_status_code LEFT JOIN appointment as a1 ON (a1.patient_id = p1.patient_id) AND a1.end_date = (SELECT MAX(end_date) FROM appointment WHERE patient_id = p1.patient_id) where doctor_id = ?");
            pst.setInt(1, _login.getUserID());
            ResultSet rs = pst.executeQuery();
            String out_html = "";
            while (rs.next()) {
                out_html += "<tr>";
                for (int i = 1; i <= 8; i++) {
                    if (rs.getString(i) == null) {
                        out_html += "<td>" + "</td>";
                    } else {
                        out_html += "<td>" + rs.getString(i) + "</td>";
                    }
                }
                int id = rs.getInt("patient_id");
                out_html += "<td><a href=\"EditPatientServlet?patientId="+id+"\">Details</a></td>";
                out_html += "<td><a href=\"Appointment?patientID="+id+"\">Appointments</a></td>";
                out_html += "</tr>";
            }
            request.setAttribute("table-rows", out_html); // This will be available as ${message}
            out_html = "";
            pst = con.prepareStatement("SELECT s1.staff_id,s1.first_name,s1.last_name,extn,s2.permission FROM STAFF as s1 JOIN staff_permission as s2 ON s2.staff_id = s1.staff_id JOIN doctor as d1 ON s2.doctor_id = d1.doctor_id where s2.doctor_id = ? AND s2.permission = 1");
            pst.setInt(1, _login.getUserID());
            rs = pst.executeQuery();
            String lastId = "";
            while (rs.next()) {
                out_html += "<tr>";
                for (int i = 1; i <= 5; i++) {
                           if(i == 1){
                            lastId = rs.getString(i);
                        }
                    if (i == 5) {
                        if(rs.getString(i).equalsIgnoreCase("0")){
                            out_html += "<td><a href=\"appointments.jsp\">Assign</a></td>";
                        }else {
                            out_html += "<td><a href=\"StaffAssignment?fire=" + lastId + "\">Fire</a></td>";
                        }
                    } else {
                        out_html += "<td>" + rs.getString(i) + "</td>";
                    }
                }
               
                out_html += "</tr>";
            }
            request.setAttribute("table-rows-staff", out_html);

            
            // Staff Member
            out_html = "";
            pst = con.prepareStatement("SELECT s1.staff_id,s1.first_name,s1.last_name FROM STAFF as s1 Left JOIN staff_permission as s2 ON s2.staff_id = s1.staff_id LEft JOIN doctor as d1 ON s2.doctor_id = d1.doctor_id where s2.doctor_id != ? OR (s2.doctor_id = ? AND s2.permission = 0) OR s2.permission is NULL");
            pst.setInt(1, _login.getUserID());
            pst.setInt(2, _login.getUserID());
            rs = pst.executeQuery();
            while (rs.next()) {
                 out_html += "<option ";
                for (int i = 1; i <= 3; i++) {
                    if(i == 1){
                        out_html += "value=" + rs.getString(i) + " >";
                    }else{
                        out_html += rs.getString(i) + " ";
                    }
                }
                out_html += "</option>";
            }
            request.setAttribute("staff-list", out_html);
             
            request.getRequestDispatcher("/doctor.jsp").forward(request, response);
        } catch (SQLException ex) {
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
