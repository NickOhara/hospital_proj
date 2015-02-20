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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AdminAppointmentServlet"})
public class AdminAppointmentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */

            HttpSession _session = request.getSession();
            try {
                _session.setAttribute("patientID", request.getParameter("patientID"));
                System.out.println("patient id is " + request.getParameter("patientID"));
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            //need to get appointment data
            Connection con = Connect_DB._testConnection();
            PreparedStatement pst = con.prepareStatement("select appointment_id, date,length,freeform_comments from appointment where patient_id = ?");
            pst.setInt(1, Integer.parseInt((String) _session.getAttribute("patientID")));
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
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin-appointment.jsp");
            requestDispatcher.forward(request, response);
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("in doget");
        processRequest(request, response);
    }
}
