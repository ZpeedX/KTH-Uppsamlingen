/* This program is an example used to illustrate how JDBC works.
 ** It uses the JDBC driver UCanAccess for Microsoft Access.
 **
 ** This program was written by nikos dimitrakas
 ** for use in the basic database courses.
 **
 ** There is no error management in this program.
 ** Instead an exception is thrown. Ideally all exceptions
 ** should be caught and managed appropriately. But this 
 ** program's goal is only to illustrate the basic JDBC classes.
 **
 ** Last modified by nikos on 2015-10-07
 */

import java.sql.*;

public class DBJDBCA
{

    // DB connection variable
    static protected Connection con;
    // DB access variables
    private String URL = "jdbc:ucanaccess://C:/Users/ZpeedX/Documents/GitHub/DATABASE-PARADIGMS/projektdeaDb.accdb";
    private String driver = "net.ucanaccess.jdbc.UcanaccessDriver";
    private String userID;
    private String password;

    // method for establishing a DB connection
    public void connect()
    {
        try
        {
            // register the driver with DriverManager
            Class.forName(driver);
            //create a connection to the database
            con = DriverManager.getConnection(URL, userID, password);
            // Set the auto commit of the connection to false.
            // An explicit commit will be required in order to accept
            // any changes done to the DB through this connection.
            con.setAutoCommit(false);
				//Some logging
				System.out.println("Connected to " + URL + " using "+ driver);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public void simpleselect() throws Exception
    {
        // Local variables
        String query;
        ResultSet rs;
        Statement stmt;

        // Set the SQL statement into the query variable
        query = "SELECT DISTINCT namn FROM Grovindelning";

        // Create a statement associated to the connection con.
        // The new statement is placed in the variable stmt.
        stmt = con.createStatement();

        // Execute the SQL statement that is stored in the variable query
        // and store the result in the variable rs.
        rs = stmt.executeQuery(query);

        System.out.println("Resultatet av alla produkttyper:");

        // Loop through the result set and print the results.
        // The method next() returns false when there are no more rows.
        while (rs.next())
        {
            System.out.println("Grovnamn: " + rs.getString("namn"));
        }

        // Close the variable stmt and release all resources bound to it
        // Any ResultSet associated to the Statement will be automatically closed too.
        stmt.close();
    }

    public void parameterizedselect() throws Exception
    {
         // Local variables
        String query;
        ResultSet rs;
        PreparedStatement stmt;
        String markeparam;

        // Create a Scanner in order to allow the user to provide input.
        java.util.Scanner in = new java.util.Scanner(System.in);

        // This is the old way (Java 1.4 or earlier) for reading user input:
        // Create a BufferedReader in order to allow the user to provide input.
        // java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(System.in));

        // Ask the user to specify a value for MÃ¤rke.
        System.out.print("Ange en produkttyp: ");
        // Retrieve the value and place it in the variable markeparam.
        markeparam = in.nextLine();

        // Set the SQL statement into the query variable
        query = "SELECT namn FROM Märke WHERE namn IN (SELECT märkesnamn FROM Produkt WHERE grovnamn = ?)";

        // Create a statement associated to the connection and the query.
        // The new statement is placed in the variable stmt.
        stmt = con.prepareStatement(query);
        
        // Provide the value for the first ? in the SQL statement.
        // The value of the variable markeparam will be sent to the database manager
        // through the variables stmt and con.
        stmt.setString(1, markeparam);

        // Execute the SQL statement that is prepared in the variable stmt
        // and store the result in the variable rs.
        rs = stmt.executeQuery();
        //System.out.println(stmt);
        System.out.println("Resultatet från " + markeparam + ":");

        // Loop through the result set and print the results.
        // The method next() returns false when there are no more rows.
        while (rs.next())
        {
            System.out.println(rs.getString("namn"));
        }

        // Close the variable stmt and release all resources bound to it
        // Any ResultSet associated to the Statement will be automatically closed too.
        stmt.close();
    }

    public void insert() throws Exception
    {
        // Local variables
        String query;
        PreparedStatement stmt;
        Statement stmt1;
        String namnparam;
        String pnrparam;
        String tlfnrparam;
        String adressparam;
        String postnrparam;
        String emailparam;
        int total = 0;
        System.out.println("Fyll i formuläret för att registera dig i Icooköp:");
        query = "SELECT COUNT(pnr) as total FROM Stamkund";
        stmt1 = con.createStatement();
        ResultSet rs = stmt1.executeQuery(query);
        // Loop through the result set and print the results.
        // The method next() returns false when there are no more rows.
        while (rs.next()){
        total = rs.getInt("total");
        }
        total = total + 1;
        stmt1.close();
        // Create a Scanner in order to allow the user to provide input.
        java.util.Scanner in = new java.util.Scanner(System.in);

        // Ask the user to specify a value for förnamn.
        System.out.print("Ange namn: ");
        // Retrieve the value and place it in the variable fnamnparam.
        namnparam = in.nextLine();
        // Ask the user to specify a value for efternamn.
        System.out.print("Ange personnummer: ");
        // Retrieve the value and place it in the variable enamnparam.
        pnrparam = in.nextLine();
        // Ask the user to specify a value for stad.
        System.out.print("Ange telefonnummer: ");
        // Retrieve the value and place it in the variable stadparam.
        tlfnrparam = in.nextLine();
        System.out.print("Ange adress: ");
        // Retrieve the value and place it in the variable stadparam.
        adressparam = in.nextLine();
        System.out.print("Ange postnummer: ");
        // Retrieve the value and place it in the variable stadparam.
        postnrparam = in.nextLine();
        System.out.print("Ange email: ");
        // Retrieve the value and place it in the variable stadparam.
        emailparam = in.nextLine();
        // Set the SQL statement into the query variable
        

        query = "INSERT INTO Stamkund (pnr, namn, köpkortsnummer, telefonnummer, adress, postnr, email) VALUES (?, ?, ?, ?, ?, ?, ?)";

        // Create a statement associated to the connection and the query.
        // The new statement is placed in the variable stmt.
        stmt = con.prepareStatement(query);

        // Provide the values for the ?'s in the SQL statement.
        // The value of the variable fnamnparam is the first,
        // enamnparam is second and stadparam is third.
        stmt.setString(1, pnrparam);
        stmt.setString(2, namnparam);
        stmt.setInt(3, (total));
        stmt.setString(4, tlfnrparam);
        stmt.setString(5, adressparam);
        stmt.setString(6, postnrparam);
        stmt.setString(7, emailparam);
        // Execute the SQL statement that is prepared in the variable stmt
        stmt.executeUpdate();
        System.out.println("Välkommen till Icooköp.\nDin köpkortsnummer är: " + total);
        // Close the variable stmt and release all resources bound to it
        stmt.close();
    }

    public static void main(String[] argv) throws Exception
    {
        // Create a new object of this class.
        DBJDBCA t = new DBJDBCA();

        // Call methods on the object t.
		  System.out.println("-------- connect() ---------");
        t.connect();
		  System.out.println("-------- Uppgift 1() ---------");
        t.simpleselect();
		  System.out.println("-------- uppgift 2() ---------");
        t.parameterizedselect();
		  System.out.println("-------- uppgift 3() ---------");
        t.insert();

        // Commit the changes made to the database through this connection.
        con.commit();
        // Close the connection.
        con.close();
    }
}
