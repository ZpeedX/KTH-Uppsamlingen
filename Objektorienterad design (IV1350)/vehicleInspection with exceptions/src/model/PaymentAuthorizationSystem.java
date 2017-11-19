package model;

/**
 * Validates the credit card information.
 */
public class PaymentAuthorizationSystem {
	
private  boolean [] creditCardvalid1 = new boolean [16];
private  boolean [] creditCardvalid2 = new boolean [4];
private boolean creditCardValidate1;
private boolean creditCardValidate2;
private boolean creditCardValidate;

	/**
	 * Validates credit card information and length.
	 * @param creditCardInfo	Credit card information.
	 * @param creditCardPin		Credit card pin.
	 * @return					Returns credit card validation.
	 */
	public  boolean sendPaymentAuthorizationRequest(String creditCardInfo, String creditCardPin)
	{
		if (creditCardInfo.length() == 16 && creditCardPin.length() == 4)
		{
		
			for(int i = 0; i < 16; i++)
			{
					if(Character.isDigit(creditCardInfo.charAt(i)))
						creditCardvalid1[i]  = true;
			
				else
					creditCardvalid1[i] = false;
			}
			
			for(int i = 0; i < 4; i++)
			{
				if(Character.isDigit(creditCardPin.charAt(i)))
					creditCardvalid2[i]  = true;
			
				else
					creditCardvalid2[i] = false;
			}
			creditCardValidate1 = areAllTrue(creditCardvalid1);
			creditCardValidate2 = areAllTrue(creditCardvalid2);
			
			if(creditCardValidate1 == true && creditCardValidate2 == true)
				creditCardValidate = true;
			
			else
				creditCardValidate = false;
		}
		else 
			creditCardValidate = false;
		
		return creditCardValidate;
	}	
	/**
	 * Takes boolean array and checks if all booleans are true.
	 * @param array		A boolean array with credit card information.
	 * @return			Returns true if all booleans are true and false if not. 
	 */
	public boolean areAllTrue(boolean[] array)
	{
	    for(boolean b : array) if(!b) return false;
	    return true;
	}
}