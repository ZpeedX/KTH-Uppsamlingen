package model;
/**
 * Handles opening and closing of garage door.
 */
public class GarageDoor {

	/**
	 * @param command	Open/close command by user.
	 * @return			Returns door state.
	 */
	public boolean isOpen(String command)
	{
		
		if(command.equals("o"))
		{
			return true;
		}
		else
		{
		return false;
		}
	}
}
