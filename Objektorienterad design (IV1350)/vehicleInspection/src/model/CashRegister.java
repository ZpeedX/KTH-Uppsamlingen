package model;

/**
 * Handles cash payment.
 */
public class CashRegister {
	
	public int cashToPay = 100;
	public int totalAmountCash = 2000;
	public int cashLeftInRegister = 0;
	private boolean booltotalAmountCash;

/**
 * @param payCash	Amount of cash paid.
 * @return			Returns change.
 */
	public int payAndReturnChange(int payCash)
	{
		return payCash - cashToPay; 
	}
	/**
	 * Checks if cash register can afford to pay change.
	 * @param cashPaying	Amount paid.
	 * @return				Returns true if register can afford to pay change.
	 */
	public boolean canCashRegisterPayChangeCheck(int cashPaying)
	{
		
		if (totalAmountCash >= cashPaying)
		{
			
			booltotalAmountCash = true;
		}
		else 
			booltotalAmountCash = false;
		
		return booltotalAmountCash;
	}
}
