<%@ include file="header.jsp" %>
<%@page import="hospitalPackage.UserLogin" %>
<div id="patient-detail">
    <ol id="patient-detail-bc" class="breadcrumb">
        <li>
            <%
            _session = request.getSession();
            UserLogin login = (UserLogin)_session.getAttribute("userLogin");
            if (login.getAccessLevel() == 2) {
                out.println("<a href=\"DoctorPageServlet\">Doctor Main</a>");
            } else {
                out.println("<a href=\"StaffServlet\">Staff Main</a>");
            }
            
            %>
        </li>
        <li class="active">Details</li>
    </ol>
    <div id="add-pat-form">
        <form method="post" action="EditPatientServlet" class="form-edit" role="form">
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
            <div class="form-group">
                <label for="status">Status</label>
                <select name="status" id="statuses">
                    <% out.println("<option value=\"" + (request.getAttribute("status_code")) + "\">" + request.getAttribute("status_type") + "</option>"); 
                       out.println(request.getAttribute("stats"));
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>
</body>
</html>
