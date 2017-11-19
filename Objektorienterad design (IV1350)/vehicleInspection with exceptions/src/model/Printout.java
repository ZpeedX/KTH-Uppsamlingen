package model;

/**
 * Creates the printout and prints it.
 */
public class Printout {

public static String [] inspectionResults = new String [7];

/**
 * Creates printout with inspection names and results of them.
 * @param boolinspectionresults		Inspection results.
 * @param testnames					Names of inspections.
 */
		public static void printout(boolean[] boolinspectionresults, String[] testnames)
		{
			
			System.out.println("Emil and Evan's Inspection agency - Printout\n"
								+"-------------------------------------------");
			for(int i = 0; i< new Inspections().inspectionpart.length; i++)
			{
				if(boolinspectionresults[i] == true)
					inspectionResults[i] = "pass";
				
				else 
					inspectionResults[i] = "fail";
				
				System.out.println("Result of " + testnames[i] + " test " + " = " + inspectionResults[i] );
			}
		}
}
