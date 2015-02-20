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
                <li class="active"><a href="#patients" data-toggle="tab">Patients</a></li>
                <li><a href="#doctors" data-toggle="tab">Doctors</a></li>
                <li><a href="#staff" data-toggle="tab">Staff</a></li>
            </ul>

            <div id="staff-tab-content" class="tab-content">
                <div class="tab-pane active" id="patients">
                    <div id="panel-container">
                        <div id="staff-patients-group">
                            <div id="filter-patient-btn" class="btn-group">

                                <button type="button" class="btn btn-default" disabled>
                                    Filter By:
                                </button>
                                <form name="filterForm" method="post" action="StaffServlet" role="form">
                                    <button id="filterName" type="button" class="btn btn-default" >Name</button>
                                    <button id="filterOHIP" type="button" class="btn btn-default" >OHIP</button>
                                    <button id="filterDoctor" type="button" class="btn btn-default" >Doctor</button>
                                    <button id="filterStatus" type="button" class="btn btn-default" >Status</button>
                                </form>
                            </div>
                            <div id="pat-search-group" class="input-group">
                                <input id="staff-patient-search-input" type="text" class="form-control">
                                <span class="input-group-btn">
                                    <button id="staff-patient-search" class="btn btn-default" type="button">Search</button>
                                </span>
                            </div>
                        </div> 

                        <div class="panel panel-default">
                            <div id="patient-panel" class="panel-heading">Patients</div>
                            <form action="AppointmentServlet" method="get">
                                <table id="tbl-patients" class="table tablesorter-bootstrap">
                                    <thead>
                                        <tr>
                                            <td>Name</td>
                                            <td>OHIP</td>
                                            <td>DOB</td>
                                            <td>Gender</td>
                                            <td>Doctor</td>
                                            <td>Status</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList rows = new ArrayList();

                                            if (request.getAttribute("userDataList") != null) {
                                                rows = (ArrayList) request.getAttribute("userDataList");
                                            }

                                            for (int i = 0; i < rows.size(); i++) {
                                                out.println("<tr>");
                                                for (int j = 1; j <= 6; j++) {
                                                    Object s = ((ArrayList) rows.get(i)).get(j);
                                                    out.println("<td>" + s.toString() + "</td>");
                                                }


                                                out.println("<td><a href=\"AdminAppointmentServlet?patientID=" + ((ArrayList) rows.get(i)).get(0) + "\">Appointments</a></td>");
                                                out.println("</tr>");
                                            }

                                        %>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
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
                                        out.println("<td><a href=\"AdminScheduleServlet?doctorId=" + doctor.get(0) + "&from=admin\">View Schedule</a></td>");
                                        out.println("</tr>");
                                    }
                                %>
                            </table>
                            <a href="AdminAddDoctorServlet">Add Doctor</a>

                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="staff">
                    <div id="panel-container">
                        <div class="panel panel-default">
                            <div class="panel-heading">Doctors</div>
                            <table id="tbl-staff" class="table table-striped">
                                <tr>
                                    <td>#</td>
                                    <td>Name</td>
                                    <td>Extension</td>
                                </tr>
                                <%
                                    ArrayList<ArrayList<String>> staff = new ArrayList<ArrayList<String>>();
                                    if (request.getAttribute("Staff") != null) {
                                        staff = (ArrayList<ArrayList<String>>) request.getAttribute("Staff");
                                    }

                                    for (ArrayList<String> staffMember : staff) {
                                        out.println("<tr>");
                                        out.println(
                                                String.format(
                                                        "<td>%s</td><td>%s</td><td>%s</td>",
                                                        staffMember.get(0), staffMember.get(1), staffMember.get(2)
                                                )
                                        );
                                        out.println("</tr>");
                                    }
                                %>
                            </table>
                            <a href="admin-add-staff.jsp">Add Staff</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>

