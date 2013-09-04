package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * FolderNumbering generated by hbm2java
 */
public class FolderNumbering  implements java.io.Serializable {


     private Integer numberingId;
     private String folderAbbreviationClinic;
     private String folderAbbreviationDiagnostics;
     private String folderAbbreviationPharmacy;
     private int clinicStartNumber;
     private int diagnosticStartNumber;
     private int pharmacyStartNumber;
     private int clinicCounter;
     private int diagnosticCounter;
     private int pharmacyCounter;

    public FolderNumbering() {
    }

    public FolderNumbering(String folderAbbreviationClinic, String folderAbbreviationDiagnostics, String folderAbbreviationPharmacy, int clinicStartNumber, int diagnosticStartNumber, int pharmacyStartNumber, int clinicCounter, int diagnosticCounter, int pharmacyCounter) {
       this.folderAbbreviationClinic = folderAbbreviationClinic;
       this.folderAbbreviationDiagnostics = folderAbbreviationDiagnostics;
       this.folderAbbreviationPharmacy = folderAbbreviationPharmacy;
       this.clinicStartNumber = clinicStartNumber;
       this.diagnosticStartNumber = diagnosticStartNumber;
       this.pharmacyStartNumber = pharmacyStartNumber;
       this.clinicCounter = clinicCounter;
       this.diagnosticCounter = diagnosticCounter;
       this.pharmacyCounter = pharmacyCounter;
    }
   
    public Integer getNumberingId() {
        return this.numberingId;
    }
    
    public void setNumberingId(Integer numberingId) {
        this.numberingId = numberingId;
    }
    public String getFolderAbbreviationClinic() {
        return this.folderAbbreviationClinic;
    }
    
    public void setFolderAbbreviationClinic(String folderAbbreviationClinic) {
        this.folderAbbreviationClinic = folderAbbreviationClinic;
    }
    public String getFolderAbbreviationDiagnostics() {
        return this.folderAbbreviationDiagnostics;
    }
    
    public void setFolderAbbreviationDiagnostics(String folderAbbreviationDiagnostics) {
        this.folderAbbreviationDiagnostics = folderAbbreviationDiagnostics;
    }
    public String getFolderAbbreviationPharmacy() {
        return this.folderAbbreviationPharmacy;
    }
    
    public void setFolderAbbreviationPharmacy(String folderAbbreviationPharmacy) {
        this.folderAbbreviationPharmacy = folderAbbreviationPharmacy;
    }
    public int getClinicStartNumber() {
        return this.clinicStartNumber;
    }
    
    public void setClinicStartNumber(int clinicStartNumber) {
        this.clinicStartNumber = clinicStartNumber;
    }
    public int getDiagnosticStartNumber() {
        return this.diagnosticStartNumber;
    }
    
    public void setDiagnosticStartNumber(int diagnosticStartNumber) {
        this.diagnosticStartNumber = diagnosticStartNumber;
    }
    public int getPharmacyStartNumber() {
        return this.pharmacyStartNumber;
    }
    
    public void setPharmacyStartNumber(int pharmacyStartNumber) {
        this.pharmacyStartNumber = pharmacyStartNumber;
    }
    public int getClinicCounter() {
        return this.clinicCounter;
    }
    
    public void setClinicCounter(int clinicCounter) {
        this.clinicCounter = clinicCounter;
    }
    public int getDiagnosticCounter() {
        return this.diagnosticCounter;
    }
    
    public void setDiagnosticCounter(int diagnosticCounter) {
        this.diagnosticCounter = diagnosticCounter;
    }
    public int getPharmacyCounter() {
        return this.pharmacyCounter;
    }
    
    public void setPharmacyCounter(int pharmacyCounter) {
        this.pharmacyCounter = pharmacyCounter;
    }




}


