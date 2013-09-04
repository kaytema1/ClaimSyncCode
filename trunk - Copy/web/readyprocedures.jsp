<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>

        <%
            Users user = (Users) session.getAttribute("staff");
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            if (user == null) {
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }
            ExtendedHMSHelper mgr = new ExtendedHMSHelper();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            DecimalFormat df = new DecimalFormat();

            df.setMinimumFractionDigits(2);
            Date date = new Date();
            List visits = mgr.listPatientProcedures("Ready");
            List treatments = null;
        %>


    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                        <ul class="nav nav-pills">

                            <li>
                                <a href="#">Billing</a><span class="divider"></span>
                            </li>
                            <li  class="active">
                                <a href="#">Procedures Performed</a><span class="divider"></span>
                            </li>

                        </ul>
                    </div>
                </div>

            </header>

            <%@include file="widgets/loading.jsp" %>

            <section style="margin-top: -30px;" id="dashboard">

                <%if (session.getAttribute("lasterror") != null) {%>
                <div class="alert hide <%=session.getAttribute("class")%> span12 center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>
                <br/>
                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                    }%>

                <div class="row">

                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">



                        <div class="span9 thumbnail well content">

                            <table class="example display">
                                <thead>
                                    <tr>
                                        <th style="font-size: 12px;"> Patient #</th>
                                        <th style="font-size: 12px;"> Patient Name </th>
                                        <th style="font-size: 12px;"> Date of Birth  </th>
                                        <th style="font-size: 12px;"> Procedure </th>
                                        <th style="font-size: 12px;"> Sponsor </th>
                                        <th style="font-size: 12px;">  </th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (visits != null) {

                                            String pId = "";
                                            PatientRegistration pReg = null;
                                            List result;
                                            boolean paymentStatus = false;


                                            for (int i = 0; i < visits.size(); i++) {
                                                Procedureorders vst = (Procedureorders) visits.get(i);
                                    %>
                                    <tr>
                                        <td colspan="6">


                                            <div class="hide" id="procedure_detail<%=vst.getOrderid()%>">

                                            </div>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td style="text-transform: uppercase; color: #4183C4; font-weight: bold" class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Patient Information Summary </h3> <h5><%=mgr.getPatientByID(vst.getPatientid()).getFname()%> <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></h5> <h5><b> Date of Birth :</b> <%=mgr.getPatientByID(vst.getPatientid()).getDateofbirth()%></h5> </span>"
                                            data-content="<table class='table table-bordered'> <tr> <td> Gender  </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getGender()%> </td> </tr> <tr> <td> Employer </td> <td> <%=mgr.getPatientByID(vst.getPatientid()).getEmployer()%> </td>  </tr> <tr> <td> Sponsor </td> <td> <%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(vst.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%> </td> </tr> <tr>
                                            <td> Policy Number </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%> </td> </tr> <tr> <td> Benefit Plan </td> <td> <%=mgr.sponsorshipDetails(vst.getPatientid()).getBenefitplan()%> </td> </tr>  </table> "> <%=vst.getPatientid()%>   </td>
                                        <td><%=mgr.getPatientByID(vst.getPatientid()).getFname()%>, <%=mgr.getPatientByID(vst.getPatientid()).getMidname()%> <%=mgr.getPatientByID(vst.getPatientid()).getLname()%></td>
                                        <td><%=formatter.format(mgr.getPatientByID(vst.getPatientid()).getDateofbirth())%> </td>

                                        <td><%=mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()) == null ? mgr.sponsorshipDetails(vst.getPatientid()).getType() : mgr.getSponsor(mgr.sponsorshipDetails(vst.getPatientid()).getSponsorid()).getSponsorname()%> </td>

                                        <td><%=mgr.sponsorshipDetails(vst.getPatientid()).getMembershipid()%>   </td>

                                        <td><form style="padding: 0px; margin: 0px;" action="action/procedureaction.jsp" method="post">
                                                <input type="hidden" name="orderid" value="<%=vst.getOrderid()%>"/>
                                                <button class="btn btn-info btn-small" id="procedure_link<%=vst.getOrderid()%>" type="submit" name="action" value="Procedure Performed">
                                                    <i class="icon-white icon-check"></i> Performed
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}
                                    }%> 

                                </tbody>
                            </table>

                        </div>

                    </div>
                    <div class="clearfix"></div>

                </div>

            </section>

            <footer style="display: none; margin-top: 50px;" class="footer">
                <p style="text-align: center" class="pull-right">
                    <img src="images/logo.png" width="100px;" />
                </p>
            </footer>

        </div><!-- /container -->    

    </div>
