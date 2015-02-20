<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>    
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>  
<%@page import="hospitalPackage.AddDoctor" %>
<div id="add-pat">
    <ol id="add-pat-bc" class="breadcrumb">
        <li><a href="StaffServlet">Staff Main</a></li>
        <li class="active">Add Patient</li>
    </ol>
    <div id="add-pat-form">
        <form method="post" action="AddPatientServlet" class="form-signin" role="form">
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" name="Name" placeholder="Enter Name">
            </div>
            <div class="form-group">
                <label for="OHIP">OHIP</label>
                <input type="text" class="form-control" name="OHIP" placeholder="Enter OHIP">
            </div>
            <div class="form-group">
                <label for="SSN">SSN</label>
                <input type="text" class="form-control" name="SSN" placeholder="Enter SSN">
            </div>
            <div class="form-group">
                <label for="Gender">Gender</label>
                <input type="text" class="form-control" name="Gender" placeholder="Enter Gender">
            </div>
            <div class="form-group">
                <label for="DOB">Date of Birth</label>
                <input type="date" class="form-control" name="DOB" placeholder="Enter Date of Birth">
            </div>
            <div class="form-group">
                <label for="Address">Address</label>
                <input type="text" class="form-control" name="Address" placeholder="Enter Address">
            </div>
            <div class="form-group">
                <label for="City">City</label>
                <input type="text" class="form-control" name="City" placeholder="Enter City">
            </div>
            <div class="form-group">
                <label for="Postal_Code">Postal Code</label>
                <input type="text" class="form-control" name="Postal_Code" placeholder="Enter Postal Code">
            </div>
            <div class="form-group">
                <label for="Phone">Phone #</label>
                <input type="tel" class="form-control" name="Phone" placeholder="Enter Phone #">
            </div>
            <div class="form-group">
                <label for="Emergency_Contact">Emergency Contact Name</label>
                <input type="text" class="form-control" name="Emergency_Contact" placeholder="Enter Emergency Contact Name">
            </div>
            <div class="form-group">
                <label for="Emergency_Phone">Emergency Contact #</label>
                <input type="tel" class="form-control" name="Emergency_Phone" placeholder="Enter Emergency Contact #">
            </div>
            <div class="form-group">
                <label for="Emergency_Relation">Emergency Contact Relation</label>
                <input type="text" class="form-control" name="Emergency_Relation" placeholder="Enter Emergency Contact Relation">
            </div>
            <div class="form-group">
                <label for="Allergies">Allergies</label>
                <textarea  class="form-control" name="Allergies" row="3"></textarea>
            </div>
            <div class="form-group">
                <label for="Doctor">Doctor</label>
                <select name="Doctor" class="form-control">
                    <%
                        List<AddDoctor> Doctors = new ArrayList<AddDoctor>();
                        if (request.getAttribute("Doctors") != null) {
                            Doctors = (ArrayList<AddDoctor>) request.getAttribute("Doctors");
                        }

                        for (AddDoctor doctor : Doctors) {
                            out.println(String.format("<option value = \"%d\">%s</option>", doctor.getID(), doctor.getLName() + ", " + doctor.getFName()));
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="Patient_Status">Patient Status</label>
                <select name="Patient_Status" class="form-control">
                    <option value="1">Healthy</option>
                    <option value="2">Treatment</option>
                    <option value="3">Scheduled</option>
                    <option value="4">Deceased</option>
                    <option value="5">Terminal</option>
                </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>


</body>
</html>
