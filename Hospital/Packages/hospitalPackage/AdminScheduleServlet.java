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

@WebServlet(urlPatterns = {"/AdminScheduleServlet"})
public class AdminScheduleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */

            HttpSession _session = request.getSession();
            try {
                _session.setAttribute("doctorId", request.getParameter("doctorId"));
                 _session.setAttribute("from", request.getParameter("from"));
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            //need to get appointment data
            Connection con = Connect_DB._testConnection();
            PreparedStatement pst = con.prepareStatement("select a.appointment_id, a.date, a.end_date, p.name, d.diagnosis_name, pr.prescription_name, t.treatment_name from appointment a join patient p on p.patient_id = a.patient_id join prescription pr on pr.prescription_code= a.prescription_code join diagnosis d on d.diagnosis_code = a.diagnosis_code join treatment t on a.treatment_code = t.treatment_code join doctor da on da.doctor_id = p.doctor_id where da.doctor_id = ?;");
            pst.setInt(1, Integer.parseInt((String) _session.getAttribute("doctorId")));
            ResultSet _rslt = pst.executeQuery();
            ArrayList<ArrayList<String>> Rows = new ArrayList<ArrayList<String>>();

            while (_rslt.next()) {
                ArrayList<String> row = new ArrayList<String>();
                row.add(Integer.toString(_rslt.getInt(1)));
                row.add(_rslt.getDate(2) != null ? _rslt.getDate(2).toString() : "");
                row.add(_rslt.getDate(3) != null ? _rslt.getDate(3).toString() : "");
                row.add(_rslt.getString(4));
                row.add(_rslt.getString(5));
                row.add(_rslt.getString(6));
                row.add(_rslt.getString(7));
                Rows.add(row);
            }
            request.setAttribute("appointmentDataList", Rows);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin-schedule.jsp");
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
