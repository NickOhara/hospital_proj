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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikededys
 */
public class DoctorStats extends HttpServlet {

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
            int doc_id = Integer.parseInt(request.getParameter("doctorId"));
            _session.setAttribute("docId", doc_id);
            pst = con.prepareStatement("SELECT COUNT(patient_id) from patient where doctor_id = ?");
            pst.setInt(1, doc_id);

            ResultSet rs = pst.executeQuery();
            rs.next();
            int num_pats = rs.getInt(1);
            

            pst = con.prepareStatement("SELECT DISTINCT p.patient_id,p.name, ps.status_type FROM patient as p Left JOIN appointment as a ON p.patient_id = a.patient_id JOIN patient_status as ps ON p.patient_status_code = ps.status_code where doctor_id = ? AND (a.date >= '1000-01-01 12:00:00' AND a.date <= '3000-01-01 12:00:00')");
            pst.setInt(1, doc_id);
            rs = pst.executeQuery();
            String out_html = "";
            int p_id = 0;
            int p_count = 0;
            int pat_seen = 0;
            while (rs.next()) {
                out_html += "<tr>";
                for (int i = 1; i <= 3; i++) {
                    if (i == 1) {
                        pst = con.prepareStatement("SELECT COUNT(p.patient_id) FROM patient as p Left JOIN appointment as a ON p.patient_id = a.patient_id JOIN patient_status as ps ON p.patient_status_code = ps.status_code where doctor_id = ? AND p.patient_id = ? AND ( a.date >= '1000-01-01 12:00:00' AND a.date <= '3000-01-01 12:00:00' )");
                        pst.setInt(1, doc_id);
                        pst.setInt(2, rs.getInt(i));
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
                pat_seen += 1;
                 out_html += "<td><a href=\"ApptStats?docId=" + doc_id + "," + p_id + ",all,all\">Statistics</a></td>";
                out_html += "</tr>";
            }
            request.setAttribute("timeline", "Life time");
            request.setAttribute("num-pats", pat_seen);
            request.setAttribute("table-rows", out_html); // This will be available as ${message}
            request.getRequestDispatcher("/doctor-stats.jsp").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
            System.out.println(e);
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
