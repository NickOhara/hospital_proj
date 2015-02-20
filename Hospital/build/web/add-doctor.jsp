<%@ include file="header.jsp" %>

         <div id="add-doc">
            <ol id="add-doc-bc" class="breadcrumb">
                <li><a href="staff-main.jsp">Staff Main</a></li>
                <li class="active">Doctor</li>
            </ol>
             <div id="add-doc-form">
             <form method="post" role="form" action="AddDoctorServlet">
                 <div class="form-group">
                     <label for="id">ID</label>
                     <input type="text" class="form-control" id="id" name="id" placeholder="Enter ID">
                 </div>
                 <div class="form-group">
                     <label for="fname">First Name</label>
                     <input type="text" class="form-control" id="fname" name="fname" placeholder="Enter First Name">
                 </div>
                 <div class="form-group">
                     <label for="lname">Last Name</label>
                     <input type="text" class="form-control" id="lname" name="lname" placeholder="Enter Last Name">
                 </div>
                 <button type="submit" class="btn btn-default">Submit</button>
             </form>
             </div>
        </div>
 
    
    </body>
</html>

    </body>
</html>
