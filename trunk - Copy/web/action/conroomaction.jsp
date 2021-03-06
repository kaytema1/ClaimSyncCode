<%-- 
    Document   : sponsoraction
    Created on : Mar 30, 2012, 11:54:06 PM
    Author     : Arnold Isaac McSey
--%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        Users user = (Users) session.getAttribute("staff");
        if (user == null) {
            session.setAttribute("lasterror", "Please Login");
            response.sendRedirect("index.jsp");
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        if ("addcons".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("name");
            HMSHelper mgr = new HMSHelper();
            Consultingrooms conroom = null;
            conroom = mgr.addConRoom(unitName);
            session.setAttribute("lasterror", "Consulting Room Added Successfully");
            session.setAttribute("class", "alert-success");
            response.sendRedirect("../addconsultingroom.jsp");
            out.print("Consulting Room Added Successfully");
            return;
        }
        if ("edit".equals(request.getParameter("action"))) {
            String conname = request.getParameter("uname");
            if (conname.equalsIgnoreCase("")) {
                out.println("Name field Cannot be empty");
                return;
            }
            String conid = request.getParameter("uid");
            HMSHelper mgr = new HMSHelper();
            Consultingrooms conroom = null;
            conroom = mgr.updateConroon(Integer.parseInt(conid), conname);
            session.setAttribute("lasterror", "Consulting Room Edited Successfully");
            session.setAttribute("class", "alert-success");
            response.sendRedirect("../addconsultingroom.jsp");
            out.print("Consultation room updated successfully");
            return;
        }
        if ("delete".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("id");
            HMSHelper mgr = new HMSHelper();
            Consultingrooms conroom = null;
            conroom = mgr.deleteConroom(Integer.parseInt(unitName));
            session.setAttribute("lasterror", "Consulting Room Deleted Successfully");
            session.setAttribute("class", "alert-success");
            response.sendRedirect("../addconsultingroom.jsp");
            out.print("Consultation room deleted successfully");
            
            return;
        }
        if ("addconcharges".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("name");
            String amount = request.getParameter("amount");
            HMSHelper mgr = new HMSHelper();
            Consultation conroom = null;
            try {
                conroom = mgr.addConsultation(unitName, Double.parseDouble(amount));
            } catch (NumberFormatException e) {
                out.print("Require a number");
            }
            session.setAttribute("lasterror", "Consultation Fee Added Successfully");
            session.setAttribute("class", "alert-success");
            response.sendRedirect("../addconcharges.jsp");
            out.print("Condsultation type and Amount added successfully");
            return;
        }
        if ("editcon".equals(request.getParameter("action"))) {
            String uname = request.getParameter("uname");
            String uid = request.getParameter("uid");
            String uamount = request.getParameter("uamount");
            HMSHelper mgr = new HMSHelper();
            Consultation conroom = null;
            try {
                conroom = mgr.updateConsultation(Integer.parseInt(uid), uname, Double.parseDouble(uamount));
            } catch (NumberFormatException e) {
                out.print("Require a number");
            }
            session.setAttribute("lasterror", "Consultation Fee Edited Successfully");
            session.setAttribute("class", "alert-success");
            response.sendRedirect("../addconcharges.jsp");
            out.print("Type and Amount Updated successfully");
            return;
        }
        if ("deletecon".equals(request.getParameter("action"))) {
            String unitName = request.getParameter("id");
            HMSHelper mgr = new HMSHelper();
            Consultation conroom = null;
            conroom = mgr.deleteConsultation(Integer.parseInt(unitName));
            session.setAttribute("lasterror", "Consultation Fee Deleted Successfully");
            session.setAttribute("class", "alert-success");
            response.sendRedirect("../addconcharges.jsp");
            out.print("Type deleted successfully");
            return;
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        out.print("Consultation room could not be added please try again");
        return;
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }%>