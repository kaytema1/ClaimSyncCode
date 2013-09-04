<%-- 
    Document   : labnpharmactions
    Created on : Jun 21, 2012, 8:23:35 PM
    Author     : Arnold Isaac McSey
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="entities.*,helper.HibernateUtil" %>
<% try {
        Users user = (Users) session.getAttribute("staff");
        if (user == null) {
            session.setAttribute("lasterror", "Please Login");
            response.sendRedirect("index.jsp");
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();

        Date dt = new Date();
        DateFormat ft;
        ft = new SimpleDateFormat("yyyy-MM-dd");

        if ("Dispensary".equals(request.getParameter("action"))) {
            String codes[] = request.getParameterValues("labtest") == null ? null : request.getParameterValues("labtest");
            String[] qtys = request.getParameterValues("qty[]") == null ? null : request.getParameterValues("qty[]");
            System.out.println(codes);
            ExtendedHMSHelper mgr = new ExtendedHMSHelper();
            // String[] code = treatments
            if (codes == null || qtys == null) {
                out.print("empty");
                session.setAttribute("lasterror", "Please Try Again");
                session.setAttribute("class", "alert-error");
                response.sendRedirect("../accounts.jsp");
                return;
            }
            if (codes != null && qtys != null) {
                for (int i = 0; i < codes.length; i++) {
                    mgr.addRequisitions(codes[i], user.getStaffid(), "Dispensary", Integer.parseInt(qtys[i]));
                    out.print(codes[i] + " " + qtys[i]);
                }


                session.setAttribute("class", "alert-success");
                session.setAttribute("lasterror", "Request Created Successfully");
                response.sendRedirect("../dispensarymakerequest.jsp");
                return;
            }
        }
        if ("edititemstock".equals(request.getParameter("action"))) {
            String id = request.getParameter("id") == "" ? "" : request.getParameter("id");
            String code = request.getParameter("code") == "" ? "" : request.getParameter("code");
            String qtys = request.getParameter("qty") == "" ? "" : request.getParameter("qty");
            System.out.println(code);
            ExtendedHMSHelper mgr = new ExtendedHMSHelper();
            // String[] code = treatments
            if (code.isEmpty()) {
                out.print("Choose an item");
            }
            int qty = -1;
            int ids = -1;
            try {
                qty = Integer.parseInt(qtys);
                ids = Integer.parseInt(id);
                Requisitions requisitions = mgr.updateRequisition(ids, code, qty);
                session.setAttribute("class", "alert-success");
                session.setAttribute("lasterror", "Request Edited Successfully");
                response.sendRedirect("../dispensarymakerequest.jsp");
                out.print("Changes saved");
            } catch (NumberFormatException e) {
                out.print("Quantity field cannot be empty");
                Requisitions requisitions = mgr.updateRequisition(ids, code, qty);
                session.setAttribute("class", "alert-error");
                session.setAttribute("lasterror", "Please Complete All Fields");
                response.sendRedirect("../dispensarymakerequest.jsp");
            } catch (NullPointerException e) {
                out.print("Sorry try again");
                session.setAttribute("class", "alert-error");
                session.setAttribute("lasterror", "Please Complete All Fields");
                response.sendRedirect("../dispensarymakerequest.jsp");
            }
        }
        if ("postitem".equals(request.getParameter("action"))) {
            ExtendedHMSHelper mgr = new ExtendedHMSHelper();
            String requestid = request.getParameter("requestid") == "" ? "" : request.getParameter("requestid");
            String[] batchnumbers = request.getParameterValues("checkus[]") == null ? null : request.getParameterValues("checkus[]");
            //  String batch = request.getParameter("batch") == "" ? "" : request.getParameter("batch");
            int qty = -1;
            int ids = -1;
            int tt = 0;
            try {
                ids = Integer.parseInt(requestid);
                if (batchnumbers != null) {
                    for (int t = 0; t < batchnumbers.length; t++) {
                        out.print(batchnumbers[t]);
                        qty = Integer.parseInt(request.getParameter("quantity_" + batchnumbers[t]));
                        tt = +qty;
                        mgr.addPostedItem(ids, qty, batchnumbers[t]);

                    }
                }
                Requisitions requisitions = mgr.updateRequisition(ids, tt, user.getStaffid());
                out.print("items posted successfully");
                session.setAttribute("class", "alert-success");
                
                session.setAttribute("lasterror", "Posted Successfully");
                response.sendRedirect("../allrequests.jsp");
                return;
            } catch (NumberFormatException e) {
                out.print("Quantity field cannot be empty");
                return;
            } catch (NullPointerException e) {
                e.printStackTrace();
                out.print(ids);
            }
        }
        if ("acceptpost".equals(request.getParameter("action"))) {
            String id = request.getParameter("id") == "" ? "" : request.getParameter("id");
            String code = request.getParameter("code") == "" ? "" : request.getParameter("code");

            ExtendedHMSHelper mgr = new ExtendedHMSHelper();
            int qty = -1;
            int ids = -1;
            int qtty = 0;
            int qqty = 0;
            int intqty = 0;
            int qtyupdate = 0;
            try {
                // qty = Integer.parseInt(qtys);
                ids = Integer.parseInt(id);
                Requisitions requisitions = mgr.updateRequisition(ids);
                qtty = mgr.getStockItem(code).getQunaity();
                qqty = mgr.getRequisition(ids).getDeliveredquantity();
                qtyupdate = (qtty - qqty);
                //intqty = mgr.getTreatment(treatmentid);
                List list = mgr.listPostedItemsByRequestid(ids);
                if (list != null) {
                    for (int t = 0; t < list.size(); t++) {
                        PostedItems pi = (PostedItems) list.get(t);
                        mgr.updateItemQuantity(pi.getBatchNumber(), pi.getQunatity());
                        mgr.updateTreatmentQuantity(pi.getBatchNumber(), pi.getQunatity());
                    }
                }
                mgr.updateStockItemQuantity(code, qtyupdate);

                //mgr.updateT

                if (qtyupdate < 0) {
                    out.print("Not enough stock to deliver, you have only " + qtty + " in stock");
                    return;
                }
                mgr.getStockItem(code).setQunaity(qtyupdate);
                out.print("items received successfully");
                return;
            } catch (NumberFormatException e) {

                out.print("Some fields are empty, kindly make sure all fields are set");
            } catch (NullPointerException e) {
                e.printStackTrace();
                out.print(ids);
            }
        }
        if ("deleteitemstock".equals(request.getParameter("action"))) {
            String id = request.getParameter("id") == "" ? "" : request.getParameter("id");

            ExtendedHMSHelper mgr = new ExtendedHMSHelper();

            int ids = -1;
            try {

                ids = Integer.parseInt(id);
                Requisitions requisitions = mgr.deleteRequisition(ids);
                out.print("Deleted successfully");
            } catch (NumberFormatException e) {
                out.print("Quantity field cannot be empty");
            } catch (NullPointerException e) {
                e.printStackTrace();
                out.print("Sorry try again");
            }
        }
        if ("canceldelivery".equals(request.getParameter("action"))) {
            String id = request.getParameter("id") == "" ? "" : request.getParameter("id");

            ExtendedHMSHelper mgr = new ExtendedHMSHelper();

            int ids = -1;
            try {

                ids = Integer.parseInt(id);
                Requisitions requisitions = mgr.cancelRequisition(ids);
                out.print("Cancelled successfully");
            } catch (NumberFormatException e) {
                out.print("Quantity field cannot be empty");
            } catch (NullPointerException e) {
                e.printStackTrace();
                out.print("Sorry try again");
            }
        }
        if ("delpost".equals(request.getParameter("action"))) {
            String id = request.getParameter("id") == "" ? "" : request.getParameter("id");

            ExtendedHMSHelper mgr = new ExtendedHMSHelper();

            int ids = -1;
            try {

                ids = Integer.parseInt(id);
                Requisitions requisitions = mgr.cancelPost(ids);
                out.print("Post Stopped Successfully");
            } catch (NumberFormatException e) {
                out.print("Quantity field cannot be empty");
            } catch (NullPointerException e) {
                e.printStackTrace();
                out.print("Sorry try again");
            }
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        // System.out.println("here" + id);
        session.setAttribute("lasterror", "Request Modified Successfully");
        session.setAttribute("class", "alert-success");
        //response.sendRedirect("../dispensarymakerequest.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }
%>