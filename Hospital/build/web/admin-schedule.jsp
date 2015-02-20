<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %> 
<div id="appointments-list">
    <ol id="appointments-list-bc" class="breadcrumb">
        <li><%
        String from = request.getParameter("from");
            if (from == null) {
                from = "admin";
            }
            
            out.println("<a href=\"");
            if (from.equals("admin")) {
                out.println("AdminServlet\">Admin ");
            } else {
                out.println("FinanceServlet\">Finance ");
            }
            out.println(" Main</a>");
               %>
        </li>
        <li class="active">Details</li>
    </ol>

    <div class="panel panel-default">
        <div id="patient-panel" class="panel-heading">Schedule</div>

        <table id="tbl-patients" class="table tablesorter-bootstrap">
            <thead>
                <tr>
                    <td>Appointment ID</td>
                    <td>Appointment Date</td>
                    <td>Appointment End Date</td>
                    <td>Patient Name</td>
                    <td>Diagnosis</td>
                    <td>Prescription</td>
                    <td>Treatment</td>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<ArrayList<String>> rows = new ArrayList<ArrayList<String>>();

                    if (request.getAttribute("appointmentDataList") != null) {
                        rows = (ArrayList) request.getAttribute("appointmentDataList");
                    }

                    for (ArrayList<String> row : rows) {
                        out.println("<tr>");
                        for (String s : row) {
                            out.println("<td>" + (s != null ? s : "n/a") + "</td>");
                        }
                        out.println("</tr>");
                    }

                %>
            </tbody>
        </table>

    </div></div>
</body>

</html>
