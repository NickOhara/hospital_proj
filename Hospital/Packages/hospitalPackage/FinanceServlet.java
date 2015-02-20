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
public class FinanceServlet extends HttpServlet {

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
                
                con.close();

                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/fianance.jsp");
                requestDispatcher.forward(request, response);
            

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
