/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package hospitalPackage;
import java.util.Date;
/**
 *
 * @author Nick
 */
public class AddAppointment {
    Date Date;
    Date TreatmentDate;
    Date EndDate;
    int Length;
    int Patient;
    String Procedure;
    String Time;
    int Prescription;
    int Dosage;
    int Diagnosis;
    int Treatment;
    String Comments;
    public int getPatient(){
        return Patient;
    }
    public void setPatient(int value){
        Patient = value;
    }
    public int getLength()
    {
        return Length;
    }
    public void setLength(int value){
        Length = value;
    }
    public Date getDate() {
        return Date;
    }

    public void setDate(Date value) {
       Date = value;
    }
    public String getTime() {
        return Time;
    }

    public void setTime(String value) {
       Time = value;
    }
    public int getPrescription() {
        return Prescription;
    }

    public void setPrescription(int value) {
       Prescription = value;
    }
    public int getDosage() {
        return Dosage;
    }

    public void setDosage(int value) {
       Dosage = value;
    }
    public int getDiagnosis() {
        return Diagnosis;
    }

    public void setDiagnosis(int value) {
       Diagnosis = value;
    }
    public void setTreatment(int value){
        Treatment = value;
    }
    public int getTreatment(){
        return Treatment;
    }
    public void setComments(String value){
        Comments = value;
    }
    public String getComments(){
        return Comments;
    }
    public void setProcedure(String value){
        Procedure = value;
    }
    public String getProcedure(){
        return Procedure;
    }
}
