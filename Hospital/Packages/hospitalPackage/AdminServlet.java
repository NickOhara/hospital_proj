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
@WebServlet(urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

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
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst;
            HttpSession _session = request.getSession();
            UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
            if (_login.getAccessLevel() == 0) {
                pst = con.prepareStatement("SELECT patient_id,name,OHIP,dob,gender,concat(doctor.last_name,',',doctor.first_name) as doc_name,"
                        + "patient_status.status_type FROM patient JOIN patient_status ON patient_status_code = status_code "
                        + "JOIN doctor ON patient.doctor_id = doctor.doctor_id");


                ResultSet resultSet = pst.executeQuery();

                ArrayList Rows = new ArrayList();

                while (resultSet.next()) {
                    ArrayList row = new ArrayList();
                    for (int i = 1; i <= 7; i++) {
                        row.add(resultSet.getString(i));
                    }

                    Rows.add(row);
                }
                request.setAttribute("userDataList", Rows);

                pst = con.prepareStatement("select d.doctor_id, d.last_name, d.first_name, s.specialization from doctor d, doctor_specialization s where d.specialization = s.id;");

                ResultSet doctorInfoResult = pst.executeQuery();

                ArrayList<ArrayList<String>> doctors = new ArrayList<ArrayList<String>>();
                while (doctorInfoResult.next()) {
                    pst = con.prepareStatement("select count(p.patient_id) from patient p where p.doctor_id = ?;");
                    pst.setInt(1, doctorInfoResult.getInt(1));
                    ResultSet patientCountResult = pst.executeQuery();

                    int numPatients = 0;
                    if (patientCountResult.next()) {
                        numPatients = patientCountResult.getInt(1);
                    }

                    ArrayList<String> doctor = new ArrayList<String>();
                    doctor.add(Integer.toString(doctorInfoResult.getInt(1)));
                    doctor.add(doctorInfoResult.getString(2) + "," + doctorInfoResult.getString(3));
                    doctor.add(doctorInfoResult.getString(4));
                    doctor.add(Integer.toString(numPatients));

                    doctors.add(doctor);
                }
                doctorInfoResult.close();
                request.setAttribute("Doctors", doctors);

                pst = con.prepareStatement("select staff_id, last_name, first_name, extn from staff;");
                ResultSet staffInfoResult = pst.executeQuery();

                ArrayList<ArrayList<String>> staff = new ArrayList<ArrayList<String>>();
                while (staffInfoResult.next()) {
                    ArrayList<String> staffMember = new ArrayList<String>();
                    staffMember.add(Integer.toString(staffInfoResult.getInt(1)));
                    staffMember.add(staffInfoResult.getString(2) + "," + staffInfoResult.getString(3));
                    staffMember.add(Integer.toString(staffInfoResult.getInt(4)));

                    staff.add(staffMember);
                }
                request.setAttribute("Staff", staff);
                staffInfoResult.close();
                pst.close();
                con.close();

                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
                requestDispatcher.forward(request, response);
            }

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
