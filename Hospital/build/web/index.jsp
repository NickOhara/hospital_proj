<%-- 
    Document   : index
    Created on : 24-Mar-2014, 12:08:21 PM
    Author     : mikededys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
         <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/cover.css" rel="stylesheet">
       
    </head>
    <body>        
         <div class="site-wrapper">
            <div class="site-wrapper-inner">
                <div class="cover-container">
                    <div class="inner cover">
                        <h1 class="cover-heading">Apollo Healthcare</h1>
 
                           <form method="post" action="LoginServlet" class="form-signin" role="form">
                                <h2 class="form-signin-heading">Please sign in</h2>
                                <input name="username" type="username" class="form-control" placeholder="Username" required autofocus>
                                <input name="password" type="password" class="form-control" placeholder="Password" required>
                                <%
                                    try{
                                    if (request.getParameter("loginsuccessful").equals("false")) {
                                         out.println("<span class=\"label label-danger\">Login Unsuccessful</span>");
                                    } else {
                                        
                                    }
                                    }
                                    catch(Exception ex)
                                    {
                                        
                                    }
                                %>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                            </form>
                       <!-- <a href="patient.jsp"> Patient Page </a>
                        <a href="staff-main.jsp"> Staff Page </a>
                        <a href="add-doctor.jsp"> Add Doctor</a>
                        <a href="doctor.jsp"> Doctor</a>-->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
