/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package hospitalPackage;

/**
 *
 * @author Nick
 */
public class AddPatient {
    String Name;
    String Phone;
    int Doctor;
    int SSN;
    int OHIP;
    String Gender;
    String DOB;
    String Address;
    String City;
    String Postal_Code;
    String Emergency_Contact;
    String Emergency_Phone;
    String Emergency_Relation;
    String Allergies;
    int Patient_Status;
    public String getName() {
        return Name;
    }

    public void setName(String value) {
       Name = value;
    }
    public int getDoctor() {
        return Doctor;
    }
    public void setDoctor(int value) {
        Doctor = value;
    }
    public String getPhone() {
        return Phone;
    }
    
    public void setPhone(String value) {
        Phone = value;
    }
    public void setSSN(int value){
        SSN = value;
    }
    public int getSSN(){
        return SSN;
    }
    public void setOHIP(int value){
        OHIP = value;
    }
    public int getOHIP(){
        return OHIP;
    }
    public void setGender(String value){
        Gender = value;
    }
    public String getGender(){
        return Gender;
    }
    public void setDOB(String value){
        DOB = value;
    }
    public String getDOB(){
        return DOB;
    }
    public void setAddress(String value){
        Address = value;
    }
    public String getAddress(){
        return Address;
    }
    public void setCity(String value){
        City = value;
    }
    public String getCity(){
        return City;
    }
    public void setPostalCode(String value){
        Postal_Code = value;
    }
    public String getPostalCode(){
        return Postal_Code;
    }
    public void setEmergencyContact(String value){
        Emergency_Contact = value;
    }
    public String getEmergencyContact(){
        return Emergency_Contact;
    }
    public void setEmergencyPhone(String value){
        Emergency_Phone = value;
    }
    public String getEmerygencyPhone(){
        return Emergency_Phone;
    }
    public void setEmergencyRelation(String value){
        Emergency_Relation = value;
    }
    public String getEmergencyRelation(){
        return Emergency_Relation;
    }
    public String getAllergies() {
        return Allergies;
    }
    public void setAllergies(String value) {
        Allergies = value;
    }
    public int getPatientStatus(){
        return Patient_Status;
    }
    public void setPatientStatus(int value){
        Patient_Status = value;
    }
}
