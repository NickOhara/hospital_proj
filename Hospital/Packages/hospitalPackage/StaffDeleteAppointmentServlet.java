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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/StaffDeleteAppointmentServlet"})
public class StaffDeleteAppointmentServlet extends HttpServlet {

    AddAppointment _appointment = new AddAppointment();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession _session = request.getSession();
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId").trim().replace("\"", ""));
        try {
            Connection con = Connect_DB._testConnection();
            

            PreparedStatement pst = con.prepareStatement("delete from doctor_appointment where appointment_code = ?");
            pst.setInt(1, appointmentId);
            pst.executeUpdate();

            pst = con.prepareStatement("delete from appointment where appointment_id = ?");
            pst.setInt(1, appointmentId);
            pst.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        UserLogin _login = (UserLogin)_session.getAttribute("userLogin");
        if(_login.accessLevel == 2){
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/DoctorPageServlet");
            requestDispatcher.forward(request, response);
        }
        else if(_login.accessLevel == 3){
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/StaffServlet");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
