<%-- 
    Document   : header
    Created on : Mar 26, 2014, 4:14:46 PM
    Author     : mikededys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hospitalPackage.UserLogin"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/general.css" rel="stylesheet">
        <link href="css/patient.css" rel="stylesheet">
        <link hred="css/theme.bootstrap.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/jquery.tablesorter.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <body>
        <!-- Fixed navbar -->
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div>
                <img style="margin-right: 10px" align="left" height="50px" src="css/apollocreed.JPG">
            </div>
            
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="LoginServlet">Apollo Healthcare</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li> 
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <% HttpSession _session = request.getSession();
                                    UserLogin _login = (UserLogin) _session.getAttribute("userLogin");
                                    out.print("Welcome " + _login.getUserName());
                                %> 
                                <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="index.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>

