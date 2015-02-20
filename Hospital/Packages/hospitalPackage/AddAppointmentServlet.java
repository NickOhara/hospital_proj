/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package hospitalPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import hospitalPackage.AddAppointment;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.*;
import java.text.*;
import hospitalPackage.Connect_DB;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nick
 */
@WebServlet(name = "AddAppointmentServlet", urlPatterns = {"/AddAppointmentServlet"})
public class AddAppointmentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    AddAppointment _appointment = new AddAppointment();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            if(response.getHeader("Insert").equals("true"))
            {
                Connection con = Connect_DB._testConnection();
                PreparedStatement pst = con.prepareStatement("INSERT INTO appointment(appointment_id,freeform_comments,"
                        + "date,prescription_code,diagnosis_code,treatment_code,patient_id,`procedure`,length,end_date) "
                        + "values(NULL,?,?,?,?,?,?,?,?,?);");
                java.sql.Timestamp _date = new java.sql.Timestamp(_appointment.Date.getTime());
                pst.setString(1, _appointment.Comments);
                pst.setTimestamp(2, _date);
                pst.setInt(3,_appointment.Prescription);
                pst.setInt(4,_appointment.Diagnosis);
                pst.setInt(5,_appointment.Treatment);
                pst.setInt(6,_appointment.Patient);
                pst.setString(7,_appointment.Procedure);
                pst.setInt(8,_appointment.Length);
                Calendar cal = Calendar.getInstance();
                cal.setTimeInMillis(_date.getTime());
                cal.add(Calendar.MINUTE, _appointment.Length);
                Timestamp end_date = new Timestamp(cal.getTime().getTime());
                pst.setTimestamp(9, end_date);
                
                pst.executeUpdate();
            }
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Appointment?patientID="+_appointment.Patient);
            requestDispatcher.forward(request,response);
        }
        catch(SQLException ex){
            out.println(ex);
        }
        finally {
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Appointment?patientID="+_appointment.Patient);
            requestDispatcher.forward(request,response);
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
        HttpSession _session = request.getSession();
        _session.setAttribute("patientID", request.getParameter("patientID"));
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
        try{
            SimpleDateFormat _sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm");
            HttpSession _session = request.getSession();
            int _patientID = Integer.parseInt((String)_session.getAttribute("patientID"));
            String _time = request.getParameter("Hour")+":"+request.getParameter("Minute");
            String _date = request.getParameter("Month")+"-"+request.getParameter("Day")+"-"+request.getParameter("Year");
            
            if(checkDateForConflicts(_sdf.parse(_date+" "+_time))){
            _appointment.setComments(request.getParameter("Comments"));
            _appointment.setDate(_sdf.parse(_date+" "+_time));
            _appointment.setDiagnosis(Integer.parseInt(request.getParameter("Diagnosis")));
            _appointment.setPrescription(Integer.parseInt(request.getParameter("Prescription")));
            _appointment.setProcedure(request.getParameter("Procedure"));
            _appointment.setTime(_time);
            _appointment.setTreatment(Integer.parseInt(request.getParameter("Treatment")));
            _appointment.setLength(Integer.parseInt(request.getParameter("Length")));
            _appointment.setPatient(_patientID);
            response.addHeader("Insert", "true");
            processRequest(request, response);
            }
            else
            {
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/add-appointment.jsp?CONFLICK=YAHBABY");
                requestDispatcher.forward(request,response);
            }
        }
        catch(ParseException ex){
            
        }
        
    }
    public Boolean checkDateForConflicts(Date _date){
        try{
        java.sql.Timestamp date = new java.sql.Timestamp(_date.getTime());
        Connection con = Connect_DB._testConnection();
        PreparedStatement pst = con.prepareStatement("Select date from appointment where date=?");
        pst.setTimestamp(1,date);
        ResultSet rslt = pst.executeQuery();
        
        if(rslt.next()){
            return false;
        }
        return true;
        }
        catch(SQLException ex){
            return false;
        }
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
