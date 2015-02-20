<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>    
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>    
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
           $('#staff-tabs').tab();
       });
       $(document).ready(function(){
            $('#addPatient').on('click', function (e) {
                 location.href = "AddPatientServlet";
            });
            $('#filterName').on('click', function (e) {
                 document.filterForm.submit();
            });
            
            $('#clearSearch').on('click', function(e) {
            location.href = "StaffServlet";
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
                    <li class="active"><a href="#patients" data-toggle="tab">Patients</a></li>
                    <li><a href="#doctors" data-toggle="tab">Doctors</a></li>
                 </ul>
              
                <div id="staff-tab-content" class="tab-content">
                    <div class="tab-pane active" id="patients">
                          <div id="panel-container">
                              <div id="staff-patients-group">
                                  <div id="filter-patient-btn" class="btn-group">
                                      <button class="btn btn-default" id="addPatient" type="button" >Add Patient</button>
                                     <button id="doc-patient-search" class="btn btn-default" data-toggle="modal" data-target="#myModal">Search</button>
                        <button class="btn btn-default" id="clearSearch" type="button" >Clear Search</button>
                                  </div>
                              </div> 
                              
                            <div class="panel panel-default">
                                <div id="patient-panel" class="panel-heading">Patients</div>
                                <form action="AppointmentServlet" method="get">
                                    <table id="tbl-patients" class="table tablesorter-bootstrap">
                                        <thead>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td>Name</td>
                                            <td>OHIP</td>
                                            <td>DOB</td>
                                            <td>Gender</td>
                                            <td>Doctor</td>
                                            <td>Last Visit</td>
                                            <td>Status</td>
                                            <td></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            ArrayList rows = new ArrayList();
                                             
                                            if (request.getAttribute("userDataList") != null) {
                                                rows = (ArrayList)request.getAttribute("userDataList");
                                            }

                                            for(int i=0;i<rows.size();i++){
                                                out.println("<tr>");

                                                //out.println("<td><a href=\"patient-details.jsp?patientID="+((ArrayList)rows.get(i)).get(0)+"\" onclick=\"rowClickHandler()\">Edit</a></td>");
                                                
                                                out.println("<td><a href=\"EditPatientServlet?patientId=" + ((ArrayList)rows.get(i)).get(0) + "\" onclick=\"rowClickHandler()\">Edit</a></td>");
                                                out.println("<td><a href=\"StaffDeletePatientServlet?patientId=" + ((ArrayList)rows.get(i)).get(0) + "\" onclick=\"rowClickHandler()\">Delete</a></td>");
                                                for (int j = 1; j <= 7; j++) {
                                                //for(Object s : (ArrayList)rows.get(i)){

                                                    Object s = ((ArrayList)rows.get(i)).get(j);
                                                    out.println("<td>"+s.toString()+"</td>");
                                                }
                                                
                                                out.println("<td><a href=\"Appointment?patientID="+((ArrayList)rows.get(i)).get(0)+"\">Appointments</a></td>");
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
                                            <td>Has Given Permission</td>
                                            <!--<td>Schedule</td>-->
                                        </tr>
                                      <% String doc_list = (String) request.getAttribute("doctor-list");
                                             out.println(doc_list);
                                     %>
                                    </table>
                            </div>
                        </div>
                    </div>
                </div>
          </div>
        </div>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Search Patients</h4>
                    </div>
                    <div id="search-modal-body" class="modal-body">
                        <form id="search-form" action="SearchPatient" role="form">
                            <div class="form-group">
                                <label for="search-filter">Search By</label>
                                <select name="filter" id="search-filter">
                                    <option value="name">Name</option>
                                    <option value="ohip">OHIP</option>
                                    <option value="dob">DOB</option>
                                    <option value="gender">Gender</option>
                                    <option value="doctor">Doctor</option>
                                    <option value="visit">Last Visit</option>
                                    <option value="status">Status</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="search-string">Search Text</label>
                                <input type="text" class="form-control" id="search-string" name="search-string" placeholder="Search Text">
                            </div>
                            <div class="form-group">
                                <select name="how-to-search" id="search-filter">
                                    <option value="contains">Contains</option>
                                    <option value="exactly">Exactly</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-default">Search</button> 
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
