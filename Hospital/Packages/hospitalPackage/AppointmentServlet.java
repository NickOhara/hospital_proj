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
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nick
 */
public class AppointmentServlet extends HttpServlet {

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

            HttpSession _session = request.getSession();
            try{
                _session.setAttribute("patientID", request.getParameter("patientID"));
            }
            catch(Exception ex){
                
            }
            
            UserLogin _login = (UserLogin)_session.getAttribute("userLogin");
            
            _session.setAttribute("prescriptionDataList", getPrescriptions());
            _session.setAttribute("diagnosisDataList", getDiagnosis());
            _session.setAttribute("treatmentDataList", getTreatment());
            
            //need to get appointment data
            Connection con = Connect_DB._testConnection();
            PreparedStatement pst = con.prepareStatement("select appointment_id, date,length,freeform_comments from appointment where patient_id = ?");
            pst.setInt(1,Integer.parseInt((String)_session.getAttribute("patientID")));
            ResultSet _rslt = pst.executeQuery();
            ArrayList Rows = new ArrayList();
            while(_rslt.next()){
                 ArrayList row = new ArrayList();
                    for (int i = 1; i <= 4 ; i++){
                        row.add(_rslt.getString(i));
                }

                 Rows.add(row);
                }
            request.setAttribute("appointmentDataList", Rows);
            
            
        }
        catch(SQLException ex){
            out.println(ex);
        }
        finally {
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/appointments.jsp");
            requestDispatcher.forward(request,response);
            out.close();
        }
    }
    public ArrayList getPrescriptions(){
        try{
            Connection con = Connect_DB._testConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM prescription");
            ResultSet _rslt = pst.executeQuery();
            ArrayList Rows = new ArrayList();
            while(_rslt.next()){
                ArrayList row = new ArrayList();
                    for (int i = 1; i <= 2 ; i++){
                        row.add(_rslt.getString(i));
                    }
                    Rows.add(row);
            }
            return Rows;
        }
        catch(SQLException ex){
            return null;
        }
    }
    public ArrayList getDiagnosis(){
        try{
            Connection con = Connect_DB._testConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM diagnosis");
            ResultSet _rslt = pst.executeQuery();
            ArrayList Rows = new ArrayList();
            while(_rslt.next()){
                ArrayList row = new ArrayList();
                    for (int i = 1; i <= 2 ; i++){
                        row.add(_rslt.getString(i));
                    }
                    Rows.add(row);
            }
            return Rows;
        }
        catch(SQLException ex){
            return null;
        }
    }
    public ArrayList getTreatment(){
        try{
            Connection con = Connect_DB._testConnection();
            PreparedStatement pst = con.prepareStatement("SELECT * FROM treatment");
            ResultSet _rslt = pst.executeQuery();
            ArrayList Rows = new ArrayList();
            while(_rslt.next()){
                ArrayList row = new ArrayList();
                    for (int i = 1; i <= 2 ; i++){
                        row.add(_rslt.getString(i));
                    }
                    Rows.add(row);
            }
            return Rows;
        }
        catch(SQLException ex){
            return null;
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

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
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
