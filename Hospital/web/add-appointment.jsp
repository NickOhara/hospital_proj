<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>
<div id="add-appointment">
	<ol id="add-appointment-bc" class="breadcrumb">
		<li><a href="StaffServlet">Staff Main</a></li>
		<li class="active">Add Appointment</li>
	</ol>
    <form action="AppointmentServlet" method="post">
	<div id="add-appointment-form">
			<div class="form-group">
                            <%
                                    try{
                                    if (request.getParameter("CONFLICK").equals("YAHBABY")) {
                                         out.println("<span class=\"label label-danger\">TIME CONFLICT</span>");
                                    } else {
                                        
                                    }
                                    }
                                    catch(Exception ex)
                                    {
                                        
                                    }
                                %>
				<label for="month">Date</label>
				<div class="form-inline">
					<select name="Month" id="month" class="form-control">
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select>
					<select name="Day" id="day" class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select>
					<select name="Year" id="year" class="form-control">
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name">Time</label>
				<div class="form-inline">
					<select name="Hour" id="hour" class="form-control">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select name="Minute" id="minute" class="form-control">
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
						<option value="32">32</option>
						<option value="33">33</option>
						<option value="34">34</option>
						<option value="35">35</option>
						<option value="36">36</option>
						<option value="37">37</option>
						<option value="38">38</option>
						<option value="39">39</option>
						<option value="40">40</option>
						<option value="41">41</option>
						<option value="42">42</option>
						<option value="43">43</option>
						<option value="44">44</option>
						<option value="45">45</option>
						<option value="46">46</option>
						<option value="47">47</option>
						<option value="48">48</option>
						<option value="49">49</option>
						<option value="50">50</option>
						<option value="51">51</option>
						<option value="52">52</option>
						<option value="53">53</option>
						<option value="54">54</option>
						<option value="55">55</option>
						<option value="56">56</option>
						<option value="57">57</option>
						<option value="58">58</option>
						<option value="59">59</option>
					</select>
					<select name="Am-Pm" id="am-pm" class="form-control">
						<option value="am">AM</option>
						<option value="pm">PM</option>
					</select>
				</div>
			</div>
                        <div class="form-group">
				<label for="length">Length of Appointment</label>
				<select name="Length" id="length" class="form-control">
					<option value="15">15 Minutes</option>
                                        <option value="30">30 Minutes</option>
                                        <option value="45">45 Minutes</option>
                                        <option value="60">1 Hour</option>
				</select>
			</div>
                        <div class="form-group">
				<label for="procedure">Procedure</label>
				<select name="Procedure" id="procedure" class="form-control">
					<option>None Given</option>
				</select>
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
                                                     out.println(String.format("<option value = \"%s\">%s</option>", ((ArrayList)(prescription.get(i))).get(0), ((ArrayList)(prescription.get(i))).get(1)));
                                                //}
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
                                                     out.println(String.format("<option value = \"%s\">%s</option>", ((ArrayList)(diagnosis.get(i))).get(0), ((ArrayList)(diagnosis.get(i))).get(1)));
                                                //}
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
                                                    //int id = Integer.parseInt((String)((ArrayList)treatments.get(i)).get(0));
                                                     out.println(String.format("<option value = \"%s\">%s</option>", ((ArrayList)(treatments.get(i))).get(0), ((ArrayList)(treatments.get(i))).get(1)));
                                                //}
                                            }
                                            
                                        %>
				</select>
			</div>
			<div class="form-group">
				<label for="comments">Comments</label>
				<textarea name="Comments"  class="form-control" id="comments" row="3"></textarea>
			</div>
            <input type="hidden" name="Patient" value=""/>
			<button type="submit" class="btn btn-default">Submit</button>
	</div>
        </form>

</div>


</body>
</html>
