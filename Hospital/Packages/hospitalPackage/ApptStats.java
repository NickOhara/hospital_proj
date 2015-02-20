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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikededys
 */
public class ApptStats extends HttpServlet {
    String query;
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
            java.sql.PreparedStatement pst = null;
            HttpSession _session = request.getSession();
            UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
            String[] parts = query.split(",");
            int doc_id = Integer.parseInt(parts[0]);
            int p_id = Integer.parseInt(parts[1]);
            String s = parts[2];
            String e = parts[3];
            if (e.equalsIgnoreCase("all") && s.equalsIgnoreCase("all")) {
                pst = con.prepareStatement("SELECT date, diagnosis_name, treatment_name, treatment_date, prescription_name from appointment as a JOIN prescription as p ON a.prescription_code = p.prescription_code JOIN diagnosis as d ON a.diagnosis_code = d.diagnosis_code JOIN treatment as t ON t.treatment_code = a.treatment_code where patient_id = ?");
                pst.setInt(1, p_id);
            } else {
                 SimpleDateFormat _sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                 java.sql.Timestamp _date_s = new java.sql.Timestamp(_sdf.parse(s).getTime());
                java.sql.Timestamp _date_e = new java.sql.Timestamp(_sdf.parse(e).getTime());
                pst = con.prepareStatement("SELECT date, diagnosis_name, treatment_name, treatment_date, prescription_name from appointment as a JOIN prescription as p ON a.prescription_code = p.prescription_code JOIN diagnosis as d ON a.diagnosis_code = d.diagnosis_code JOIN treatment as t ON t.treatment_code = a.treatment_code where patient_id = ? AND ( date >= ? AND end_date <= ? )");
                pst.setInt(1, p_id);
                pst.setTimestamp(2, _date_s);
                pst.setTimestamp(3, _date_e);
            }
            
            ResultSet rs = pst.executeQuery();
            String out_html = "";
            int count = 0;
              while (rs.next()) {
                out_html += "<tr>";
                for (int i = 1; i <= 5; i++) {
                        if (rs.getString(i) == null) {
                            out_html += "<td>" + "</td>";
                        } else {
                            out_html += "<td>" + rs.getString(i) + "</td>";
                        }
                    }
                out_html += "</tr>";
                count += 1;
                }
            request.setAttribute("num-pats",count);
            request.setAttribute("table-rows", out_html); // This will be available as ${message}
            request.getRequestDispatcher("/fin-apt-stats.jsp").forward(request, response);
           
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
        query = request.getParameter("docId");
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
