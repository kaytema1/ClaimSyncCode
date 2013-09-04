<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="entities.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.HMSHelper"%>
<%@page import="java.text.DateFormat"%>
<meta charset="utf-8">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  ExtendedHMSHelper mg = new ExtendedHMSHelper();
    DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

    Date dt = new Date();
    //System.out.println(dateFormat.format(date));
    List allpatients = mg.listPatients();
    List medbillpatients = mg.listUnitVisitations("account", dateformat.format(dt));
    List dispensingpatients = mg.listPharmordersByStatus("Account");
    List procedurepatients = mg.listPatientProcedures("Cashier");
    List outstandingbills = mg.listDebtors();
    List opdpatients = mg.listUnitVisitations("vitals", dateformat.format(dt));
    List bedassignments = mg.listUnitVisitations("ward", dateformat.format(dt));
    List secondaryconsulting = mg.listSecondaryConsultation("consultation");
    List labresults = mg.listLabordersByStatus("Completed");
    List vjs = mg.listRecentVisits(dateformat.format(dt), "In Patient");
    List outs = mg.listRecentVisits(dateformat.format(dt), "Out Patient");
    List labs = mg.listUnitVisitations("Laboratory", dateformat.format(dt));
    List pharmacy = mg.listPharmordersByStatus("Pharmacy");;
    List dis = mg.listPharmordersByStatus("Settled");
    List accs = mg.listPharmordersByStatus("Account");
    List vis = mg.listPharmordersByStatus("Records");
    List reg = mg.listRecentVisits(dateformat.format(dt));
    List rms = mg.listUnitVisitations("Room 1", dateformat.format(dt));
    List scheduledAppiontments = mg.listScheduledAppointments(0);
    List visitsConsult = mg.listUnitVisitations("consultation", dateformat.format(dt));
    
%>

