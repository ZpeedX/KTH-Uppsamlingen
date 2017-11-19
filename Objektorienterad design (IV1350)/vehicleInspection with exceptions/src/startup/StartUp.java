package startup;

import model.WrongLicenseNumberException;
import controller.Controller;
/**
 * Startup of the entire program.
 *
 */
public class StartUp {
	
	/**
	 * Starts the program.
	 * @param args	This takes nothing.
	 * @throws WrongLicenseNumberException 
	 */
	public static void main(String[] args) throws WrongLicenseNumberException {
		new Controller().controller();
			
	}
}
