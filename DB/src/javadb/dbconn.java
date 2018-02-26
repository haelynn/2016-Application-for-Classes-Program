package javadb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class dbconn {
   private static Connection conn;
   
   public synchronized static Connection getInstance() {
      try {
         if (conn == null || conn.isClosed()) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@203.229.204.89:1521:orcl", "db117",
                  "db117");
         }
      } catch (ClassNotFoundException | SQLException e) {
         e.printStackTrace();
      }
      return conn;
   }
}