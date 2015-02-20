/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package hospitalPackage;

/**
 *
 * @author mikededys
 */
public class AddDoctor {
    int id;
    String fname;
    String lname;
    int specialization;
    
    //GETTERS
    public int getID(){
        return id;
    }
    public String getFName(){
        return fname;
    }
    public String getLName(){
        return lname;
    }
    
    //SETTERS
    public void setFName(String value) {
       fname = value;
    }
     public void setLName(String value) {
       lname = value;
    }
      public void setID(int value) {
       id = value;
    }
      public void setSpecialization(int value) {
          specialization = value;
      }
      public int getSpecialization() {
          return specialization;
      }
}
