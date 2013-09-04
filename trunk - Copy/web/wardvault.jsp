<%-- 
    Document   : registrationaction
    Created on : Mar 30, 2012, 11:22:44 PM
    Author     : Arnold Isaac McSey
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        response.sendRedirect("index.jsp");
    }
    ExtendedHMSHelper mgr = new ExtendedHMSHelper();
%>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>

    </head>
    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -80px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <!--<li>
                            <a href="#">Records</a><span class="divider"></span>
                        </li>-->
                        <li>
                            <a href="#">Ward</a><span class="divider"></span>
                        </li>
                        <li class="active">
                            <a href="#">Patient Bed Assignments</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>


            <%@include file="widgets/loading.jsp" %>

            <section id="dashboard">

                <%if (session.getAttribute("lasterror") != null) {%>
                <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>
                <br/>
                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                    }%>
                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>
                    <div style="display: none;" class="span9 offset3 thumbnail well content hide">



                        <table cellpadding="0" cellspacing="0" border="0" class="display example table">
                            <thead>

                                <tr>
                                    <th>Folder Number </th>
                                    <th>Full Name </th>
                                    <th>Date of Birth</th>
                                    <th>Sponsor</th>
                                    <th>Registered On</th>
                                    <th> </th>



                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    //Patient p = (Patient)session.getAttribute("patient");
                                    //get current date time with Date()
                                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                                    Date date = new Date();
                                    //System.out.println(dateFormat.format(date));
                                    List visits = mgr.listUnitVisitations("ward", dateFormat.format(date));

                                    List beds = null;
                                    // List patients = mgr.listPatients();
                                    for (int i = 0; i < visits.size(); i++) {
                                        Visitationtable visit = (Visitationtable) visits.get(i);
                                %>

                                <tr>
                                    <td style="text-transform: uppercase; color: #4183C4; font-weight: bold;" class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5> <b><%= mgr.getPatientByID(visit.getPatientid()).getFname()%> <%= mgr.getPatientByID(visit.getPatientid()).getMidname()%> <%= mgr.getPatientByID(visit.getPatientid()).getLname()%>  </b></h5> <h5><b> Date of Birth :</b> <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofbirth())%></h5> <span>"
                                        data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%= mgr.getPatientByID(visit.getPatientid()).getGender()%></td> </tr> <tr> <td> Employer </td> <td> <%= mgr.getPatientByID(visit.getPatientid()).getEmployer()%>  </td>  </tr> <tr> <td> Sponsor </td> <td>
                                        <%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(visit.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%>  </td> </tr>
                                        </table>">
                                        <a style="text-transform: uppercase;" class="patientid"><%= visit.getPatientid()%></a>
                                    </td>
                                    <td>
                                        <%=mgr.getPatientByID(visit.getPatientid()).getFname()%> <%=mgr.getPatientByID(visit.getPatientid()).getMidname()%> <%=mgr.getPatientByID(visit.getPatientid()).getLname()%>
                                    </td>
                                    <td>
                                        <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofbirth())%>
                                    </td>
                                    <td>
                                        <%=mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(visit.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(visit.getPatientid()).getSponsorid()).getSponsorname()%> 
                                    </td>
                                    <td>
                                        <%= formatter.format(mgr.getPatientByID(visit.getPatientid()).getDateofregistration())%>
                                    </td>
                                    <td>
                                        <a id="<%=visit.getPatientid()%><%=visit.getVisitid()%>link"  class="visitlink btn btn-info btn-small"> <i class="icon-hdd icon-white"> </i> Assign Bed</a>
                                    </td>
                                </tr>
                                <% }

                                %>
                            </tbody>
                        </table>
                    </div> 

                    <div class="clear"></div>



                </div>

            </section>

            <%@include file="widgets/footer.jsp" %>

        </div><!-- /container -->

        <%@include file="widgets/javascripts.jsp" %>

        <%   for (int i = 0; i < visits.size(); i++) {
                Visitationtable visit = (Visitationtable) visits.get(i);%>
        <script type="text/javascript">
            $(document).ready(function(){
                                                      
               
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog({
                    autoOpen : false,
                    width : 750,
                    modal :true,
                    position : "top"
		
                });
                
                $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>link').click(function(){
                   
                    $('#<%=visit.getPatientid()%><%=visit.getVisitid()%>').dialog('open');
                    return false;
                });
                
                                                        
                
            });
        </script>

        <div style="max-height: 600px; y-overflow: scroll; display: none;" class="dialog hide" id="<%=visit.getPatientid()%><%=visit.getVisitid()%>"  title=" Bed Assignment for <%= mgr.getPatientByID(visit.getPatientid()).getFname()%> <%= mgr.getPatientByID(visit.getPatientid()).getLname()%>">

            <div class="thumbnail">
                <ul style="margin-left: 0px; text-transform: uppercase" class="breadcrumb">
                    <li>
                        <span class="divider"></span> <b> Folder No: <%= mgr.getPatientByID(visit.getPatientid()).getPatientid()%> </b>
                    </li>
                </ul>
                <form action="action/wvaultaction.jsp" method="post" class="form-horizontal">

                    <table class="table example display">
                        <thead>
                            <tr style="width: 600px;">
                                <th>
                                    Bed
                                </th>
                                <th>
                                    Room
                                </th>
                                <th>
                                    Ward
                                </th>
                                <th>
                                    Cost 
                                </th>
                                <th>

                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                beds = mgr.listBed();
                                for (int j = 0; j < beds.size(); j++) {
                                    Bed bed = (Bed) beds.get(j);
                                    if (!bed.isOccuppied()) {
                            %>

                            <tr>
                                <td><%=bed.getDescription()%></td>
                                <% String str = bed.getWardOrRoom();
                                    int code = Integer.parseInt(str.split("_")[1]);
                                    if (str.split("_")[0].equals("room")) {%>
                                <td>
                                    <%= mgr.getRoom(code).getDescription()%>
                                </td>
                                <td>
                                    <%= mgr.getWardById(mgr.getRoom(code).getWardId()).getWardname()%>
                                </td>
                                <td>
                                    <%= mgr.getRoom(code).getCost()%>
                                </td>
                                <%  }
                                    if (str.split("_")[0].equals("ward")) {%>
                                <td>

                                </td>
                                <td>
                                    <%=mgr.getWardById(code) == null ? "" : mgr.getWardById(code).getWardname()%>
                                </td>
                                <td>
                                    <%=mgr.getWardById(code) == null ? "" : mgr.getWardById(code).getCost()%>
                                </td>
                                <% }
                                %> 

                                <td>
                                    <div class="radioset">

                                        <input type="radio" id="bed<%=bed.getBedid()%>" name="bed" value="<%=bed.getBedid()%>"/><label for="bed<%=bed.getBedid()%>">Check In</label>
                                    </div>
                                </td>
                            </tr> 
                            <% }
                                }
                            %>
                        </tbody>
                    </table>

                        <div style="text-align: center;" class="form-actions">
                            <input type="hidden" name="patientid" value="<%= visit.getPatientid()%>"/>
                            <input type="hidden" name="id" value="<%=visit.getVisitid()%>"/>
                            <button class="btn btn-danger btn-small pull-right" type="submit" name="action" value="Forward">
                                    <i class="icon-arrow-right icon-white"> </i> Assign Bed 
                            </button>
                        </div>
            </div>


        </form>

    </div>
</div>


<div class="clear"></div>

<% }%>


</body>
</html>