package dbhandler;

import java.sql.SQLException;

import model.WrongLicenseNumberException;

/**
 * Class to validate license number
 */
public class DbHandler {
	private  boolean [] valid = new boolean [6]; 
	private  boolean validate = false;
	
	/**
	 * 
	 * @param licenseNumber The entered vehicle license number.
	 * @return				Returns license number validation, true if valid false if not.
	 * @throws WrongLicenseNumberException 
	 */
	public boolean giveLicenseNumber(String licenseNumber) throws WrongLicenseNumberException
	{
		
			if(licenseNumber.equals("abc123"))
			{
				return true;
			}
			else
				throw new WrongLicenseNumberException("Invalid license number: " + licenseNumber, null);
				}
		
	/*	if (licenseNumber.length() == 6)
		{
		
			for(int i = 0; i < 3; i++)
			{
				if(Character.isLetter(licenseNumber.charAt(i)))
					if(Character.isDigit(licenseNumber.charAt(i+3)))
					valid [i] = true;
			
				else
					valid [i] = false;
			}
			if(valid[0] == true && valid[1] == true && valid[2] == true)
				validate = true;		
			
			return validate;
		}
		else
			return false; 
			}*/
	}
