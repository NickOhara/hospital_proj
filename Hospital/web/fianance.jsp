<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>    
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>    
<%@page import="hospitalPackage.AddDoctor" %>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#staff-tabs').tab();
    });
    $(document).ready(function() {
        $('#addPatient').on('click', function(e) {
            location.href = "AddPatientServlet";
        });
        $('#filterName').on('click', function(e) {
            document.filterForm.submit();
        });
    });
    $(document).ready(function()
    {
        $("#tbl-patients").tablesorter();
    }
    );
</script>  
<form method="get" action="AdminServlet" role="form"> 
    <div class="patient-wrapper">
        <div class="page-content">
            <ul id="staff-tabs" class="nav nav-tabs" data-tabs="tabs">
                <li class="active"><a href="#doctors" data-toggle="tab">Doctors</a></li>
            </ul>
                <div class="tab-pane" id="doctors">
                    <div id="panel-container">
                        <div class="panel panel-default">
                            <div class="panel-heading">Doctors</div>
                            <table id="tbl-doctor" class="table table-striped">
                                <tr>
                                    <td>#</td>
                                    <td>Name</td>
                                    <td>Specialization</td>
                                    <td>Patients</td>
                                    <td>Schedule</td>
                                    <td></td>
                                </tr>

                                <%                                    
                                    ArrayList<ArrayList<String>> Doctors = new ArrayList<ArrayList<String>>();

                                    if (request.getAttribute("Doctors") != null) {
                                        Doctors = (ArrayList<ArrayList<String>>) request.getAttribute("Doctors");
                                    }

                                    for (ArrayList<String> doctor : Doctors) {
                                        out.println("<tr>");
                                        out.println(


                                                String.format("<td>%s</td><td>%s</td><td>%s</td><td>%s</td>",
                                                        doctor.get(0), doctor.get(1), doctor.get(2), doctor.get(3)));
                                        out.println("<td><a href=\"AdminScheduleServlet?doctorId=" + doctor.get(0) + "&from=finance\">View Schedule</a></td>");
                                        out.println("<td><a href=\"DoctorStats?doctorId=" + doctor.get(0) +"\">Statistics</a></td>");
                                        out.println("</tr>");
                                    }
                                %>
                            </table>
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>

