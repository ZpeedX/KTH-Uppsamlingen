 package model;

 /**
  * Handles inspection results and names.
  */
public class Inspections {
	public boolean [] boolInspections = new boolean[7];
	public String [] inspectionpart = new String[7];

	/**
	 * <code>getInspections</code> turns the inspection results from pass/fail to true/false.
	 * @param inspections	Inspection results string
	 * @return				Inspection result as boolean
	 */
	public boolean [] getInspections (String [] inspections)
	{
		for(int i = 0; i < inspections.length; i++)
		{
			if(inspections[i].equals("pass")|| inspections[i].equals("Pass"))
			{
				boolInspections[i] = true;
			}
			else
				boolInspections[i] = false;
		}
		return boolInspections;
	}
	/**
	 * <code>parts</code> contains a list of the parts that should be inspected.
	 */
	public  void parts(String [] inspectionpart)
	{
		
		inspectionpart[0] = "Body";
		inspectionpart[1] = "Glass";
		inspectionpart[2] = "Suspension";
		inspectionpart[3] = "Lights & lenses";
		inspectionpart[4] = "Tires";
		inspectionpart[5] = "Engine";
		inspectionpart[6] = "Brakes";
	}
}
