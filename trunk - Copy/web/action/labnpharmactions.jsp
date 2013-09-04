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
        ExtendedHMSHelper mgr = new ExtendedHMSHelper();
        Date dt = new Date();
        DateFormat ft;
        ft = new SimpleDateFormat("yyyy-MM-dd");

        if ("addvital".equals(request.getParameter("action"))) {
            String temp = request.getParameter("temp") == null ? "0.0" : request.getParameter("temp");
            String pulse = request.getParameter("pulse") == null ? "0.0" : request.getParameter("pulse");
            String systolic = request.getParameter("systolic") == null ? "0.0" : request.getParameter("systolic");
            String diatolic = request.getParameter("diatolic") == null ? "0.0" : request.getParameter("diatolic");
            String id = request.getParameter("id") == null ? "0.0" : request.getParameter("id");

            try {
                double temperature = Double.parseDouble(temp);
                double pul = Double.parseDouble(pulse);
                double sys = Double.parseDouble(systolic);
                double dia = Double.parseDouble(diatolic);
                int code = Integer.parseInt(id);
                Vitalcheck vitalcheck = mgr.addVitalCheck(code, temperature, pul, sys, dia);
            } catch (NumberFormatException ex) {
                out.print("There was an error please try again");
            } catch (NullPointerException ex) {
                out.print("There was an error please try again");
            }
            out.print("successfully added");
            return;
        }

        if ("Forward".equals(request.getParameter("action"))) {
            String patientid = request.getParameter("patientid") == null ? "" : request.getParameter("patientid");
            int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            System.out.println(id);

            if (!patientid.equalsIgnoreCase("") || id != 0) {
                String diagnosis[] = request.getParameterValues("diaglist") == null ? null : request.getParameterValues("diaglist");
                String treatment[] = request.getParameterValues("data") == null ? null : request.getParameterValues("data");
                String labtest[] = request.getParameterValues("labtest") == null ? null : request.getParameterValues("labtest");
                String qnas[] = request.getParameterValues("anss[]") == null ? null : request.getParameterValues("anss[]");
                String procedures[] = request.getParameterValues("procedures") == null ? null : request.getParameterValues("procedures");
                String questions[] = request.getParameterValues("ans") == null ? null : request.getParameterValues("ans");
                // String newans[] = request.getParameterValues("newanswers[]") == null ? null : request.getParameterValues("newanswers[]");
                String vitals = request.getParameter("vitals") == null ? "" : request.getParameter("vitals[]");
                String unitName = request.getParameter("unitid") == null ? "" : request.getParameter("unitid");
                String prescriptionnote = request.getParameter("prescription_notes") == null ? "" : request.getParameter("prescription_notes");
                String investigationnote = "";
                String admit = request.getParameter("admission") == null ? "Out Patient" : request.getParameter("admission");
                String notes = request.getParameter("further") == null ? "" : request.getParameter("further");
                String complaints = request.getParameter("complaints") == null ? "" : request.getParameter("complaints");
                String summary = request.getParameter("visit_summary") == null ? "" : request.getParameter("visit_summary");

                String nonexistant = request.getParameter("nonexistant") == null ? null : request.getParameter("nonexistant");
                // String[] code = treatments
                if (labtest == null) {
                    out.print("empty");
                }

                Date date = new Date();
                DateFormat formatter;
                formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                int qty = 0;
                // formatter.format(date); 

                if (treatment != null) {
                    List lst = mgr.listPharmorders();
                    String yr = "" + Calendar.getInstance().get(Calendar.YEAR);
                    String y = yr.substring(2);
                    int toadd = lst.size() + 1;
                    String orderid = y + "DPH" + toadd;
                    mgr.addPharmOrder(orderid, patientid, user.getStaffid(), new Date(), id);
//mgr.updatePatientBills(id, totalBill, amounPaid, status);
                    // String[] treatments = treatment.split("<>");
                    for (int i = 0; i < treatment.length; i++) {
                        String[] treatmentcode = treatment[i].split("><");

                        try {
                            qty = Integer.parseInt(treatmentcode[3]);
                        } catch (NumberFormatException e) {
                            qty = 0;
                        }
                        //call get treatmentbyCode to retrieve item price
                        double price = mgr.sponsorshipDetails(patientid).getType().equalsIgnoreCase("NHIS") ? mgr.getItemTable(treatmentcode[1]).getNhisprice() : mgr.getItemTable(treatmentcode[1]).getDispensaryprice();
                        mgr.addPatientTreatment(patientid, "CODE", treatmentcode[1], treatmentcode[4], price, "No", id, formatter.format(date), prescriptionnote, qty, treatmentcode[2], orderid);
                        // }

                        if (admit.equalsIgnoreCase("In Patient")) {
                            //mgr.addDosageMonitor(id, Integer.parseInt(treatmentcode[1]), "", "", "", null);
                        }
                    }
                }
                /**
                 * if (labtest != null) { List lst = mgr.listLaborders(); String
                 * yr = "" + Calendar.getInstance().get(Calendar.YEAR); String y
                 * = yr.substring(2); int toadd = lst.size() + 1; String orderid
                 * = y + "DML" + toadd; // String orderid = "";
                 * mgr.addLaborders(orderid, user.getStaffid(), id, patientid,
                 * "Clinic"); // String[] investigations =
                 * investigation.split("<>"); for (int i = 0; i <
                 * labtest.length; i++) { String[] investigationcode =
                 * labtest[i].split("><"); //call get treatmentbyCode to
                 * retrieve item price // mgr.addPatientTreatment(patientid,
                 * investigationcode[1], investigationcode[0], "", 0.0, "", id,
                 * formatter.format(date)); if
                 * (mgr.sponsorshipDetails(patientid).getType().equals("NHIS"))
                 * { mgr.addPatientInvestigation(patientid, "CODE",
                 * Integer.parseInt(investigationcode[1]), "",
                 * mgr.getNhisInvestigation(Integer.parseInt(investigationcode[1])).getRate(),
                 * id, formatter.format(date), "No", investigationnote, 0,
                 * orderid); } else { mgr.addPatientInvestigation(patientid,
                 * "CODE", Integer.parseInt(investigationcode[1]), "",
                 * mgr.getInvestigation(Integer.parseInt(investigationcode[1])).getRate(),
                 * id, formatter.format(date), "No", investigationnote, 0,
                 * orderid);
                 *
                 * }
                 *
                 * }
                 * }  *
                 */
                // --- Start Nezer 19th Dec
                if (labtest != null) {
                    List lst = mgr.listTransitLabsInClinic();
                    String yr = "" + Calendar.getInstance().get(Calendar.YEAR);
                    String y = yr.substring(2);
                    int toadd = lst.size() + 1;
                    // String orderid = y + "DML" + toadd;
                    String orderid = y + "TLA" + toadd;
                    String patientID = "";

      //              Patient patient = (Patient) mgr.getPatientByID(patientid);
      //              List list = mgr.listLabPatientExist(patient.getFname(), patient.getLname(), patient.getDateofbirth() + "");
      //              if (list.size() > 1 || list == null || !list.isEmpty()) {
      //                  LabPatient labPatient = (LabPatient) list.get(0);
      //                  patientID = labPatient.getPatientid();
      //              } else {
      //                  patientID = (y + "LP" + (mgr.listLabPatients().size() + 1));
      //                  LabPatient labPatient = mgr.addNewLabPatient(patientID, patient.getLname(), patient.getFname(), patient.getMidname(), patient.getGender(), patient.getAddress(), patient.getEmployer(), patient.getDateofbirth() + "", patient.getContact(), patient.getEmergencyperson(), patient.getEmergencycontact(), patient.getEmail(), patient.getCountry(), patient.getCity(), patient.getMaritalstatus(), patient.getImglocation(), patientid);
                       // Sponsorhipdetails sponsorhipdetails = (Sponsorhipdetails) mgr.sponsorshipDetails(patientid);
                       // mgr.createPatientSponsorshipDetails(patientID, sponsorhipdetails.getMembershipid(), sponsorhipdetails.getType(), sponsorhipdetails.getBenefitplan(), sponsorhipdetails.getSponsorid(), sponsorhipdetails.getDependentnumber(), sponsorhipdetails.getSecondaryType());
                  //  }


                    // String orderid = "";
                    //mgr.addLaborders(orderid, user.getStaffid(), id, patientid, "Clinic");
                    mgr.addTransitLabs(orderid, patientid, user.getStaffid(), id);
                    // String[] investigations = investigation.split("<>");
                    int invId;
                    Investigation subInv;
                    List subInvsList;
                    for (int i = 0; i < labtest.length; i++) {
                        String[] investigationcode = labtest[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        // mgr.addPatientTreatment(patientid, investigationcode[1], investigationcode[0], "", 0.0, "", id, formatter.format(date));

                        System.out.println("getting insyd here");
                        mgr.addPatientInvestigation(patientid, "CODE", Integer.parseInt(investigationcode[1]), "", mgr.getInvestigation(Integer.parseInt(investigationcode[1])).getRate(), id, formatter.format(date), "No", investigationnote, 0, orderid);
                        invId = Integer.parseInt(investigationcode[1]);

                        subInvsList = mgr.listSubInvUnderMainInv(invId);
                        System.out.println(".ssze  : " + subInvsList.size());
                        if (!subInvsList.isEmpty()) {
                            System.out.println("not empty at all !!!");
                            for (int p = 0; p < subInvsList.size(); p++) {
                                subInv = (Investigation) subInvsList.get(p);
                                mgr.addPatientInvestigation(patientid, "CODE", subInv.getDetailedInvId(), "", 0.0, id, formatter.format(date), "No", investigationnote, 0, orderid);
                            }
                        }
                        // }

                    }
                }

                // --- End Nezer 19th Dec

                if (diagnosis != null) {
                    // String[] diagnoses = diagnosis.split("<>");
                    for (int i = 0; i < diagnosis.length; i++) {
                        String[] diagnosescode = diagnosis[i].split("><");
                        //call get treatmentbyCode to retrieve item price
                        // mgr.addPatientDiagnosis(patientid, diagnosescode[1], diagnosescode[0], "", 0.0, "", id, formatter.format(date));
                        if (mgr.sponsorshipDetails(patientid).getType().equals("NHIS")) {
                            mgr.addPatientDiagnosis(patientid, Integer.parseInt(diagnosescode[1]), mgr.getNHISdiagnosis(Integer.parseInt(diagnosescode[1])).getGdrg(), id, formatter.format(date));
                        } else {
                            mgr.addPatientDiagnosis(patientid, Integer.parseInt(diagnosescode[1]), "CODE", id, formatter.format(date));
                        }

                    }
                }
                if (questions != null) {
                    // String[] diagnoses = diagnosis.split("<>");
                    for (int i = 0; i < questions.length; i++) {
                        String[] diagnosescode = questions[i].split("_");
                        //call get treatmentbyCode to retrieve item price
                        mgr.addPatientClerking(id, Integer.parseInt(diagnosescode[0].trim()), Integer.parseInt(diagnosescode[1].trim()));
                    }
                }
                if (procedures != null) {
                    double total = 0.0;
                    Procedureorders procedureorders = mgr.addProedureOrder(id, patientid, 0.0);
                    for (int index = 0; index < procedures.length; index++) {
                        String sym = procedures[index];
                        String[] syms = sym.split("><");
                        total = total + Double.parseDouble(syms[2]);
                        mgr.updateProcedureordersTotal(procedureorders.getOrderid(), total);
                        mgr.addPatientProcedure(patientid, syms[1], procedureorders.getOrderid());
                    }
                }
                if (admit.equalsIgnoreCase("In Patient")) {
                    mgr.admitPatience(id, admit, new Date());
                    //mgr.addDosageMonitor(id, patienttreatmentid, "", "", "", null);
                }
                if (nonexistant != null) {
                    // Diagnosis d = mgr.addANewDiagnosis("NA", nonexistant, "gdrg");
                    //  mgr.addPatientDiagnosis(patientid, d.getId(), "CODE", id, formatter.format(date));
                }
                mgr.updateVisitNotes(id, notes);
                mgr.updateVisitationComplaints(id, complaints);
                mgr.updateVisitNotes(id, summary);
                mgr.updateVisitation(patientid, id, unitName, "consultation");
                mgr.updateVisitation(id, user.getStaffid());
                //String registrationDate = request.getParameter("dor");

                mgr.updateFolderLocation("consultation", unitName, patientid);
                if (admit.equalsIgnoreCase("In Patient")) {
                    mgr.updateVisitationStatus(id, "ward", "consultation");
                    mgr.updateFolderLocation("consultation", "ward", patientid);

                    //mgr.addDosageMonitor(id, patienttreatmentid, "", "", "", null);
                }
            }
        }
        HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction().commit();
        HibernateUtil.getSessionFactory().close();
        // System.out.println("here" + id);
        session.setAttribute("lasterror", "Patient Forwarded Successfully");
        session.setAttribute("class", "alert-success");
        response.sendRedirect("../consultingroom.jsp");
    } catch (Exception ex) {
        HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
        if (ServletException.class.isInstance(ex)) {
            throw (ServletException) ex;
        } else {
            throw new ServletException(ex);
        }
    }
%>