<div style="height: 100%; position: fixed;" class="span3">
    <ul style="display: none;"  class="menu hide">
        <%
            String perm = (String) session.getAttribute("unit");
            int role = (Integer) session.getAttribute("role");
            String[] perms = perm.split("_");
            if (role == 1 || role == 4) {
        %>
        <%}
            if (role == 8 || role == 1 || role == 4) {
        %>
        <li class="item1">
            <a  href="#"><i class="icon-folder-close"></i> Records</a>
            <ul>
                <li class="subitem1">
                    <a href="records.jsp">Front Desk </a>
                </li>
                
                <li class="subitem3">
                    <a href="listpatients.jsp">All Patients <span><%=allpatients.size()%></span></a>
                </li>



            </ul>

        </li>

        <li class="item1">
            <a  href="#"><i class="icon-calendar"></i> Appointments</a>
            <ul>
                <li class="subitem3">
                    <a href="addappointment.jsp">New Appointment </a>
                </li>
                <li class="subitem3">
                    <a href="viewscheduled.jsp">Booked Appointments  <span><%=scheduledAppiontments.size()%></span> </a>
                </li>
                <li class="subitem3">
                    <a href="appointment.jsp">Appointment Calendar </a>
                </li>
            </ul>
            <%}
                if (role == 7 || role == 1 || role == 4) {%>
        <li class="item1">
            <a  href="#"><i class="icon-folder-open"></i> Nurses Station</a>
            <ul>
                <li class="subitem2">
                    <a href="opd.jsp">Vitals  <span><%= opdpatients.size()%></span></a>
                </li>
                <li class="subitem2">
                    <a href="nursedaysheet.jsp">Nurses Day Sheet </a>
                </li>
                <li class="subitem2">
                    <a href="readyprocedures.jsp">Perform Procedure </a>
                </li>

            </ul>

        </li>
        <li class="item2">
            <a href="#"> <i class=" icon-th"></i> Ward Management
            </a> 
            <ul>
                <li class="subitem1">
                    <a href="wardvault.jsp">Patient Bed Assignments <span> <%=bedassignments.size()%></span></a>
                </li>

            </ul>
        </li>
        <%}
            if (role == 3 || role == 1 || role == 4) {
        %>
        <li class="item2">
            <a href="#"> <i class=" icon-eye-open"></i> Consultation
            </a> 
            <ul>
                <li class="subitem1">
                    <a href="consultingroom.jsp">Consulting Patients <span><%=visitsConsult.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="secondary.jsp"> Consulting (Reviews) <span><%=secondaryconsulting.size()%></span> </a>
                </li>
                <li class="subitem5">
                    <a href="labresults.jsp">Laboratory Results <span><%=labresults.size()%></span></a>
                </li> 
                <!--     <li class="subitem3">
                         <a href="outpatient.jsp">Recent Out Patients <span><%=vjs.size()%></span></a>
                     </li>  -->
                <li class="subitem4">
                    <a href="inpatient.jsp">Recent In Patients <span> <%=outs.size()%></span></a>
                </li> 
                <li class="subitem2">
                    <a href="readyprocedures.jsp">Perform Procedure <span> <%=procedurepatients.size()%></span> </a>
                </li>

            </ul>
        </li>
        <%}
            if (role == 7 || role == 3 || role == 4) {%>
        <li class="item2">
            <a href="#"> <i class=" icon-th"></i> Wards
            </a> 
            <ul>

                <%List wards = mg.listWard();
                    for (int h = 0; h < wards.size(); h++) {
                        Ward ward = (Ward) wards.get(h);

                %>
                <li class="subitem1">
                    <a href="ward.jsp?type=<%=ward.getType()%>_<%=ward.getWardid()%>"><%=ward.getWardname()%></a>
                </li>
                <%}%>
            </ul>
        </li> 
         
        <%}
         
            if (role == 5 || role == 1 || role == 4) {%>
        <li class="item4">
            <a href="#"><i class="icon-adjust"></i> Dispensing </a>
            <ul>
                <li class="subitem1">
                    <a href="pharmacy.jsp">Prescription Orders <span><%=pharmacy.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="readytodispensed.jsp">Dispensing <span><%=dis.size()%></span></a>
                </li>
             
            </ul>
        </li>


        <li class="item4">
            <a href="#"><i class="icon-list"></i> Dispensary Stock</a>
            <ul>
                <li class="subitem1">
                    <a href="dispensarymakerequest.jsp">Make Stock Request </a>
                </li>
                <li class="subitem3">
                    <a href="delivered.jsp">Stock Deliveries</a>
                </li>
                <li class="subitem3">
                    <a href="addmedicine.jsp">New Medicine</a>
                </li>
            </ul>
        </li>
        <%}
            if (role == 2 || role == 1 || role == 4) {%>
        <li class="item4">
            <a href="#"><i class="icon-plus"></i> Billing</a>
            <ul>
                <li class="subitem1">
                    <a href="accounts.jsp">Medical Bills <span><%=medbillpatients.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="dispensary.jsp">Dispensing Bills<span><%=dispensingpatients.size()%></span></a>
                </li>
                <li class="subitem1">
                    <a href="procedurepricing.jsp">Procedure Bills<span><%=procedurepatients.size()%></span></a>
                </li>
                
                 <li class="subitem1">
                    <a href="outstandingbills.jsp">Outstanding Bills<span><%=outstandingbills.size()%></span></a>
                </li>
                
                <li class="subitem1">
                    <a href="account_search.jsp">Patient Bill Summaries </a><span></span>
                </li>
                

            </ul>
        </li>
        <%}
            if (role == 10 || role == 1 || role == 4) {%>
        <li class="item4">
            <a href="#"><i class="icon-list-alt"></i> Inventory</a>
            <ul>
                
                <li class="subitem1">
                    <a href="additemtostock.jsp">Add Items to Stock</a>
                </li>
                <li class="subitem1">
                    <a href="allrequests.jsp">All Requests</a>
                </li>
                <li class="subitem2">
                    <a href="addType.jsp">Add Item Type</a>
                </li>
            <!--    <li class="subitem3">
                    <a href="search_item.jsp">Search Item</a>
                </li>  
                <li class="subitem4">
                    <a href="application.jsp">List Items</a>
                </li>   --->
                <li class="subitem4">
                    <a href="check.jsp">Check Expiry</a>
                </li>
                <li class="subitem4">
                    <a href="addSupplier.jsp">Add Supplier</a>
                </li>
                <li class="subitem4">
                    <a href="addmanufacturer.jsp">Add Manufacture</a>
                </li>
            </ul>
        </li>
        <%}
            if (role == 1 || role == 4) {%>
        <li class="item4">
            <a href="#"><i class="icon-picture"></i> Reports </a>
            <ul>
                <li class="subitem3">
                    <a href="anballdepartments.jsp">Departmental Bill Summary</a>
                </li>
                <li class="subitem3">
                    <a href="anballpatientsrevenues.jsp">Patients Bill Report</a>
                </li>
                <li class="subitem3">
                    <a href="anballsponsorsrevenues.jsp">Sponsors Bill Report</a>
                </li>
                <li class="subitem2">
                    <a href="emrdashboard.jsp">At-A-Glance Dashboard</a>
                </li>
                <li class="subitem3">
                    <a href="patientutilization.jsp">Patient Utilization</a>
                </li>
                <li class="subitem4">
                    <a href="patientmedicalanalysis.jsp">Patient Medical Analysis</a>
                </li>
                <li class="subitem4">
                    <a href="patientbilling.jsp">Patient Billing</a>
                </li>

            </ul>
        </li>
        

        <li class="item4">
            <a href="#"><i class="icon-cog"> </i> Admin Panel</a>
            <ul>

                <li class="subitem1">
                    <a href="adminpanel.jsp">Admin Home</a>
                </li>

                
            </ul>
        </li>
        <%}%>

    </ul>
</div>
