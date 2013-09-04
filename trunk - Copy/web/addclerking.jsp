<%-- 
    Document   : pharmacy
    Created on : Jul 26, 2012, 8:55:54 AM
    Author     : dependable
--%>

<%@page import="helper.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*,java.util.List,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>
<% Users user = (Users) session.getAttribute("staff");
    if (user == null) {
        session.setAttribute("lasterror", "Please Login");
        response.sendRedirect("index.jsp");
    }


    HMSHelper mgr = new HMSHelper();
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="widgets/stylesheets.jsp" %>
        <script type="text/javascript">
            function submitform(){
                var name = document.getElementById("question").value;
                var answers = document.getElementsByName("ans[]");
                var answer = "";
                   
                for(var i=0;i<answers.length;i++){
                    if(answers[i].value !=""){
                        answer = answer+answers[i].value+"-";
                        // alert(answers[i]);
                    }
                } 
              
                // var con = confirm("Are You Sure You Want Delete This Item");
                //alert(answer);
                
                //alert(answer);
                if(answer == ""){
                    var con = confirm("This clerking question has no answers do want to continue to save"); 
                    if (con ==true)
                    {
                        var name = document.getElementById("question").value;
                        var beds = document.getElementById("ans").value;
                        //  alert(name);
                        $.post('action/clerkingaction.jsp', { action : "clerking", name : name, anss : answer}, function(data) {
                            alert("Exam Question Saved Successfully");
                            location.reload();
                           
                            $('#results').html(data).hide().slideDown('slow');
                        } );
                    }else{
                        alert("Saving Cancelled!");
                    }
                }else{
                    var name = document.getElementById("question").value;
                    var beds = document.getElementById("ans").value;
                    //  alert(name);
                    $.post('action/clerkingaction.jsp', { action : "clerking", name : name, anss : answer}, function(data) {
                        alert(data);
                        location.reload();
                        $('#results').html(data).hide().slideDown('slow');
                    } );
                }
                    
               
            }
            
            function updateUnit(id,name){
                
                
                var question = document.getElementById(name).value;
                var uid = document.getElementById(id).value;
                $.post('action/clerkingaction.jsp', { action : "edit", uname : question, uid : uid}, function(data) {
                    alert(data);
                    location.reload();
                    $('#results').html(data).hide().slideDown('slow');
                } );
            }
            
            function deleteUnit(id){
                var id = document.getElementById(id).value;
                // var roledescription = document.getElementById("roledescription").value;
                var con = confirm("Are You Sure You Want Delete This Item");
                
                if (con ==true)
                {
                    $.post('action/clerkingaction.jsp', { action : "delete", id : id}, function(data) {
                        alert("Deleted Successfully");
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
            <header  class="jumbotron subhead" id="overview">

                <div style="margin-top: 20px; margin-bottom: -50px;" class="subnav navbar-fixed-top hide">
                    <ul class="nav nav-pills">

                        <li>
                            <a href="adminpanel.jsp">Admin Panel</a><span class="divider"></span>
                        </li>
                        <li class="active">
                            <a href="#">Examination</a><span class="divider"></span>
                        </li>

                    </ul>
                </div>

            </header>

            <%@include file="widgets/loading.jsp" %>

            <section style="margin-top: -30px;" id="dashboard">

                <!-- Headings & Paragraph Copy -->
                <%if (session.getAttribute("lasterror") != null) {%>
                <div style="width: 100%" class="alert  <%=session.getAttribute("class")%> center">
                    <b> <%=session.getAttribute("lasterror")%>  </b>
                </div>

                <div style="margin-bottom: 20px;" class="clearfix"></div>
                <%session.removeAttribute("lasterror");
                    }%>
                <div class="row">

                    <%

                        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();


                        List itmss = mgr.listClerkQuestions();




                    %>     
                    <%@include file="widgets/adminpanelleftsidebar.jsp" %>
                    <div style="margin-top: 0px; "class="span12 offset3 content1 hide">

                        <div style="padding-bottom: 80px;" class="span9 thumbnail well content">
                            <ul style="margin-left: 0px; padding-bottom: 15px;" class="breadcrumb">
                                <li>
                                    <h4>Examination Questions</h4>
                                </li>

                                <li class="pull-right">
                                    <a href="#" class="dialog_link btn">

                                        <i class="icon-plus-sign"></i> New Examination Question
                                    </a>

                                </li>

                            </ul>
                            <table class="example display">
                                <thead>
                                    <tr>
                                        <th>
                                            Examination  Question 
                                        </th>
                                       
                                        <th>
                                            Possible Answers
                                        </th>

                                        <th></th><th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < itmss.size(); i++) {
                                            Clerkingquestion clerkingQuestion = (Clerkingquestion) itmss.get(i);
                                    %>
                                    <tr>
                                        <td>
                                            <a style="font-size: large" href="#" > <%=clerkingQuestion.getQuestion()%> ? </a> 
                                        </td>

                                      
                                        <td>
                                            <% if (clerkingQuestion != null) {%>
                                            <table class="table" style="padding: 0px; margin: 0px;">
                                                <%

                                                    List myAnswers = mgr.listClerkAnswersByQuestionid(clerkingQuestion.getClerkid());
                                                    for (int j = 0; j < myAnswers.size(); j++) {
                                                        Clerkinganswer clerkingAnswer = (Clerkinganswer) myAnswers.get(j);
                                                %>

                                                <tr > 
                                                    <td><b> <%= j + 1%>) </b> <%=clerkingAnswer.getAnswer()%> </td>
                                                </tr>
                                                <% }%>


                                            </table>
                                            <% }%>
                                        </td>


                                        <td style="padding: 0px; margin: 0px;">
                                            <button class="btn btn-inverse btn-small" id="<%=clerkingQuestion.getClerkid()%>_link">
                                                <i class="icon-edit icon-white"> </i> Edit 
                                            </button>
                                            <div style="display: none;" id="<%=clerkingQuestion.getClerkid()%>_dialog" title="Editing Question: <%=clerkingQuestion.getQuestion()%>">
                                                <form id="addclerking<%=clerkingQuestion.getClerkid()%>" class="form-horizontal" action="action/clerkingaction.jsp" method="post" onsubmit="return validateForm();" name="items" >

                                                    <fieldset>

                                                        <div class="control-group">
                                                            <label class="control-label" for="input01"> Question: </label>
                                                            <div class="controls">
                                                                <input class="input-xlarge" type="hidden" name="" value="id_<%=clerkingQuestion.getClerkid()%>">
                                                                <textarea style="width: 95%" name="name" id="question_<%=clerkingQuestion.getClerkid()%>"><%=clerkingQuestion.getQuestion()%> </textarea>
                                                                <p class="help-block"></p>
                                                            </div>
                                                        </div>
                                                        <ul style="margin-left: 0px;" class="breadcrumb">
                                                            <li><a>
                                                                    Examination Possible Answers
                                                                </a>
                                                            </li>
                                                        </ul>
                                                        <!--table>
                                                            <tbody-->
                                                        <%
                                                            List myAnswers2 = mgr.listClerkAnswersByQuestionid(clerkingQuestion.getClerkid());
                                                            for (int k = 0; k < myAnswers2.size(); k++) {
                                                                Clerkinganswer clerkingAnswer2 = (Clerkinganswer) myAnswers2.get(k);
                                                        %>

                                                        <!--tr>
                                                            <td-->
                                                        <div class="control-group">
                                                            <label class="control-label" for="input01">Answer <%=k + 1%></label>
                                                            <div class="controls">
                                                                <input class="input-xlarge" type="text" name="ans[]" value="<%=clerkingAnswer2.getAnswer()%>" id="ans" readonly="readonly">
                                                                <p class="help-block"></p>
                                                            </div>
                                                        </div>
                                                        <!--/td>
                                                        <td> <button class="btn btn-inverse btn-small" id="link_<%=clerkingAnswer2.getAnswerid()%>">
                                                                <i class="icon-edit icon-white"> </i> Edit 
                                                            </button></td>
                                                        <td> <button class="btn btn-danger btn-small" style="margin-top: 15px;" type="submit" name="action" value="units" onclick='deleteUnit("id_<%=clerkingQuestion.getClerkid()%>");return false;'>
                                                                <i class="icon-remove icon-white"> </i> Delete  
                                                            </button></td>
                                                    <tr-->
                                                        <% }%>
                                                        <!--tbody>
                                                    </table-->
                                                        <div class="form-actions">
                                                            <button class="btn btn-info"  onclick='updateUnit("id_<%=clerkingQuestion.getClerkid()%>","question_<%=clerkingQuestion.getClerkid()%>");return false;'>
                                                                <i class="icon-plus-sign icon-white"> </i> Save Changes 
                                                            </button>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </td>

                                        <td style="padding: 0px; margin: 0px;">
                                            <form style="padding: 0px; margin: 0px;" action="action/unitaction.jsp" method="post">
                                                <input type="hidden" id="id_<%=clerkingQuestion.getClerkid()%>" value="<%=clerkingQuestion.getClerkid()%>"/> 
                                                <button class="btn btn-danger btn-small" type="submit" name="action" value="units" onclick='deleteUnit("id_<%=clerkingQuestion.getClerkid()%>");return false;'>
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
                <div style="display: none;" id="dialog" title="New Examination Question">



                    <form id="addclerking" class="form-horizontal" action="action/clerkingaction.jsp" method="post" onsubmit="return validateForm();" name="items" >

                        <fieldset>

                            <div class="control-group">
                                <label class="control-label" for="input01"> Question: </label>
                                <div class="controls">

                                    <textarea style="width: 95%" name="name" id="question"></textarea>
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <ul style="margin-left: 0px;" class="breadcrumb">
                                <li><a>
                                        Examination Possible Answers
                                    </a>
                                </li>
                            </ul>
                            <div class="control-group">
                                <label class="control-label" for="input01">Answer 1</label>
                                <div class="controls">
                                    <input class="input-xlarge" type="text" name="ans[]" id="ans">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Answer 2</label>
                                <div class="controls">
                                    <input class="input-xlarge" type="text" name="ans[]" id="ans">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Answer 3</label>
                                <div class="controls">
                                    <input class="input-xlarge" type="text" name="ans[]" id="ans">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Answer 4</label>
                                <div class="controls">
                                    <input class="input-xlarge" type="text" name="ans[]" id="ans">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="input01">Answer 5</label>
                                <div class="controls">
                                    <input class="input-xlarge" type="text" name="ans[]" id="ans">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="form-actions">

                                <button class="btn btn-info"  onclick='submitform();return false;'>
                                    <i class="icon-plus-sign icon-white"> </i> Save Question 
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
<script type="text/javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/tablecloth.js"></script>
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
        
        
        $('#addclerking').validate({
            rules: {
                name: {
                    minlength: 2,
                    required: true
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
        });

    });
    
    
    
    function validateForm()
    {
        var x=document.forms["items"]["name"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }
        
        /*var x=document.forms["items"]["beds"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }
        
        var x=document.forms["edit"]["uname"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }
        
        var x=document.forms["edit"]["ubeds"].value;
        if (x==null || x=="")
        {
            // alert("Item must be filled out");
            return false;
        }*/
        
        return true;
    }

    function todaysdate()
    {
        var currentDate = new Date()
        var day = currentDate.getDate()
        var month = currentDate.getMonth() + 1
        var year = currentDate.getFullYear()
        var dat=(" " + year + "-" + month + "-" + day )
        //document.write(dat)
        // alert("Todays Date is "+dat)
        return dat; 
   
 
    }
</script>
<% for (int i = 0;
            i < itmss.size();
            i++) {
        Clerkingquestion vst = (Clerkingquestion) itmss.get(i);
%>


<script type="text/javascript">
   
                      
    $("#<%= vst.getClerkid()%>_dialog").dialog({
        autoOpen : false,
        width : 500,
        modal :true

    });
    
    $("#<%= vst.getClerkid()%>_adddrug_dialog").dialog({
        autoOpen : false,
        width : 500,
        modal :true

    });
    
   
    
    $("#<%= vst.getClerkid()%>_link").click(function(){
      
        $("#<%=vst.getClerkid()%>_dialog").dialog('open');
    
    })
  
    
    $("#<%= vst.getClerkid()%>_adddrug_link").click(function(){
        alert("");
        $("#<%=vst.getClerkid()%>_adddrug_dialog").dialog('open');
        
    })
   
    
</script>



<% }%>
</body>
</html>