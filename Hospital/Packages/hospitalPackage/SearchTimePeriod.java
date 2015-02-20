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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikededys
 */
public class SearchTimePeriod extends HttpServlet {

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
            int doc_id = (Integer) _session.getAttribute("docId");
            SimpleDateFormat _sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm");

            String _time_start = "12:00";
            String _date_start = request.getParameter("Month-start") + "-" + request.getParameter("Day-start") + "-" + request.getParameter("Year-start");

            String _time_end = "12:00";
            String _date_end = request.getParameter("Month-end") + "-" + request.getParameter("Day-end") + "-" + request.getParameter("Year-end");
            java.sql.Timestamp _date_s = new java.sql.Timestamp(_sdf.parse(_date_start + " " + _time_start).getTime());
            java.sql.Timestamp _date_e = new java.sql.Timestamp(_sdf.parse(_date_end + " " + _time_end).getTime());

            pst = con.prepareStatement("SELECT DISTINCT p.patient_id,p.name, ps.status_type FROM patient as p Left JOIN appointment as a ON p.patient_id = a.patient_id JOIN patient_status as ps ON p.patient_status_code = ps.status_code where doctor_id = ? AND (a.date >= ? AND a.date <= ?)");
            pst.setInt(1, doc_id);
            pst.setTimestamp(2, _date_s);
            pst.setTimestamp(3, _date_e);

            ResultSet rs = pst.executeQuery();
            String out_html = "";
            int count = 0;
            int p_count = 0;int p_id = 0;
            while (rs.next()) {
                out_html += "<tr>";
                for (int i = 1; i <= 3; i++) {
                    if (i == 1) {
                        pst = con.prepareStatement("SELECT COUNT(p.patient_id) FROM patient as p Left JOIN appointment as a ON p.patient_id = a.patient_id JOIN patient_status as ps ON p.patient_status_code = ps.status_code where doctor_id = ? AND p.patient_id = ? AND ( a.date >= ? AND a.date <= ? )");
                        pst.setInt(1, doc_id);
                        pst.setInt(2, rs.getInt(i));
                        pst.setTimestamp(3, _date_s);
                        pst.setTimestamp(4, _date_e);
                        ResultSet rs2 = pst.executeQuery();
                        p_id = rs.getInt(i);
                        rs2.next();
                        p_count = rs2.getInt(1);
                    } else {
                        if (rs.getString(i) == null) {
                            out_html += "<td>" + "</td>";
                        } else {
                            out_html += "<td>" + rs.getString(i) + "</td>";
                        }
                    }

                }
                out_html += "<td>" + p_count + "</td>";
                out_html += "<td><a href=\"ApptStats?docId=" + doc_id + "," + p_id + "," + _date_s + "," + _date_e + "\">Statistics</a></td>";
                out_html += "</tr>";
                count = count + 1;
            }
            request.setAttribute("timeline","From " + _date_s + " to " + _date_e);
            request.setAttribute("num-pats", count);
            request.setAttribute("table-rows", out_html); // This will be available as ${message}
            request.getRequestDispatcher("/doctor-stats.jsp").forward(request, response);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
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
