/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import java.sql.*;
import java.lang.System.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author admin
 */
public class DBContext {
     protected Connection connect;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                    + ";databaseName=" + dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, userID, password);
        } catch (ClassNotFoundException | SQLException e) {
        
        }
    }
    
    private final String serverName = "localhost";
    private final String dbName = "PrjShoes";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";
    
      public static void main(String[] args) {
       DBContext c = new DBContext();
        System.out.println(c.connect);
    }
}