</div>
<!--end static dialog-->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap-dropdown.js"></script>
<script src="js/bootstrap-scrollspy.js"></script>
<script src="js/bootstrap-collapse.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script src="js/bootstrap-popover.js"></script>
<script src="js/application.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>

<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>
<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>

<script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

<script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
<script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

<script type="text/javascript" src="js/tablecloth.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/demo.js"></script>

<!--initiate accordion-->
<script type="text/javascript">
    function updateProcedure(orderid,amountdue){
      
        var orderid = document.getElementById(orderid).value;
        var amountdue = document.getElementById(amountdue).value;
        //  alert(orderid)
        $.post('action/procedureaction.jsp', { action : "Procedure Receipt", orderid : orderid, amountdue : amountdue}, function(data) {
            alert(data);
            $('#results').html(data).hide().slideDown('slow');
        } );
    }
    function printSelection(node){
        var content=node.innerHTML
        var pwin=window.open('','print_content','width=400,height=900');

        pwin.document.open();
        pwin.document.write('<html><body onload="window.print()">'+content+'</body></html>');
        pwin.document.close();
        setTimeout(function(){pwin.close();},1000);
    }
    
    
    
    $(function() {
        $("input:checkbox").attr("checked", true);
        
        var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');
        
        $(".menu").fadeIn();
        $(".content1").fadeIn();
        $(".navbar").fadeIn();
        $(".footer").fadeIn();
        $(".subnav").fadeIn();
        $(".alert").fadeIn();
        $(".progress1").hide();

        menu_a.click(function(e) {
            e.preventDefault();
            if(!$(this).hasClass('active')) {
                menu_a.removeClass('active');
                menu_ul.filter(':visible').slideUp('normal');
                $(this).addClass('active').next().stop(true, true).slideDown('normal');
            } else {
                $(this).removeClass('active');
                $(this).next().stop(true, true).slideUp('normal');
            }
        });
        
        $('.example').dataTable({
            "bJQueryUI" : true,
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "aaSorting" : [],
            "bSort" : true,
            "sScrollY" : 400
        }); 
        
        
        $(".patient").popover({
            placement : 'right',
            animation : true
        });
       
       
    });
