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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Nick
 */
@WebServlet(name = "AddPatientServlet", urlPatterns = {"/AddPatientServlet"})
public class AddPatientServlet extends HttpServlet {

    AddPatient _patient = new AddPatient();
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
        
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;
        
        String url = "jdbc:mysql://localhost/hospital";
        String _address = _patient.getAddress();
        String _city = _patient.getCity();
        String _DOB = _patient.getDOB();
        String _phone = _patient.getPhone();
        String _emergencyContact = _patient.getEmergencyContact();
        String _emergencyPhone = _patient.getEmerygencyPhone();
        String _emergencyRelation = _patient.getEmergencyRelation();
        String _gender = _patient.getGender();
        String _name = _patient.getName();
        int _OHIP = _patient.getOHIP();
        String _postalCode = _patient.getPostalCode();
        int _SSN = _patient.getSSN();
        int _status = _patient.getPatientStatus();
        String _allergies = _patient.getAllergies();
        int _doctorID = _patient.getDoctor();
        PrintWriter out = response.getWriter();
        try {


             con = Connect_DB._testConnection();


            //con = DriverManager.getConnection(url, user, pwd);
            if(con != null){
                pst = con.prepareStatement("INSERT INTO patient (postal_code,OHIP,SSN,gender,dob,city,"
                        + "address,name,phone_no,emergency_phone,emergency_name,emergency_contact,patient_status_code,allergies,doctor_id)"
                        + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                pst.setString(1,_postalCode);
                pst.setInt(2, _OHIP);
                pst.setInt(3,_SSN);
                pst.setString(4, _gender);
                pst.setString(5,_DOB);
                pst.setString(6, _city);
                pst.setString(7,_address);
                pst.setString(8, _name);
                pst.setString(9,_phone);
                pst.setString(10, _emergencyPhone);
                pst.setString(11,_emergencyContact);
                pst.setString(12, _emergencyRelation);
                pst.setInt(13, _status);
                pst.setString(14, _allergies);
                pst.setInt(15, _doctorID);
                
                try
                {
                pst.executeUpdate();

                }
                catch(Exception ex)
                {
                ex.printStackTrace();
                }
                
            } else {
                System.out.println("conn is null");
            }
            response.sendRedirect("StaffServlet");
        }
        catch(SQLException ex)
        {
            /* TODO output your page here. You may use following sample code. */
            
        } finally {
            out.close();
        }
    }
    public static Connection testConnection(String url, String user, String pwd)
            throws ClassNotFoundException, SQLException {
        
        try
        {
            Connection con = Connect_DB._testConnection();
            return con;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
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
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;

        System.out.println("in doget");
        try { 

                con = Connect_DB._testConnection();

            
            
            if (con != null) {
                System.out.println("con not null, getting doctors");
            pst = con.prepareStatement("select doctor_id, last_name, first_name from doctor;");
            ResultSet result = pst.executeQuery();
            
            List<AddDoctor> doctors = new ArrayList<AddDoctor>();
            while (result.next()) {
                System.out.println("adding new doctor " + result.getInt(1) + result.getString(2) + result.getString(3));
                AddDoctor doctor = new AddDoctor();
                doctor.setID(result.getInt(1));
                doctor.setLName(result.getString(2));
                doctor.setFName(result.getString(3));
                doctors.add(doctor);
            }
            request.setAttribute("Doctors", doctors);
            
            result.close();
            pst.close();
            con.close();
            
            
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            
        }
        
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/add-patient.jsp");
        requestDispatcher.forward(request,response);
        //processRequest(request, response);
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
        _patient.setAddress((request.getParameter("Address")));
        _patient.setCity(request.getParameter("City"));
        _patient.setDOB(request.getParameter("DOB"));
        _patient.setEmergencyContact(request.getParameter("Emergency_Contact"));
        _patient.setEmergencyPhone(request.getParameter("Emergency_Phone"));
        _patient.setEmergencyRelation(request.getParameter("Emergency_Relation"));
        _patient.setGender(request.getParameter("Gender"));
        _patient.setName(request.getParameter("Name"));
        _patient.setPhone(request.getParameter("Phone"));
        _patient.setOHIP(Integer.parseInt(request.getParameter("OHIP")));
        _patient.setPostalCode(request.getParameter("Postal_Code"));
        _patient.setSSN(Integer.parseInt(request.getParameter("SSN")));
        _patient.setDoctor(Integer.parseInt(request.getParameter("Doctor")));
        _patient.setPatientStatus(Integer.parseInt(request.getParameter("Patient_Status")));
        _patient.setAllergies(request.getParameter("Allergies"));
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
