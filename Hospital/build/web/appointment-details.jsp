<%@ include file="header.jsp" %>
       <%@page import="java.util.ArrayList" %>
        <div id="appt-detail">
            <ol id="appt-detail-bc" class="breadcrumb">
                <li><a href="patient.jsp">Home</a></li>
                <li class="active">Appointment</li>
            </ol>
            <form action="EditAppointmentServlet" method="post"> 
            <div id="add-appointment-form">
			<div class="form-group">
				<label for="month">Date</label>
				<div class="form-inline">
					<input type="text" class="form-control" name="Date" value="<% out.println(request.getAttribute("date")); %>">
				</div>
			</div>
			
                        <div class="form-group">
				<label for="length">Length of Appointment</label>
				<input type="text" class="form-control" name="Length" value="<% out.println(request.getAttribute("length")); %>">
			</div>
                        <div class="form-group">
				<label for="procedure">Procedure</label>
				<input type="text" class="form-control" name="Procedure" value="<% out.println(request.getAttribute("procedure")); %>">
			</div>
			<div class="form-group">
				<label for="prescription">Prescription</label>
				<select name="Prescription" id="prescription" class="form-control">
					<%
                                            _session = request.getSession();
                                            ArrayList prescription = new ArrayList();
                                            if (_session.getAttribute("prescriptionDataList") != null) {
                                                prescription = (ArrayList) _session.getAttribute("prescriptionDataList");
                                            }
                                            
                                            for(int i=0;i<prescription.size();i++){
                                                //for (int j = 1; j <= 2; j++) {
                                                    //int id = Integer.parseInt((String)((ArrayList)treatments.get(i)).get(0));
                                                     String id = (String)((ArrayList)(prescription.get(i))).get(0);
                                                String presc = (String)request.getAttribute("prescription");
                                                if( id.equals(presc)){
                                                    out.println(String.format("<option selected=\"selected\" value = \"%s\">%s</option>", ((ArrayList)(prescription.get(i))).get(0), ((ArrayList)(prescription.get(i))).get(1)));
                                                }
                                                else{
                                                out.println(String.format("<option value = \"%s\">%s</option>", ((ArrayList)(prescription.get(i))).get(0), ((ArrayList)(prescription.get(i))).get(1)));
                                                }
                                            }
                                            
                                        %>
				</select>
			</div>
			<div class="form-group">
				<label for="diagnosis">Diagnosis</label>
				<select name="Diagnosis" id="diagnosis" class="form-control">
					<%
                                            //HttpSession _session = request.getSession();
                                            ArrayList diagnosis = new ArrayList();
                                            if (_session.getAttribute("diagnosisDataList") != null) {
                                                diagnosis = (ArrayList) _session.getAttribute("diagnosisDataList");
                                            }
                                            
                                            for(int i=0;i<diagnosis.size();i++){
                                                //for (int j = 1; j <= 2; j++) {
                                                    //int id = Integer.parseInt((String)((ArrayList)treatments.get(i)).get(0));
                                                String id = (String)((ArrayList)(diagnosis.get(i))).get(0);
                                                String _diag = (String)request.getAttribute("diagnosis");
                                                if( id.equals(_diag)){
                                                    out.println(String.format("<option selected=\"selected\" value = \"%s\">%s</option>", ((ArrayList)(diagnosis.get(i))).get(0), ((ArrayList)(diagnosis.get(i))).get(1)));
                                                }
                                                else{
                                                out.println(String.format("<option value = \"%s\">%s</option>", ((ArrayList)(diagnosis.get(i))).get(0), ((ArrayList)(diagnosis.get(i))).get(1)));
                                                }
                                            }
                                            
                                        %>
				</select>
			</div>
			<div class="form-group">
				<label for="treatment">Treatment</label>
                                <select name="Treatment" id="treatment" class="form-control">
					<%
                                            //HttpSession _session = request.getSession();
                                            ArrayList treatments = new ArrayList();
                                            if (_session.getAttribute("treatmentDataList") != null) {
                                                treatments = (ArrayList) _session.getAttribute("treatmentDataList");
                                            }
                                            
                                            for(int i=0;i<treatments.size();i++){
                                                //for (int j = 1; j <= 2; j++) {
                                                String id = (String)((ArrayList)(treatments.get(i))).get(0);
                                                String _treat = (String)request.getAttribute("treatment");
                                                if( id.equals(_treat)){
                                                    out.println(String.format("<option selected=\"selected\" value = \"%s\">%s</option>", ((ArrayList)(treatments.get(i))).get(0), ((ArrayList)(treatments.get(i))).get(1)));
                                                }
                                                else{
                                                out.println(String.format("<option value = \"%s\">%s</option>", ((ArrayList)(treatments.get(i))).get(0), ((ArrayList)(treatments.get(i))).get(1)));
                                                }
                                            }
                                            
                                        %>
				</select>
				
			</div>
			<div class="form-group">
				<label for="comments">Comments</label>
				<input type="text" class="form-control" name="Comments" value="<% out.println(request.getAttribute("comments")); %>">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
            </form>
	</div>
        </div>

    </body>
</html>
