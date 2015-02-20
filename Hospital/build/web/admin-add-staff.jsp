<%@ include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>  
<div id="add-doc">
    <ol id="add-doc-bc" class="breadcrumb">
        <li><a href="AdminServlet">Admin Main</a></li>
        <li class="active">Doctor</li>
    </ol>
    <div id="add-doc-form">
        <form method="post" role="form" action="AdminAddStaffServlet">
            <div class="form-group">
                <label for="fname">First Name</label>
                <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter First Name">
            </div>
            <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter Last Name">
            </div>
            <div class="form-group">
                <label for="extn">Extension</label>
                <input type="text" class="form-control" id="lname" name="extn" placeholder="Enter Last Name">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>
</div>


</body>
</html>
