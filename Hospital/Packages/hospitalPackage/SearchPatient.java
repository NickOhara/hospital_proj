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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mikededys
 */
public class SearchPatient extends HttpServlet {

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
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;
        HttpSession _session = request.getSession();
        UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
        try {
            con = Connect_DB._testConnection();
            if (_login.getAccessLevel() == 2) {
                String stmt = "SELECT p1.patient_id,name,ohip,ssn,dob,phone_no, end_date,status_Type FROM patient as p1 JOIN patient_status on status_code = patient_status_code LEFT JOIN appointment as a1 ON (a1.patient_id = p1.patient_id) AND a1.end_date = (SELECT MAX(end_date) FROM appointment WHERE patient_id = p1.patient_id) where doctor_id = ?";
                if (request.getParameter("filter").equalsIgnoreCase("name")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND name LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND name = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("ohip")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND ohip LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND ohip = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("ssn")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND ssn LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND ssn = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("dob")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND dob LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND dob = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("phone")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND phone_no LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND phone_no = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("visit")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND end_date LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND end_date = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("status")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND status_type LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND status_type = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                }
                pst.setInt(1, _login.getUserID());
                ResultSet rs = pst.executeQuery();
                String out_html = "";
                while (rs.next()) {
                    out_html += "<tr>";
                    for (int i = 1; i <= 7; i++) {
                        out_html += "<td>" + rs.getString(i) + "</td>";
                    }
                    out_html += "<td><a href=\"patient-details.jsp\">Details</a></td>";
                    out_html += "</tr>";
                }
                request.setAttribute("table-rows", out_html); //This will be available as ${message} 
                request.getRequestDispatcher("/doctor.jsp").forward(request, response);
            }else if(_login.getAccessLevel() == 3) {
                 String stmt = "SELECT p.patient_id,name,OHIP,dob,gender,concat(doctor.last_name,',',doctor.first_name) as doc_name,end_date,patient_status.status_type FROM patient as p JOIN patient_status ON patient_status_code = status_code JOIN doctor ON p.doctor_id = doctor.doctor_id and p.doctor_id = (select sp.doctor_id from staff_permission sp join staff s on s.staff_id = sp.staff_id and s.staff_id = ? where sp.permission = true) LEFT JOIN appointment as a1 ON (a1.patient_id = p.patient_id) AND a1.end_date = (SELECT MAX(end_date) FROM appointment as a2 WHERE a2.patient_id = p.patient_id) where p.doctor_id = doctor.doctor_id";
                 if (request.getParameter("filter").equalsIgnoreCase("name")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND name LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND name = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("ohip")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND ohip LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND ohip = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("dob")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND dob LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND dob = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("doctor")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND (doctor.last_name LIKE '%" + request.getParameter("search-string") + "%' OR doctor.first_name LIKE '%" + request.getParameter("search-string") + "%')";
                    } else {
                        stmt += " AND (doctor.last_name = '%" + request.getParameter("search-string") + "%' OR doctor.first_name = '%" + request.getParameter("search-string") + "%')";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("gender")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND gender LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND gender = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("visit")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND end_date LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND end_date = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                } else if (request.getParameter("filter").equalsIgnoreCase("status")) {
                    if (request.getParameter("how-to-search").equalsIgnoreCase("contains")) {
                        stmt += " AND status_type LIKE '%" + request.getParameter("search-string") + "%'";
                    } else {
                        stmt += " AND status_type = '" + request.getParameter("search-string") + "'";
                    }
                    pst = con.prepareStatement(stmt);
                }
                pst.setInt(1, _login.getUserID());
                ResultSet rs = pst.executeQuery();
                 ArrayList Rows = new ArrayList();
                 while (rs.next()) {
                    ArrayList row = new ArrayList();
                    for (int i = 1; i <= 8; i++) {
                        if(rs.getString(i) == null) {
                            row.add("");
                        }else {
                            row.add(rs.getString(i));
                        }
                    }

                    Rows.add(row);
                }
                request.setAttribute("userDataList", Rows);
                request.getRequestDispatcher("/staff-main.jsp").forward(request, response);
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
