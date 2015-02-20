package hospitalPackage;

public class UserLogin {

    String userName;
    String passWord;
    int accessLevel;
    int userID;
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String value) {
        userName = value;
    }
    
    public void setPassword(String value){
        passWord = value;
    }
    public String getPassword(){
        return passWord;
    }
    public void setAccessLevel(int value){
        accessLevel = value;
    }
    public int getAccessLevel(){
        return accessLevel;
    }
    public void setUserID(int value){
        userID = value;
    }
    public int getUserID(){
        return userID;
    }
}