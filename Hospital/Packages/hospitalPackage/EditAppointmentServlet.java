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
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
public class EditAppointmentServlet extends HttpServlet {

    AddAppointment _appointment = new AddAppointment();

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
        String _url = "";
        try {
            /* TODO output your page here. You may use following sample code. */
            Connection con = Connect_DB._testConnection();
            HttpSession _session = request.getSession();
            try{
            if(response.getHeader("Update").equals("true")){
                
                PreparedStatement pst = con.prepareStatement("UPDATE appointment set freeform_comments=?,"
                        + "date = ?,prescription_code=?,diagnosis_code=?,treatment_code=?,`procedure`=?,length=?,end_date=? where appointment_id=?");
                java.sql.Timestamp _date = new java.sql.Timestamp(_appointment.Date.getTime());
                pst.setString(1, _appointment.Comments);
                pst.setTimestamp(2, _date);
                pst.setInt(3,_appointment.Prescription);
                pst.setInt(4,_appointment.Diagnosis);
                pst.setInt(5,_appointment.Treatment);
                pst.setString(6,_appointment.Procedure);
                pst.setInt(7,_appointment.Length);
                Calendar cal = Calendar.getInstance();
                cal.setTimeInMillis(_date.getTime());
                cal.add(Calendar.MINUTE, _appointment.Length);
                Timestamp end_date = new Timestamp(cal.getTime().getTime());
                pst.setTimestamp(8, end_date);
                pst.setInt(9,Integer.parseInt((String)_session.getAttribute("appointmentId")) );
                
                pst.executeUpdate();
                _url = "/Appointment?patientID="+_appointment.Patient;

            }
            }catch(Exception ex){}
            
            _session.setAttribute("appointmentId",request.getParameter("appointmentId"));
            PreparedStatement pst = con.prepareStatement("Select * from appointment where appointment_id=?");
            pst.setInt(1,Integer.parseInt((String)_session.getAttribute("appointmentId")));
            ResultSet rslt = pst.executeQuery();
            
            ArrayList Rows = new ArrayList();
            
            while(rslt.next()){
                //System.out.println("got patient info");
                request.setAttribute("comments", rslt.getString("freeform_comments"));
                request.setAttribute("date", rslt.getString("date"));
                request.setAttribute("prescription", rslt.getString("prescription_code"));
                request.setAttribute("treatment", rslt.getString("treatment_code"));
                request.setAttribute("diagnosis", rslt.getString("diagnosis_code"));
                request.setAttribute("procedure", rslt.getString("procedure"));
                request.setAttribute("length", rslt.getString("length"));
            }
            _url ="/appointment-details.jsp";
            
        }
        catch(SQLException ex){
            _url = "/Appointment?patientID="+_appointment.Patient;
        }
        finally {
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(_url);
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
            SimpleDateFormat _sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            HttpSession _session = request.getSession();
            int _patientID = Integer.parseInt((String)_session.getAttribute("patientID"));
            String _date = request.getParameter("Date");
            _appointment.setComments(request.getParameter("Comments"));
            _appointment.setDate(_sdf.parse(_date));
            _appointment.setDiagnosis(Integer.parseInt(request.getParameter("Diagnosis")));
            _appointment.setPrescription(Integer.parseInt(request.getParameter("Prescription")));
            _appointment.setProcedure(request.getParameter("Procedure"));
            _appointment.setTreatment(Integer.parseInt(request.getParameter("Treatment")));
            _appointment.setLength(Integer.parseInt(request.getParameter("Length")));
            _appointment.setPatient(_patientID);
            response.addHeader("Update", "true");
        }
        catch(ParseException ex){
            
        }
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
