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
            if(user == null){
                session.setAttribute("lasterror", "Please Login");
                response.sendRedirect("index.jsp");
            }ExtendedHMSHelper mgr = new ExtendedHMSHelper(); %>
<html>
    <head>
        <meta charset="utf-8">
        <title>ClaimSync Extended</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Le styles -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link type="text/css" href="css/custom-theme/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
        <link href="css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css">
        <style type="text/css" title="currentStyle">
            @import "css/jquery.dataTables_themeroller.css";
            @import "css/custom-theme/jquery-ui-1.8.16.custom.css";
            body {
                   overflow: hidden; 
            }

            .large_button {
                background-color: #35AFE3;
                background-image: -moz-linear-gradient(center top , #45C7EB, #2698DB);
                box-shadow: 0 1px 0 0 #6AD2EF inset;
                color: #FFFFFF;
                text-decoration: none;
                font-weight: lighter;
                font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                font-size: 36px;
            }

            .large_button:hover {
                background-color: #FBFBFB;
                background-image: -moz-linear-gradient(center top , #FFFFFF, #F5F5F5);
                background-repeat: repeat-x;
                border: 1px solid #DDDDDD;
                border-radius: 3px 3px 3px 3px;
                box-shadow: 0 1px 0 #FFFFFF inset;
                list-style: none outside none;
                color: #777777;
                /* padding: 7px 14px; */
            }
        </style>

        <link href="css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

        <%
            HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

                        //HMSHelper mgr = new HMSHelper();

                        List itmss = mgr.CheckItems();
          
%>
    </head>

    <body data-spy="scroll" data-target=".subnav" data-offset="50">

        <%@include file="widgets/header.jsp" %>

        <div class="container-fluid">

            <!-- Masthead
            ================================================== -->
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li class="active">
                            <a href="#">Items Close to Expiry</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            
            <%@include file="widgets/loading.jsp" %>
            

            <section style="margin-top: -30px;" id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <div class="row">

                  
                    <%@include file="widgets/leftsidebar.jsp" %>

                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            
                            <table class="example display">
                                <thead>
                                     <tr>
                                         <th>Items Id</th>
                                         <th>Items</th>
                                         <th>Quantity</th>
                                         <th>Price</th>
                                         <th>Entry Date</th>
                                         <th>Expiring Date</th>
                                         <th>Edit</th>
                                         <th>Delete</th>
                                     </tr>
                                </thead>
                                <tbody>
                                    <%   for (int i = 0; i < itmss.size(); i++) {
                            ItemsTable itt = (ItemsTable) itmss.get(i);

                                    %>
                                    <tr>
                                        <td>
                                            <div class="dialog" id="<%=itt.getBatchNumber()%>_dialog" title="Edit Item">

                                                <div class="well thumbnail">
                                                    <ul style="margin-left: 0px;" class="breadcrumb">
                                                        <li>
                                                            <span class="divider"></span> Edit Item
                                                        </li>    
                                                    </ul>
                                                    <form action="action/forwardaction.jsp" method="post">
                                                        <table class="table example display">
                                                            <thead>
                                                                <tr style="color: #000;">
                                                                    <th> Drug </th>
                                                                    <th> Type </th>
                                                                    <th> Dosage </th>

                                                                    <th> Quantity</th>                                                                
                                                                    <th> Unit Cost </th>
                                                                    <th> Total </th>
                                                                    <th> Dispensed</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                             

                                                            </tbody>

                                                        </table>

                                                        <div style="text-align: center;" class="form-actions">

                                                            <input type="hidden" name="unitid" value="Accounts"/>
                                                            <input type="hidden" name="patient" value="<%=itt.getBatchNumber()%>"/>
                                                            <input type="hidden" name="visitid" value="<%=itt.getBatchNumber()%>"/>
                                                            <!-- <input type="submit" name="action" value="it to Accounts"/>-->
                                                            <button class="btn btn-info" name="action" value="Forward to Accounts">
                                                                <i class="icon-white icon-check"></i> Forward to Accounts
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td class="patient" rel="popover" data-original-title="<span style='text-align:center;'> <h3>Supplier </h3> <h5><%=itt.getSupplier() %></h5> <h5><b> Remaining Quantity :</b> <%=itt.getQuantity()%> </td> </tr>  </table> "> <%=itt.getBatchNumber()%></td>
                                        <td><%=mgr.getStockItem(itt.getCode()).getDescription() %></td>
                                        <td><%=itt.getQuantity()%> </td>

                                      
                                        <td><%=itt.getPurchasingprice() %>   </td>

                                        <td><%=itt.getLocationId() %> </td>
                                        <td><%=itt.getExpiryDate()%> </td>
                                       
                                        <td>
                                            
                                             <td>
                                            <button class="btn btn-danger btn-small" id="<%=itt.getBatchNumber()%>_update">
                                                <i class="icon-white icon-remove"></i> Delete
                                            </button></td>
                                            
                                    </tr>
                                    <%}%> 

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

    });

</script>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function() {
        $('.example').dataTable({
            "bJQueryUI" : true,
            "sScrollY" : "400px",
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "aaSorting" : [],
            "bSort" : true

        });
            
            

        $(".patient").popover({

            placement : 'right',
            animation : true

        });

    });

</script>
<% for (int i = 0;
            i < itmss.size();
            i++) {
         ItemsTable itt = (ItemsTable) itmss.get(i);;
%>


<script type="text/javascript">
   
                      
    $("#<%= itt.getBatchNumber()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
    $("#<%= itt.getBatchNumber()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= itt.getBatchNumber()%>_link").click(function(){
      
        $("#<%=itt.getBatchNumber()%>_dialog").dialog('open');
    
    })
   
    $("#<%= itt.getBatchNumber()%>_dialog").dialog({
        autoOpen : false,
        width : 1000,
        modal :true

    });
    
   
    
    $("#<%= itt.getBatchNumber()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=itt.getBatchNumber()%>_adddrug_dialog").dialog('open');
        
    })
   
   
            function editRecord(item_id){
                var f=document.form;
                f.method="post";
                f.action='edit_items.jsp?item_id='+item_id;
                f.submit();
            }
            function deleteRecord(id){
                var f=document.form;
                f.method="post";
                f.action='delete.jsp?id='+id;
                f.submit();
            }

            function show_confirm()
            {
                var con = confirm("Are You Sure You Want Delete This Item");
                if (con ==true)
                {
   
                      
                    alert("Delete Was Successfull!");
                }
                else 
                {
                    alert("Delete Was Cancled!");
                }
            }


</script>

<% }%>

</body>
</html>
