<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %> 
<%@page import="hospitalPackage.UserLogin" %> 
<div id="appointments-list">
    <ol id="appointments-list-bc" class="breadcrumb">
        <%                    _session = request.getSession();
            UserLogin login = (UserLogin) _session.getAttribute("userLogin");
            if (login.getAccessLevel() == 2) {
                out.println("<a href=\"DoctorPageServlet\">Doctor Main</a>");
            } else {
                out.println("<a href=\"StaffServlet\">Staff Main</a>");
            }

        %>
        <li class="active">Details</li>
    </ol>

    <div class="panel panel-default">
        <div id="patient-panel" class="panel-heading">Appointments</div>

        <table id="tbl-patients" class="table tablesorter-bootstrap">
            <thead>
                <tr>
                    <td></td>
                    <td></td>
                    <td>Date</td>
                    <td>Length</td>
                    <td>Comments</td>
                </tr>
            </thead>
            <tbody>
                <%                                ArrayList rows = new ArrayList();
                    _login = (UserLogin) _session.getAttribute("userLogin");
                    if (request.getAttribute("appointmentDataList") != null) {
                        rows = (ArrayList) request.getAttribute("appointmentDataList");
                    }

                    for (int i = 0; i < rows.size(); i++) {
                        out.println("<tr>");

                        out.println("<td><a href=\"EditAppointmentServlet?appointmentId=" + ((ArrayList) rows.get(i)).get(0) + "\" onclick=\"rowClickHandler()\">Edit</a></td>");
                        out.println("<td><a href=\"StaffDeleteAppointmentServlet?appointmentId=" + ((ArrayList) rows.get(i)).get(0) + "\" onclick=\"rowClickHandler()\">Delete</a></td>");
                        for (int j = 1; j <= 3; j++) {
                            //for(Object s : (ArrayList)rows.get(i)){

                            Object s = ((ArrayList) rows.get(i)).get(j);
                            out.println("<td>" + s.toString() + "</td>");
                        }

                        if (_login.getAccessLevel() == 2) {
                            out.print("<td><a href=\"DoctorPerms?appoint=" + ((ArrayList) rows.get(i)).get(0) + "\" >Permissions</a></td>");
                        }
                        out.println("</tr>");
                    }

                %>
            </tbody>
        </table>
        <a href="add-appointment.jsp">Add Appointment</a>

    </div></div>
</body>
</html>
