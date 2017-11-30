/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package basicJDBC;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author evan_
 */
public class BasicJDBC {

    private static final String TABLE_NAME = "person";
    
    private PreparedStatement createPersonStmt;
    private PreparedStatement findAllPersonsStmt;
    private PreparedStatement deletePersonsStmt;

    private void accessDB() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientXADataSource");
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/MySampleDatabase", "jdbc",
                    "jdbc");
            createTable(connection);
            Statement stmt = connection.createStatement();
            preprareStatements(connection);
            createPersonStmt.setString(1,"Stina");
            createPersonStmt.setString(2,"3252352244");
            createPersonStmt.setInt(3,43);
            createPersonStmt.executeUpdate();
            
            createPersonStmt.setString(1,"Olle");
            createPersonStmt.setString(2,"0134448743");
            createPersonStmt.setInt(3,12);
            createPersonStmt.executeUpdate();
            
            listallRows(connection);
            stmt.executeUpdate("delete from " + TABLE_NAME + " where name = 'Stina'");
            listallRows(connection);
            
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void createTable(Connection connection) throws SQLException {
        if (!tableExists(connection)) {
            Statement stmt = connection.createStatement();
            stmt.executeUpdate("create table person (name varchar(32) primary key, phone varchar(12), age int)");
        }
    }

    private boolean tableExists(Connection connection) throws SQLException {
        DatabaseMetaData metaData = connection.getMetaData();
        ResultSet tableMetaData = metaData.getTables(null, null, null, null);
        while (tableMetaData.next()) {
            String tableName = tableMetaData.getString(3);
            if (tableName.equalsIgnoreCase(TABLE_NAME)) {
                return true;
            }

        }
        return false;
    }
    
    private void listallRows(Connection connection) throws SQLException {
        Statement stmt = connection.createStatement();
        ResultSet persons = stmt.executeQuery("select * from person");
        while (persons.next()) {
            System.out.println(
                    "name: "+ persons.getString(1) + ", phone : " + persons.getString(2) + ", age:" + persons.getInt(3));
        }
    }
    
    private void preprareStatements(Connection connection) throws SQLException {
        createPersonStmt = connection.prepareStatement("INSERT INTO "
                + TABLE_NAME + " VALUES (?, ?, ?)");
        findAllPersonsStmt = connection.prepareStatement("SELECT * FROM " + TABLE_NAME);

        deletePersonsStmt = connection.prepareStatement("DELETE FROM "
                                                        + TABLE_NAME 
                                                        + " WHERE name = ?");
    }
    

    public static void main(String[] args) {
        new BasicJDBC().accessDB();
    }

}
