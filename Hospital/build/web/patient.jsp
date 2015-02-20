<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>    
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>    
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

<div class="patient-wrapper">
    <div class="page-content">
        <ul id="staff-tabs" class="nav nav-tabs" data-tabs="tabs">
            <li class="active"><a href="#patients" data-toggle="tab">Home</a></li>
            <li><a href="#appointments" data-toggle="tab">Appointments</a></li>
            <li><a href="#doctors" data-toggle="tab">Doctor</a></li>
        </ul>

        <div id="staff-tab-content" class="tab-content">
            <div class="tab-pane active" id="patients">
                <div id="panel-container">
                    <div id="staff-patients-group">
                        <div id="filter-patient-btn" class="btn-group">
                            <div id="add-pat-form">
                                <form method="post" action="PatientServlet" class="form-edit" role="form">
                                    <input type="hidden" name="patientId" value="<% out.println(request.getAttribute("patientId")); %>"/>
                                    <div class="form-group">
                                        <label for="Name">Name</label>
                                        <input type="text" class="form-control" name="Name" value="<% out.println(request.getAttribute("name")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Gender">Gender</label>
                                        <input type="text" class="form-control" name="Gender" value="<% out.println(request.getAttribute("gender")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="DOB">Date of Birth</label>
                                        <input type="text" class="form-control" name="DOB" value="<% out.println(request.getAttribute("dob")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Address">Address</label>
                                        <input type="text" class="form-control" name="Address" value="<% out.println(request.getAttribute("address")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="City">City</label>
                                        <input type="text" class="form-control" name="City" value="<% out.println(request.getAttribute("city")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Postal_Code">Postal Code</label>
                                        <input type="text" class="form-control" name="Postal_Code" value="<% out.println(request.getAttribute("postal_code")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Phone">Phone #</label>
                                        <input type="tel" class="form-control" name="Phone" value="<% out.println(request.getAttribute("phone_no")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Emergency_Contact">Emergency Contact Name</label>
                                        <input type="text" class="form-control" name="Emergency_Name" value="<% out.println(request.getAttribute("emergency_name")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Emergency_Phone">Emergency Contact</label>
                                        <input type="tel" class="form-control" name="Emergency_Contact" value="<% out.println(request.getAttribute("emergency_contact")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Emergency_Relation">Emergency Contact Phone</label>
                                        <input type="text" class="form-control" name="Emergency_Phone" value="<% out.println(request.getAttribute("emergency_phone")); %>">
                                    </div>
                                    <div class="form-group">
                                        <label for="Allergies">Allergies</label>
                                        <textarea  class="form-control" name="Allergies" row="3" ><% out.println(request.getAttribute("allergies"));%></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-default">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="appointments">
                <div id="panel-container">
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
                                            Object s = ((ArrayList) rows.get(i)).get(j);
                                            out.println("<td>" + s.toString() + "</td>");
                                        }
                                        out.println("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="doctors">
                <div id="panel-container">
                    <div class="panel panel-default">
                        <div class="panel-heading">Doctor</div>
                        <table id="tbl-doctor" class="table table-striped">
                            <tr>
                                <td>#</td>
                                <td>Name</td>
                                <td>Specialization</td>
                            </tr>

                            <%
                                ArrayList<String> doctor = new ArrayList<String>();

                                if (request.getAttribute("doctor") != null) {
                                    doctor = (ArrayList<String>) request.getAttribute("doctor");
                                }

                                out.println("<tr>");
                                out.println(
                                        String.format("<td>%s</td><td>%s</td><td>%s</td>",
                                                doctor.get(0), doctor.get(1), doctor.get(2)));
                                out.println("</tr>");

                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- </form>-->

</body>
</html>
