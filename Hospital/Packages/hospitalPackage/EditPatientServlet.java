/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hospitalPackage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author GSP
 */
@WebServlet(name = "EditPatientServlet", urlPatterns = {"/EditPatientServlet"})
public class EditPatientServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

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
        //processRequest(request, response);
        int patientId = Integer.parseInt(request.getParameter("patientId"));
        request.setAttribute("patientId", patientId);
        //get patient info from database
        try {
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;

            
            pst = con.prepareStatement("select p.name, p.gender, p.dob, p.address, p.city, p.phone_no, p.postal_code, p.allergies,"
                    + " p.emergency_phone, p.emergency_name, p.emergency_contact,p.patient_status_code,ps.status_type from patient as p JOIN patient_status as ps ON ps.status_code = p.patient_status_code where patient_id = ?");
            pst.setInt(1, patientId);

            ResultSet result = pst.executeQuery();
            //put info into session
            if (result.next()) {
                System.out.println("got patient info");
                request.setAttribute("name", result.getString("name"));
                request.setAttribute("gender", result.getString("gender"));
                request.setAttribute("dob", result.getString("dob"));
                request.setAttribute("address", result.getString("address"));
                request.setAttribute("city", result.getString("city"));
                request.setAttribute("phone_no", result.getString("phone_no"));
                request.setAttribute("postal_code", result.getString("postal_code"));
                request.setAttribute("allergies", result.getString("allergies"));
                request.setAttribute("emergency_phone", result.getString("emergency_phone"));
                request.setAttribute("emergency_name", result.getString("emergency_name"));
                request.setAttribute("emergency_contact", result.getString("emergency_contact"));
                 request.setAttribute("status_type", result.getString("status_type"));
                  request.setAttribute("status_code", result.getString("patient_status_code"));
            }
            
            pst = con.prepareStatement("Select * from patient_status where status_type != ?");
            pst.setString(1, result.getString("status_type"));
            
            result = pst.executeQuery();
            String out_html = "";
            while(result.next()){
                out_html += "<option value=\"" + result.getInt(1) + "\">" + result.getString(2) + "</option>";     
            }
            request.setAttribute("stats",out_html);
            //redirect to patient info jsp
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/patient-details.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("patientId") == null) return;
        int patientId = Integer.parseInt(request.getParameter("patientId").trim().replace("\"", ""));

        try {
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;

            pst = con.prepareStatement("update patient set name=?, gender=?, dob=?, city=?, postal_code=?, address=?, phone_no=?, allergies = ?, " + 
                    "emergency_phone=?, emergency_name=?, emergency_contact=?, patient_status_code=? where patient_id = ?");
            pst.setString(1, request.getParameter("Name"));
            pst.setString(2, request.getParameter("Gender"));
            pst.setString(3, request.getParameter("DOB"));
            pst.setString(4, request.getParameter("City"));
            pst.setString(5, request.getParameter("Postal_Code"));
            pst.setString(6, request.getParameter("Address"));
            pst.setString(7, request.getParameter("Phone"));
            pst.setString(8, request.getParameter("Allergies"));
            pst.setString(9, request.getParameter("Emergency_Phone"));
            pst.setString(10, request.getParameter("Emergency_Name"));
            pst.setString(11, request.getParameter("Emergency_Contact"));
            pst.setString(12, request.getParameter("status"));
            pst.setInt(13, patientId);
            
            pst.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        HttpSession _session = request.getSession();
        UserLogin _login = (UserLogin)_session.getAttribute("userLogin");
        if( _login.getAccessLevel() == 2){
            response.sendRedirect("DoctorPageServlet");
        }else if(_login.getAccessLevel() == 3){
            response.sendRedirect("StaffServlet");
        }
    }
}
