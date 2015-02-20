<%@ include file="header.jsp" %>


<%@page import="java.util.ArrayList" %> 
<div id="appointments-list">
    <ol id="appointments-list-bc" class="breadcrumb">
        <li><a href="AdminServlet">Admin Main</a></li>
        <li class="active">Details</li>
    </ol>

    <div class="panel panel-default">
        <div id="patient-panel" class="panel-heading">Appointments</div>

        <table id="tbl-patients" class="table tablesorter-bootstrap">
            <thead>
                <tr>
                    <td>Date</td>
                    <td>Length</td>
                    <td>Comments</td>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList rows = new ArrayList();

                    if (request.getAttribute("appointmentDataList") != null) {
                        rows = (ArrayList) request.getAttribute("appointmentDataList");
                    }

                    for (int i = 0; i < rows.size(); i++) {
                        out.println("<tr>");

                        for (int j = 1; j <= 3; j++) {
                            //for(Object s : (ArrayList)rows.get(i)){

                            Object s = ((ArrayList) rows.get(i)).get(j);
                            out.println("<td>" + s.toString() + "</td>");
                        }

                        out.println("</tr>");
                    }

                %>
            </tbody>
        </table>

    </div></div>
</body>

</html>
