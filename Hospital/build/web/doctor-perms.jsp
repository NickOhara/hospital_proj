<%@ include file="header.jsp" %>
         <div id="appointments-list">
             
           <form id="search-form" action="DoctorPremissions?how=give&" role="form">
                            <div class="form-group">
                                <label for="search-filter">Choose a Doctor</label>
                                <select name="doctors" id="search-filter">
                                       <%  _session = request.getSession();
                                            out.println(_session.getAttribute("doctor-list"));
                                       %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="search-filter">Set Permission</label>
                                <select name="p" id="search-filter">
                                    <option value ="0">0</option>
                                    <option value ="0">1</option>
                                </select>
                            </div>
                                <input type="hidden" name="give" value="1"/>
                            <button type="submit" class="btn btn-default">Submit</button> 
                        </form>
        </div>
    </body>
</html>
