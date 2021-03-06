<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="helper.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE html>
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        response.sendRedirect("index.jsp");
    }
    HMSHelper mgr = new HMSHelper();%>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <script type="text/javascript">
            function submitform(){
              
                var name = document.getElementById("name").value;
                
                // alert(name);
                $.post('action/conroomaction.jsp', { action : "consulting", name : name}, function(data) {
                    location.reload();
                    //alert(data);
                    
                    $('#results').html(data).hide().slideDown('slow');
                } 
            );
                
            }
            
            function updateUnit(id,name){
                
                var uname = document.getElementById(name).value;
                var uid = document.getElementById(id).value;
                
                $.post('action/conroomaction.jsp', { action : "edit", uname : uname, uid : uid}, function(data) {
                    //alert(data);
                    location.reload();
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            
            function deleteUnit(id){
                var id = document.getElementById(id).value;
                // var roledescription = document.getElementById("roledescription").value;
                var con = confirm("Are You Sure You Want To Delete This Item");
                if (con ==true)
                {
                    $.post('action/conroomaction.jsp', { action : "delete", id : id}, function(data) {
                        //alert(data);
                        location.reload();
                        $('#results').html(data).hide().slideDown('slow');
                    } );
                }
                else 
                {
                    alert("Delete Was Cancelled!");
                    //return;
                }
                
            }
        </script>
    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->

            <%if (session.getAttribute("lasterror") != null) {%>
            <div style="width: 100%" class="alert  <%=session.getAttribute("class")%> center">
                <b> <%=session.getAttribute("lasterror")%>  </b>
            </div>

            <div style="margin-bottom: 20px;" class="clearfix"></div>
            <%session.removeAttribute("lasterror");
                }%>
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">
                        <li>
                            <a href="adminpanel.jsp">Admin Panel</a><span class="divider"></span>
                        </li>
                        <li class="active">
                            <a href="#">Consultation Room Management</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            <%@include file="widgets/loading.jsp" %>

            <section style="margin-top: -30px;" id="dashboard">
                <%if (session.getAttribute("lasterror") != null) {%>
                <div style="width: 100%" class="alert  <%=session.getAttribute("class")%> center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>

                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                }%>
                <!-- Headings & Paragraph Copy -->
                <div class="row">

                    <%

                        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

                        // HMSHelper mgr = new HMSHelper();

                        List itmss = mgr.listConRooms();
                    %>     
                    <%@include file="widgets/adminpanelleftsidebar.jsp" %>
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">
                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px;padding-bottom: 15px;" class="breadcrumb">
                                <li style="padding-top: 10px; font-size: 14px; font-weight: bold">
                                    <a>Consultation Rooms</a>
                                </li>
                                <li class="pull-right">
                                    <a href="#" class="dialog_link btn">

                                        <i class="icon-plus-sign"></i> New Consultation Room
                                    </a>

                                </li>

                            </ul>

                            <table class="example display table">
                                <thead>
                                    <tr>
                                        <th style="text-align: left;">
                                            Consultation Room Name 
                                        </th>
                                        <th></th><th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < itmss.size(); i++) {
                                            Consultingrooms unit = (Consultingrooms) itmss.get(i);
                                    %>
                                    <tr>
                                        <td style="text-transform: capitalize; color: #4183C4; font-weight: bold;">

                                            <%=unit.getConsultingroom()%>
                                        </td>

                                        <td style="text-align: center;">
                                            <button class="btn btn-small btn-inverse" id="<%=unit.getConsultingroomid()%>_link">
                                                <i class="icon-edit icon-white"> </i> Edit 
                                            </button>
                                            <div style="display: none;" id="<%=unit.getConsultingroomid()%>_dialog" title="Editing <%=unit.getConsultingroom()%>">
                                                <form id="addconsultingroom<%=unit.getConsultingroomid()%>" class="form-horizontal" action="action/conroomaction.jsp" method="post" onsubmit="return validateForm();" name="edit">
                                                    <div class="control-group">
                                                        <label class="control-label" for="input01">Room Name: </label>
                                                        <div class="controls">
                                                            <input type="text" class="input-medium" name="uname" id="nameunit_<%=unit.getConsultingroomid()%>" value="<%=unit.getConsultingroom()%>">
                                                            <input type="hidden" name="uid" id="unitid_<%=unit.getConsultingroomid()%>" value="<%=unit.getConsultingroomid()%>">
                                                            <p class="help-block"></p>
                                                        </div>
                                                    </div>

                                                    <div class="form-actions">

                                                        <button class="btn btn-inverse" type="submit" name="action" value="edit" >
                                                            <i class="icon-edit icon-white"> </i> Update Changes 
                                                        </button>

                                                    </div>

                                                </form> 
                                            </div>
                                        </td>

                                        <td style="text-align: center;">
                                            <form style="padding: 0px; margin: 0px;" class="form-horizontal" action="action/unitaction.jsp" method="post">
                                                <input type="hidden" id="id_<%=unit.getConsultingroomid()%>" value="<%=unit.getConsultingroomid()%>"/> 

                                                <button class="btn btn-danger btn-small" type="submit" name="action" value="units" onclick='deleteUnit("id_<%=unit.getConsultingroomid()%>");return false;'>
                                                    <i class="icon-remove icon-white"> </i> Delete  
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>



                        </div>

                    </div>
                    <div class="clearfix"></div>

                </div>
                <div style="display: none;" id="dialog" title="New Consulting Room">
                    <form id="addconsultingroom" class="form-horizontal" action="action/conroomaction.jsp" method="post"  name="items" >

                        <fieldset>

                            <div class="control-group">
                                <label class="control-label" for="input01">  Room Name: </label>
                                <div class="controls">
                                    <input type="text" name="name" id="name">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="form-actions">

                                <button class="btn btn-info " name="action" value="addcons">
                                    <i class="icon-plus-sign icon-white"> </i> New Consultation Room 
                                </button>

                            </div>
                        </fieldset>
                    </form>

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
<script src="js/jquery.validate.min.js"></script>

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
    $(function() {

        var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

        menu_ul.hide();

        $(".menu").fadeIn();
        $(".content1").fadeIn();
        $(".navbar").fadeIn();
        $(".footer").fadeIn();
        $(".subnav").fadeIn();
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
            "sScrollY" : "350px",
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "aaSorting" : [],
            "bSort" : true

        });

    });
    
    $(document).ready(function(){
        
        
        $('#addconsultingroom').validate({
                            
            rules: {
                name: {
                    required: true,
                    minlength : 2
                                    
                }
                
            },
            highlight: function(label) {
                $(label).closest('.control-group').addClass('error');
            },
            success: function(label) {
                label
                .text('OK!').addClass('valid')
                .closest('.control-group').addClass('success');
            }
        })
        
        
    })
</script>
<% for (int i = 0;
            i < itmss.size();
            i++) {
        Consultingrooms vst = (Consultingrooms) itmss.get(i);
%>


<script type="text/javascript">
   
    $(document).ready(function(){
        
        
        $('#addconsultingroom<%= vst.getConsultingroomid()%>').validate({
                            
            rules: {
                uname: {
                    required: true,
                    minlength : 2
                                    
                }
                
            },
            highlight: function(label) {
                $(label).closest('.control-group').addClass('error');
            },
            success: function(label) {
                label
                .text('OK!').addClass('valid')
                .closest('.control-group').addClass('success');
            }
        })
        
        
    })     
    $("#<%= vst.getConsultingroomid()%>_dialog").dialog({
        autoOpen : false,
        width : 500,
        modal :true

    });
    
    $("#<%= vst.getConsultingroomid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= vst.getConsultingroomid()%>_link").click(function(){
      
        $("#<%=vst.getConsultingroomid()%>_dialog").dialog('open');
    
    })
  
    
    $("#<%= vst.getConsultingroomid()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getConsultingroomid()%>_adddrug_dialog").dialog('open');
        
    })
   
    
</script>

<% }%>
</body>
</html>