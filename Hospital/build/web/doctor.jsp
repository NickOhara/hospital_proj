<%@ include file="header.jsp" %>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#doc-tabs').tab();
    });

    $(document).ready(function() {
        $('#addPatient').on('click', function(e) {
            location.href = "add-patient.jsp";
        });
        $('#clearSearch').on('click', function(e) {
            location.href = "DoctorPageServlet";
        });
    });
      $(document).ready(function() 
            { 
                $("#tbl-doctor").tablesorter(); 
            } 
        ); 
</script>  


<div class="doctor-wrapper">
    <div class="page-content">
        <ul id="doctor-tabs" class="nav nav-tabs" data-tabs="tabs">
            <li class="active"><a href="#patients" data-toggle="tab">Patients</a></li>
            <li><a href="#doctors" data-toggle="tab">Staff</a></li>
        </ul>

        <div id="doctor-tab-content" class="tab-content">
            <div class="tab-pane active" id="patients">
                <div id="doc-patients-group">
                    <div id="filter-patient-btn" class="btn-group">
                        <button class="btn btn-default" id="addPatient" type="button" >Add Patient</button>
                        <button id="doc-patient-search" class="btn btn-default" data-toggle="modal" data-target="#myModal">Search</button>
                        <button class="btn btn-default" id="clearSearch" type="button" >Clear Search</button>
                    </div>
                </div>  
                <div id="panel-container">

                    <div class="panel panel-default">
                        <div class="panel-heading">Patients</div>
                        <table id="tbl-doctor" class="table tablesorter-bootstrap">
                            <thead>
                            <tr>
                                <td>ID #</td>
                                <td>Name</td>
                                <td>OHIP</td>
                                <td>SSN</td>
                                <td>DOB</td>
                                <td>Phone #</td>
                                <td>Last Visit</td>
                                <td>Status</td>
                                <td></td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody
                            <% String output = (String) request.getAttribute("table-rows");
                                out.println(output);
                            %>
                        </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <div class="tab-pane" id="doctors">
                <div id="doc-staff-group">
                    <div id="filter-staff-btn" class="btn-group">
                        <button id="doc-patient-search" class="btn btn-default" data-toggle="modal" data-target="#assign-staff-modal">Assign Staff</button>
                    </div>
                </div>  
                <div class="panel panel-default">
                    <div class="panel-heading">Staff</div>
                    <table id="tbl-staff" class="table table-striped">
                        <tr>
                            <td>ID #</td>
                            <td>First Name</td>
                            <td>Last Name</td>
                            <td>Extension</td>
                            <td></td>
                        </tr>
                        <% String staff_o = (String) request.getAttribute("table-rows-staff");
                            out.println(staff_o);
                        %>
                    </table>
                </div>
            </div>       
        </div>
        <div class="modal fade" id="assign-staff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Assign Staff</h4>
                    </div>
                    <div id="search-modal-body" class="modal-body">
                        <form id="search-form" action="StaffAssignment" method="post" role="form">
                            <div class="form-group">
                                <label for="search-filter">Staff Member</label>
                                <select name="staff" id="search-filter">
                                    <% String staff_list = (String) request.getAttribute("staff-list");
                                             out.println(staff_list);
                                     %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-default">Assign</button> 
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                                    <option value="ssn">SSN</option>
                                    <option value="dob">DOB</option>
                                    <option value="phone">Phone #</option>
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

    </div>
</div>
</div>
</body>
</html>