</script>
<% for (int i = 0;
            i < visits.size();
            i++) {
        Procedureorders vst = (Procedureorders) visits.get(i);
%>
<script type="text/javascript">
    
    
    var amountdue<%=vst.getOrderid()%> = 0.0;
    
    $(".amountduepiece<%=vst.getOrderid()%>").each(function(){
         
        //alert("amountduepiece"+ $(".amountduepiece<%=vst.getOrderid()%>").attr("value"))
        amountdue<%=vst.getOrderid()%> = parseFloat(amountdue<%=vst.getOrderid()%>)  + parseFloat($(this).attr("value"));
        $(".amountduetext<%=vst.getOrderid()%>").attr("value",amountdue<%=vst.getOrderid()%>);
        $(".amountdueinput<%=vst.getOrderid()%>").attr("value",amountdue<%=vst.getOrderid()%>);
    });
    // alert(amountdue<%=vst.getOrderid()%>)
    
    $("#<%= vst.getOrderid()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true
    });
    $("#<%= vst.getOrderid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true
    });
    $("#procedure_detail<%= vst.getPatientid()%>").dialog({
        autoOpen : false,
        width : 1000,
        modal :true
    });
    $("#procedure_link<%= vst.getOrderid()%>").click(function(){
        $("#procedure_detail<%=vst.getOrderid()%>").dialog('open');
        return false;
    })
    
    $("#<%= vst.getVisitid()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getVisitid()%>_adddrug_dialog").dialog('open');
    })
    $("#discount_links<%=vst.getVisitid()%>").dialog({
        autoOpen : false,
        width : 1000,
        modal :true
    });
    /* $("#discount<%=vst.getVisitid()%>").click(function(){
        $("#discount_link<%=vst.getVisitid()%>").dialog('open');
        return false;
    
    })*/
    $("#password_link<%=vst.getVisitid()%>").dialog({
        autoOpen : false,
        width : 1000,
        modal :true
    });
    $("#discount<%=vst.getVisitid()%>").click(function(){
        $("#password_link<%=vst.getVisitid()%>").dialog('open');
        return false; 
    }) 
   
    $(function(){
        var amountdue = parseFloat($(".amountdueinput<%= vst.getOrderid()%>").attr("value")).toFixed(2);
        
        $(".amountduetext<%= vst.getOrderid()%>").html(amountdue);
        var checkedValue = 0;
        //$("#amountdue").attr("value",parseFloat(0));
        //$("#amountduetext").html("0.0");
        
        $(".balanceinput<%= vst.getOrderid()%>").attr("value",parseFloat(0).toFixed(2));
        $(".balancetext<%= vst.getOrderid()%>").html("0.00");
        
        $(".amountpaidinput<%= vst.getOrderid()%>").attr("value",parseFloat(0).toFixed(2))
        $(".amountpaidtext<%= vst.getOrderid()%>").html($(".amountpaidinput<%= vst.getOrderid()%>").attr("value"))
        
        $(".amountpaidinput<%= vst.getOrderid()%>").live('keyup',function(){
           
            var amountdue = $(".amountdueinput<%= vst.getOrderid()%>").attr("value");
            var amountpaid = $(".amountpaidinput<%= vst.getOrderid()%>").attr("value");
            $(".amountpaidtext<%= vst.getOrderid()%>").html($(".amountpaidinput<%= vst.getOrderid()%>").attr("value"))
            
            if(amountpaid == ""){
                amountpaid = 0;
            }
            var balance = parseFloat(amountpaid).toFixed(2) - parseFloat(amountdue).toFixed(2);
            
            if(amountpaid > 0 &&balance < 0){
                $(".paymentstatus<%= vst.getOrderid()%>").html("Part Payment").addClass('text-error').removeClass('text-success') 
                $('.balanceinput<%= vst.getOrderid()%>').closest('.control-group').addClass('error').removeClass('success')
                $('.balancetext<%= vst.getOrderid()%>').addClass('text-error').removeClass('text-success')
                $('.balancetextcolour<%= vst.getOrderid()%>').addClass('text-error').removeClass('text-success')
               
            } else if (amountpaid == 0){
                $(".paymentstatus<%= vst.getOrderid()%>").html("").removeClass('text-success').removeClass('text-error')
                $('.balanceinput<%= vst.getOrderid()%>').closest('.control-group').removeClass('success').removeClass('error')
                $('.balancetext<%= vst.getOrderid()%>').removeClass('text-success').removeClass('text-error')
                $('.balancetextcolour<%= vst.getOrderid()%>').removeClass('text-success').removeClass('text-error')
                
            } 
           
            else if(amountpaid > 0 && balance >= 0){
                $(".paymentstatus<%= vst.getOrderid()%>").html("Full Payment").addClass('text-success').removeClass('text-error')
                $('.balanceinput<%= vst.getOrderid()%>').closest('.control-group').addClass('success').removeClass('error')
                $('.balancetext<%= vst.getOrderid()%>').addClass('text-success').removeClass('text-error')
                $('.balancetextcolour<%= vst.getOrderid()%>').addClass('text-success').removeClass('text-error')
            }
            $(".balanceinput<%= vst.getOrderid()%>").attr("value",parseFloat(balance).toFixed(2));
            $(".balancetext<%= vst.getOrderid()%>").html(parseFloat(balance).toFixed(2));
            $(".amountduetext<%= vst.getOrderid()%>").attr("value",$(".amountdue<%= vst.getOrderid()%>").attr("value"));
            
        });
        
        
        var amounttoplimit = amountdue;
        var amountbottomlimit = 0;
        
        
        $(".checkValue<%=vst.getOrderid()%>").change(function(){
            
            
            var amountpaid = parseFloat($(".amountpaidinput<%=vst.getOrderid()%>").attr("value"));
            //alert(amountpaid)
            if(amountpaid == ""){
                amountpaid = 0;
            }
            var balance = parseFloat(amountpaid).toFixed(2) - parseFloat(amountdue).toFixed(2);
            
            
            if($(this).is(':checked')){ 
                
                // alert("Checked")
                checkedValue = parseFloat($(this).attr("checkvalue")).toFixed(2);
                //alert(checkedValue);
                if(amountdue < amounttoplimit) { 
                    
                    amountdue = parseFloat(amountdue) + parseFloat(checkedValue);
                    
                    $(".amountdueinput<%=vst.getOrderid()%>").attr("value",amountdue);
                    $(".amountduetext<%=vst.getOrderid()%>").html(parseFloat(amountdue).toFixed(2));
                    
                }
    <%
        List procedures = mgr.listPatientProcdureByOrderid(vst.getOrderid());
        for (int r = 0; r < procedures.size(); r++) {
            PatientProcedure procedure = (PatientProcedure) procedures.get(r);
    %>
                    if ($(this).attr("id")=="procedure_check<%=procedure.getProcedureCode()%>"){
                        $(".procedure_row<%=procedure.getProcedureCode()%>").css('text-decoration','none')
                        $(".procedure_check<%=procedure.getProcedureCode()%>").css('display','block')
                    }                                                  
                                                                                
    <% }%>
               
                }else {
               
                    checkedValue = parseFloat($(this).attr("checkvalue")); 
                 
                    if(amountdue > amountbottomlimit) { 
                        amountdue = parseFloat(amountdue) - parseFloat(checkedValue);
                    
                        $(".amountdueinput<%=vst.getOrderid()%>").attr("value",amountdue);
                        $(".amountduetext<%=vst.getOrderid()%>").html(parseFloat(amountdue).toFixed(2));
                    }
               
    <%
        procedures = mgr.listPatientProcdureByOrderid(vst.getOrderid());
        for (int r = 0; r < procedures.size(); r++) {
            PatientProcedure procedure = (PatientProcedure) procedures.get(r);
    %>
                    if ($(this).attr("id")=="procedure_check<%=procedure.getProcedureCode()%>"){
                        $(".procedure_row<%=procedure.getProcedureCode()%>").css('text-decoration','line-through')
                        $(".procedure_check<%=procedure.getProcedureCode()%>").css('display','none')
                    }                                                  
                                                                                
                                                                                
    <% }%>
                
                    $("#override_action").dialog("open")
                }
            
                if (amountpaid > 0 && amountdue > 0){ 
                    balance = parseFloat(amountdue).toFixed(2) - parseFloat(amountpaid).toFixed(2);
                    $(".balancetext<%=vst.getOrderid()%>").html(parseFloat(balance).toFixed(2));
                }
                if(amountpaid > 0 && balance < 0){
                    $(".paymentstatus<%=vst.getOrderid()%>").html("Part Payment").addClass('text-error').removeClass('text-success') 
                    $('.balanceinput<%=vst.getOrderid()%>').closest('.control-group').addClass('error').removeClass('success')
                    $('.balancetext<%=vst.getOrderid()%>').addClass('text-error').removeClass('text-success')
                    $('.balancetextcolour<%=vst.getOrderid()%>').addClass('text-error').removeClass('text-success')
               
                } else if (amountpaid == 0.00){
                    $(".paymentstatus").html("").removeClass('text-success').removeClass('text-error')
                    $('.balanceinput<%=vst.getOrderid()%>').closest('.control-group').removeClass('success').removeClass('error')
                    $('.balancetext<%=vst.getOrderid()%>').removeClass('text-success').removeClass('text-error')
                    $('.balancetextcolour<%=vst.getOrderid()%>').removeClass('text-success').removeClass('text-error')
                
                }
                else if(amountpaid > 0 && balance >= 0){
                    $(".paymentstatus").html("Full Payment").addClass('text-success').removeClass('text-error')
                    $('.balanceinput<%=vst.getOrderid()%>').closest('.control-group').addClass('success').removeClass('error')
                    $('.balancetext<%=vst.getOrderid()%>').addClass('text-success').removeClass('text-error')
                    $('.balancetextcolour<%=vst.getOrderid()%>').addClass('text-success').removeClass('text-error')
                }
            });
        })
        var amountpaid = $(".amountdueinput<%= vst.getOrderid()%>").attr("value");
        $("#newamount<%= vst.getVisitid()%>").attr("value",amountpaid);
        $("#actualdis<%= vst.getVisitid()%>").live('keyup',function(){
            //alert("hello")
            var amountdue = $("#actualdis<%= vst.getVisitid()%>").attr("value");
            var amountpaid = $(".amountdueinput<%= vst.getOrderid()%>").attr("value");
            var newamount = (parseFloat(amountdue)/parseFloat(amountpaid))*100
            var newfig = parseFloat(newamount).toFixed(2);           
            var total = amountpaid - amountdue;
            total = total.toFixed(2)
            $("#percentagedis<%= vst.getVisitid()%>").attr("value",newfig);
            $("#newamount<%= vst.getVisitid()%>").attr("value",total);       
            if(amountpaid == ""){
                amountpaid = 0;
            }
        });
        $("#percentagedis<%= vst.getVisitid()%>").live('keyup',function(){
            //alert("hello")
            var amountdue = $("#percentagedis<%= vst.getVisitid()%>").attr("value");
            var amountpaid = $(".amountdueinput<%= vst.getOrderid()%>").attr("value");         
            var newamount = (parseFloat(amountpaid)*parseFloat(amountdue))/100
            var newfig = parseFloat(newamount).toFixed(2);            
            var total = amountpaid - newfig;
            total = total.toFixed(2);
            $("#actualdis<%= vst.getVisitid()%>").attr("value",newfig);
            $("#newamount<%= vst.getVisitid()%>").attr("value",total);         
            if(amountpaid == ""){
                amountpaid = 0;
            }
        });
        $("#verify<%=vst.getVisitid()%>").click(function(){
            // alert("hello");
            var username = $("#username<%=vst.getVisitid()%>").attr("value");
            var password = $("#password<%=vst.getVisitid()%>").attr("value");
            $.post('patientcount.jsp', {action : "patientdiscount", username : username, password : password}, function(data) {
                //alert(data);
                var bool = data;
                if(bool=="false"){
                    alert("You are eligible please go ahead")
                }
                else{
                    alert("You don't qualify to give discount please talk to a senior staff")
                    $("#discount_links<%=vst.getVisitid()%>").dialog('open');
                    return false;
                }
            });
        });
        $("#<%=vst.getVisitid()%>_discount").click(function(){     
            var percentage = $("#percentagedis<%=vst.getVisitid()%>").attr("value");
            var actual = $("#actualdis<%=vst.getVisitid()%>").attr("value");
            var newcharge = $("#newamount<%=vst.getVisitid()%>").attr("value");
            var status = $("#statusdis<%=vst.getVisitid()%>").attr("value");
            var staff = $("#staffiddis<%=vst.getVisitid()%>").attr("value");
            var reason = $("#reasondis<%=vst.getVisitid()%>").attr("value");
            var visit = $("#visitiddis<%=vst.getVisitid()%>").attr("value");
            alert(staff);
            $.post('patientcount.jsp', {action : "savediscount", percentage : percentage, actual : actual, newcharge : newcharge, status : status, staff : staff, reason : reason, visit : visit}, function(data) {
                alert(data);      
            });
            //  return false;
        }); 
    
    
    
</script>
<% }%>
</body>
</html>