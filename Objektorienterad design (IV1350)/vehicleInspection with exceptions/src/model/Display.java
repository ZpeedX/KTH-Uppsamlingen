package model;

/**
 * Handles queue number.
 */
public class Display {

	/**
	 * 
	 * @param ready		User input if ready for inspection.
	 * @return			Returns queue number.
	 */
	public int displayNextNumber(boolean ready)
	{
		int currentnumber = 1336;
		if(ready == true)
			currentnumber += 1;
		return currentnumber;
	}
}
