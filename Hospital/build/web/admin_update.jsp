<%-- 
    Document   : admin_update
    Created on : 26-Mar-2014, 6:35:20 PM
    Author     : Nick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Patient Page</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/patient.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/bootstrap.js"></script>
        
    </head>
    <body>
        <h1>Create new staff mofo</h1>
        <div class="page-content">
            
                <div id="patient-tab-content" class="tab-content">
                    <div class="tab-pane active" id="home">
                        <form method="post" action="AddPatientServlet" class="form-signin" role="form">
                        <div class="input-group">
                            <span class="input-group-addon">Name</span>
                            <input name="Name" type="text" class="form-control" placeholder="Name" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">SSN</span>
                            <input name="SSN" type="text" class="form-control" placeholder="SSN" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">OHIP</span>
                            <input name="OHIP" type="text" class="form-control" placeholder="OHIP" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">Gender</span>
                            <input name="Gender" type="text" class="form-control" placeholder="Gender" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">DOB</span>
                            <input name="DOB" type="text" class="form-control" placeholder="DOB" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">Address</span>
                            <input name="Address" type="text" class="form-control" placeholder="Address" >
                        </div>
                          <div class="input-group">
                            <span class="input-group-addon">City</span>
                            <input name="City" type="text" class="form-control" placeholder="City" >
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Postal Code</span>
                            <input name="Postal_Code" type="text" class="form-control" placeholder="Postal Code" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">Emergency Contact</span>
                            <input name="Emergency_Contact" type="text" class="form-control" placeholder="Emergency Contact" >
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Emergency Phone</span>
                            <input name="Emergency_Phone" type="text" class="form-control" placeholder="Emergency Phone" >
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Emergency Relation</span>
                            <input name="Emergency_Relation" type="text" class="form-control" placeholder="Emergency Relation" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">Patient Status</span>
                            <input name="Patient_Status" type="text" class="form-control" placeholder="Patient_Status" >
                        </div>
                         <div class="input-group">
                            <span class="input-group-addon">Allergies</span>
                            <input name="Allergies" type="text" class="form-control" placeholder="Allergies" >
                        </div>
                    </div>
                    <input id="submit" type="submit" value="Submit Query"></input>
                                </form>

    </body>
</html>
