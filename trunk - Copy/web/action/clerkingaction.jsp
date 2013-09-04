<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="java.util.List"%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        Users user = (Users) session.getAttribute("staff");
        if (user == null) {
            session.setAttribute("lasterror", "Please Login");
            session.setAttribute("class", "alert-error");
            response.sendRedirect("index.jsp");
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
        int questionid = 0;
        if ("clerking".equals(request.getParameter("action"))) {
            String question = null;
            String answers = "";
            HMSHelper mgr = new HMSHelper();

            try {
                question = request.getParameter("name");

            } catch (NullPointerException e) {
                out.print("Question field cannot be empty");
                return;

            }
            Clerkingquestion clerkingquestion = mgr.addClerkingQuestion(question, 0);
            answers = request.getParameter("anss") == null ? "" : request.getParameter("anss");

            if (!answers.equalsIgnoreCase("")) {
                String[] ans = answers.split("-");
                for (int i = 0; i < ans.length; i++) {
                    Clerkinganswer clerkinganswer = mgr.addClerkingAnswer(ans[i], clerkingquestion.getClerkid());

                }
                // out.print(ans);
            }
            out.print("Clerking Question Saved Successfully");
            return;
        }
        if ("edit".equals(request.getParameter("action"))) {
            String wardName = null;
            int wardid = -1;
            try {
                wardName = request.getParameter("uname");
                wardid = Integer.parseInt(request.getParameter("uid"));
            } catch (NumberFormatException e) {
                out.print("Empty fields not allowed");
                return;
            } catch (NullPointerException e) {
                out.print("There is a problem please try again");
                return;
            }
            HMSHelper mgr = new HMSHelper();
            Clerkingquestion ward = null;
            ward = mgr.updateClerking(wardid, wardName);
            out.print("Clerking Question Edited Successfully");
            return;
        }
        if ("delete".equals(request.getParameter("action"))) {

            int wardid = -1;

            try {

                wardid = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException e) {
                out.print("There is a problem please try again");
                return;

            } catch (NullPointerException e) {
                out.print("There is a problem please try again");
                return;
            }

            //String registrationDate = request.getParameter("dor");

            HMSHelper mgr = new HMSHelper();
            Clerkingquestion ward = null;
            ward = mgr.deleteClerking(wardid);
            questionid = ward.getClerkid();
            List l = mgr.listClerkAnswersByQuestionid(questionid);
            for (int r = 0; r < l.size(); r++) {
                Clerkinganswer clerkinganswer = (Clerkinganswer) l.get(r);
                mgr.deleteAnswer(clerkinganswer.getAnswerid());
            }
            out.print("Clerking Deleted Successfully");
            return;
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        response.sendRedirect("../addclerking.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>