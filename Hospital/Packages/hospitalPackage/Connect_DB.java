/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package hospitalPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Nick
 */
public class Connect_DB {
    
    
    
    public static Connection testConnection(String url, String user, String pwd)
            throws ClassNotFoundException, SQLException {
        
        try
        {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, "admin", "admin");

            return con;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
            return null;
        }
    }
    public static Connection _testConnection(){
    try {
        java.sql.Connection con = null;
        java.sql.PreparedStatement pst = null;

        String url = "jdbc:mysql://localhost/hospital?zeroDateTimeBehavior=convertToNull";
            /* TODO output your page here. You may use following sample code. */
            try
            {
                con = testConnection(url,"admin","admin");
            }
            catch(ClassNotFoundException ex){}
            return con;
    }
    catch(Exception ex)
    {
        return null;
    }
    }
}
