package startup;

import controller.Controller;
/**
 * Startup of the entire program.
 *
 */
public class StartUp {
	
	/**
	 * Starts the program.
	 * @param args	This takes nothing.
	 */
	public static void main(String[] args) {
		new Controller().controller();
			
	}
}
