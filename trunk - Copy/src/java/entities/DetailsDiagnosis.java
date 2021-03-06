package entities;
// Generated 13-Aug-2013 12:01:58 by Hibernate Tools 3.2.1.GA



/**
 * DetailsDiagnosis generated by hbm2java
 */
public class DetailsDiagnosis  implements java.io.Serializable {


     private Integer detailid;
     private String diagnosticGroup;
     private String gdrg;
     private String icd10;
     private String description;

    public DetailsDiagnosis() {
    }

    public DetailsDiagnosis(String diagnosticGroup, String gdrg, String icd10, String description) {
       this.diagnosticGroup = diagnosticGroup;
       this.gdrg = gdrg;
       this.icd10 = icd10;
       this.description = description;
    }
   
    public Integer getDetailid() {
        return this.detailid;
    }
    
    public void setDetailid(Integer detailid) {
        this.detailid = detailid;
    }
    public String getDiagnosticGroup() {
        return this.diagnosticGroup;
    }
    
    public void setDiagnosticGroup(String diagnosticGroup) {
        this.diagnosticGroup = diagnosticGroup;
    }
    public String getGdrg() {
        return this.gdrg;
    }
    
    public void setGdrg(String gdrg) {
        this.gdrg = gdrg;
    }
    public String getIcd10() {
        return this.icd10;
    }
    
    public void setIcd10(String icd10) {
        this.icd10 = icd10;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }




}


