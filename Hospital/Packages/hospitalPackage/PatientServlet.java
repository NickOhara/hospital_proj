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

@WebServlet(name = "PatientServlet", urlPatterns = {"/PatientServlet"})
public class PatientServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;
            HttpSession _session = request.getSession();
            UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
            if (_login.getAccessLevel() == 3) {
                pst = con.prepareStatement("SELECT patient_id,name,OHIP,dob,gender,concat(doctor.last_name,',',doctor.first_name) as doc_name,patient_status.status_type FROM patient JOIN patient_status "
                        + "ON patient_status_code = status_code JOIN doctor ON patient.doctor_id = doctor.doctor_id and patient.doctor_id = "
                        + "(select sp.doctor_id from staff_permission sp join staff s on s.staff_id = sp.staff_id and s.staff_id = ? where sp.permission = true);");
                pst.setInt(1, _login.getUserID());
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession _session = request.getSession();
        UserLogin _login = (UserLogin) _session.getAttribute("userLogin");

        int patientId = _login.getUserID();
        request.setAttribute("patientId", patientId);
        //get patient info from database
        try {
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;

            pst = con.prepareStatement("select name, gender, dob, address, city, phone_no, postal_code, allergies,"
                    + " emergency_phone, emergency_name, emergency_contact from patient where patient_id = ?");
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
            }

            //need to get appointment data
            pst = con.prepareStatement("select appointment_id, date,length,freeform_comments from appointment where patient_id = ?");
            pst.setInt(1, patientId);
            ResultSet _rslt = pst.executeQuery();
            ArrayList Rows = new ArrayList();

            while (_rslt.next()) {
                ArrayList row = new ArrayList();
                for (int i = 1; i <= 4; i++) {
                    row.add(_rslt.getString(i));
                }

                Rows.add(row);
            }
            request.setAttribute("appointmentDataList", Rows);

            pst = con.prepareStatement("select d.doctor_id, d.last_name, d.first_name, s.specialization " 
                    + "from doctor d, doctor_specialization s "
                    + "where d.specialization = s.id and d.doctor_id = (select p.doctor_id from patient p where p.patient_id = ?);");
            pst.setInt(1, patientId);
            ResultSet doctorInfoResult = pst.executeQuery();

            ArrayList<String> doctor = new ArrayList<String>();
            if (doctorInfoResult.next()) {
                doctor.add(Integer.toString(doctorInfoResult.getInt(1)));
                doctor.add(doctorInfoResult.getString(2) + "," + doctorInfoResult.getString(3));
                doctor.add(doctorInfoResult.getString(4));

            }
            doctorInfoResult.close();
            request.setAttribute("doctor", doctor);
            
            //redirect to patient info jsp
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/patient.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("patientId") == null) {
            return;
        }
        int patientId = Integer.parseInt(request.getParameter("patientId").trim().replace("\"", ""));

        try {
            java.sql.Connection con = Connect_DB._testConnection();
            java.sql.PreparedStatement pst = null;

            pst = con.prepareStatement("update patient set name=?, gender=?, dob=?, city=?, postal_code=?, address=?, phone_no=?, allergies = ?, "
                    + "emergency_phone=?, emergency_name=?, emergency_contact=? where patient_id = ?");
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
            pst.setInt(12, patientId);

            pst.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("PatientServlet");
    }
}
