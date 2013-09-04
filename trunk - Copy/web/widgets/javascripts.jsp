<%@page import="entities.Vitalcheck"%>
<%@page import="java.util.List"%>
<%@page import="entities.ExtendedHMSHelper"%>
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
<script src="js/jquery.select-to-autocomplete.js"></script>
<script src="js/jquery.select-to-autocomplete.min.js"></script>

<script type="text/javascript" src="js/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/date.js"></script>

<script type="text/javascript" src="third-party/jQuery-UI-Date-Range-Picker/js/daterangepicker.jQuery.js"></script>
<script src="third-party/wijmo/jquery.mousewheel.min.js" type="text/javascript"></script>

<script src="third-party/wijmo/jquery.bgiframe-2.1.3-pre.js" type="text/javascript"></script>
<script src="third-party/wijmo/jquery.wijmo-open.1.5.0.min.js" type="text/javascript"></script>

<script src="third-party/jQuery-UI-FileInput/js/enhance.min.js" type="text/javascript"></script>
<script src="third-party/jQuery-UI-FileInput/js/fileinput.jquery.js" type="text/javascript"></script>

<script type="text/javascript" src="js/tablecloth.js"></script>   
<script type="text/javascript" src="js/demo.js"></script>    
<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/jquery.numeric.js"></script>
<script type="text/javascript" src="js/jquery.filter_input.js"></script>
<!--initiate accordion-->


<script type="text/javascript">
    
    
     
    
    
    $(function() {
       
        var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');

        menu_ul.hide();
             
        $(".numeric").numeric(false, function() { alert("Integers only"); this.value = ""; this.focus(); });
        $('.decimal').live("keyup",function(){inputControl($(this),'float');});
        $('.text_input').filter_input({regex:'[a-zA-Z]'});
        $(".menu").fadeIn();
        $(".content").fadeIn();
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
         
       


    });

    function inputControl(input,format)
    {
        var value=input.val();
        var values=value.split("");
        var update="";
        var transition="";
        if (format=='int'){
            expression=/^([0-9])$/;
            finalExpression=/^([1-9][0-9]*)$/;
        }
        else if (format=='float')
        {
            var expression=/(^\d+$)|(^\d+\.\d+$)|[,\.]/;
            var finalExpression=/^([1-9][0-9]*[,\.]?\d{0,3})$/;
        }   
        for(id in values)
        {           
            if (expression.test(values[id])==true && values[id]!='')
            {
                transition+=''+values[id].replace(',','.');
                if(finalExpression.test(transition)==true)
                {
                    update+=''+values[id].replace(',','.');
                }
            }
        }
        input.val(update);
    }
    $(document).ready(function() {
     
        $('.select').selectToAutocomplete();
        $('.example').dataTable({
            "bJQueryUI" : true,
            "sScrollY": "400px",
            "sPaginationType" : "full_numbers",
            "iDisplayLength" : 25,
            "aaSorting" : [],
            "bSort" : true
            

        });
        
        $(':input').attr('autocomplete', 'off');
        
       // var forms = $("form");
        //forms.each(function(i) {
        //    i.attr('autocomplete', 'off');
        //});
            
        
        var currentValue = "";
        $("#addSup").click(function(){
            currentValue = $("#nonexistantsource").attr("value");
            if(currentValue != ""){ 
            
                $("#nonexistant").val($("#nonexistant").val() + currentValue + ', ');
                $("#tbody").append("<tr> <td>"+currentValue+"</td><td> </td></tr>")
           
                currentValue = $("#nonexistantsource").attr("value","");
            }
            
        });

        $(".continue").click(function() {

            $(".first_half").slideUp();

            $(".second_half").slideDown();

            $(".pre_first_half").find("div").addClass("success");

        });
       

        $(".proceed").click(function() {

            $(".second_half").slideUp();

            $(".third_half").slideDown();

        });

        $(".back").click(function() {

            $(".first_half").slideDown();

            $(".second_half").slideUp();

            $(".third_half").slideUp();

            $(".pre_first_half").find("div").removeClass("success");

        });

        $(".previous").click(function() {

            $(".second_half").slideDown();

            $(".third_half").slideUp();

            $(".first_half").slideUp();
        });

        $('.close_dialog').click(function() {

            $('#dialog').dialog('close');

        });

        $(".patient").popover({

            placement : 'right',
            animation : true

        });

        $(".patient_visit").popover({

            placement : 'top',
            animation : true

        });

        $(".btn").tooltip({

            placement : 'bottom',
            animation : true

        });

        $(".update_sponsor").click(function() {
            $(".sponsor_panel").slideToggle();
            $(".vitals_panel").slideUp();
            $(".history_panel").slideUp();
        });

        $(".update_vitals").click(function() {
            $(".sponsor_panel").slideUp();
            $(".vitals_panel").slideToggle();
            $(".history_panel").slideUp();
        });

        $(".update_history").click(function() {
            $(".sponsor_panel").slideUp();
            $(".vitals_panel").slideUp();
            $(".history_panel").slideToggle();
        });
        
        $(".slideup").click(function() {
            $(".sponsor_panel").slideUp();
            $(".vitals_panel").slideUp();
            $(".history_panel").slideUp();      
        })
            
        $("#sponsor").change(function(){
                
                
            if ($('#sponsor').attr('value')!="Select"){
                $('#sponsor').closest('.control-group').addClass('success').removeClass('error')
            }else{
                $('#sponsor').closest('.control-group').addClass('error').removeClass('success')
            }
           
        });
            
            
        $(".dob").change(function(){
                
                
            if (($('#day').attr('value')!="D") && ($('#month').attr('value')!="M") && ($('#year').attr('value')!="Y")){
                $('#year').closest('.control-group').addClass('success').removeClass('error')
            }else{
                $('#year').closest('.control-group').addClass('error').removeClass('success')
            }
           
        });
                
                
        $(".updatebilling").click(function(){
            $(".updatebillingdiv").slideToggle("slow");
        })
     
    });
    function updateView() {
                
        var str = document.getElementById("unitid").value;

        if (str=="")
        {
            document.getElementById("tt").innerHTML="";
            return;
        } 
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            { 
                if(xmlhttp.responseText > 0){
                    alert("successful")
                }else{
                    alert("successful")
                }
                       
            }
        }
        xmlhttp.open("GET","action/forward.jsp?action=forward.jsp&unitid="+str,true);
        xmlhttp.send();
            
    }
       	
           
</script>