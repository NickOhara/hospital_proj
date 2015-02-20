<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>  
<div id="add-doc">
    <ol id="add-doc-bc" class="breadcrumb">
        <li><a href="AdminServlet">Admin Main</a></li>
        <li class="active">Doctor</li>
    </ol>
    <div id="add-doc-form">
        <form method="post" role="form" action="AdminAddDoctorServlet">
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter First Name">
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter Last Name">
            </div>
            <div class="form-group">
                <label for="specialization">Specialization</label>
                <select name="specialization" class="form-control">
                    <%
                        ArrayList<ArrayList<String>> Specializations = new ArrayList<ArrayList<String>>();
                        if (request.getAttribute("specializations") != null) {
                            Specializations = (ArrayList<ArrayList<String>>) request.getAttribute("specializations");
                        }

                        for (ArrayList<String> doctor : Specializations) {
                            out.println(String.format("<option value = \"%d\">%s</option>", Integer.parseInt(doctor.get(0)), doctor.get(1)));
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>


</body>
</html>
