package hospitalPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/StaffDeletePatientServlet"})
public class StaffDeletePatientServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int patientId = Integer.parseInt(request.getParameter("patientId").trim().replace("\"", ""));
        try {
            Connection con = Connect_DB._testConnection();
            HttpSession _session = request.getSession();

            PreparedStatement pst = con.prepareStatement("delete from doctor_appointment where appointment_code in (select appointment_id from appointment where patient_id = ?);");
            pst.setInt(1, patientId);
            pst.executeUpdate();

            pst = con.prepareStatement("delete from appointment where patient_id = ?;");
            pst.setInt(1, patientId);
            pst.executeUpdate();

            pst = con.prepareStatement("delete from patient where patient_id = ?;");
            pst.setInt(1, patientId);
            pst.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/StaffServlet");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
