<%@ include file="header.jsp" %>

<script type="text/javascript">


    $(document).ready(function() {

        $('#goHome').on('click', function(e) {
            location.href = "FinanceServlet";
        });
    });

</script> 
<div id="appt-detail">
    <div id="num-total-patients">
        <span><p># of Appointments <% out.print(request.getAttribute("num-pats"));%></p></span>
    </div> 
    <form method="get" action="ApptStats" role="form">
    <div id="panel-container">
        <div class="panel panel-default">
            <div class="panel-heading">Patient Appointments</div>
            <table id="tbl-doctor" class="table table-striped">
                <tr>
                    <td>Date</td>
                    <td>Diagnosis</td>
                    <td>Treatment</td>
                    <td>Treatment Date</td>
                    <td>Prescription</td>
                </tr>
                <% String output = (String) request.getAttribute("table-rows");
                    out.println(output);
                %>
            </table>
        </div>
    </div>
    </form>
</div>

</body>
</html>
