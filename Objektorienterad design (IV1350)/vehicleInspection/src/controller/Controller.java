package controller;
import view.View;
import model.CashRegister;
import model.Display;
import model.GarageDoor;
import model.PaymentAuthorizationSystem;
import model.Printout;
import model.Receipt;
import dbhandler.DbHandler;
import model.Inspections;
/**
 * The <code>Controller</code> class executes the requests from the <code>View</code> class.
 * Calls to the model pass through the <code>Controller</code>
 */

public class Controller {

public int cashToPay = new CashRegister().cashToPay;
public int cashLeftInRegister = new CashRegister().totalAmountCash + cashToPay;

	/**
	 * <code>Controller</code> is used by the <code>StartUp</code> class and runs the <code>view</code> method.
	 */
	public void controller()
	{
		new View().view();
	}
	
/**
 * <code>startNewInspection</code> gets the next queue number from the<code>disaplayNextNumber</code> method.
 * @param 	Ready makes next number show if true.
 * @return 	Returns the queue number.
 */
	public int startNewInspection(boolean ready)
	{
		int nextnumber;
		nextnumber = new Display().displayNextNumber(ready);
		return nextnumber;
	}
	
/**
 * @param command 	Door opening command entered by user.
 * @return			Returns true if door is open false if not.
 */
	public boolean isOpen(String command)
	{
		boolean checkOpen;
		checkOpen = new GarageDoor().isOpen(command);
		return checkOpen;
	}
	
/**
 * Gives result of the license number validation
 * @param licensenumber	The entered vehicle license number.
 * @return				Returns true if the license number is valid false if invalid.
 */
	public boolean enterVehicleInfo(String licensenumber)
	{
		if(new DbHandler().giveLicenseNumber(licensenumber) == true)
			return true;
		else
			return false;
	}
	
/**
 * Gets change for payment.
 * @param pay	The paid amount.
 * @return		Returns the change amount.
 */
	public int payWithCash(int pay)
	{
		return new CashRegister().payAndReturnChange(pay); 
	}
	
	/**
	 * Checks if there is enough cash for change.
	 * @param cashPaying	Cash given by customer.
	 * @return				Returns true if enough cash for change.
	 */
	public boolean canCashRegisterPayChangeCheck(int cashPaying)
	{
		
		return new CashRegister().canCashRegisterPayChangeCheck(cashPaying);
	}
	
	/**
	 * Sends payment validation request.
	 * @param creditCardInfo	Credit card number
	 * @param creditCardPin		Credit card pin code.
	 * @return					Credit card validation.
	 */
	public boolean sendPaymentAuthorizationRequest(String creditCardInfo, String creditCardPin)
	{
		return new PaymentAuthorizationSystem().sendPaymentAuthorizationRequest(creditCardInfo, creditCardPin);
	}
	
	/**
	 * Receipt info for cash payment.
	 * @param licenseNumber The license number.
	 * @param cashToPay		The inspection cost.
	 * @param payCash		The amount paid.
	 * @param totalChange	The change.
	 */
	public void cashReceipt (String licenseNumber, int cashToPay, int payCash, int totalChange)
	{
		new Receipt().cashReceipt(licenseNumber, cashToPay, payCash, totalChange);
	}
	
	/**
	 * Receipt info for credit card payment.
	 * @param creditCardInfo	Credit card information.
	 * @param licenseNumber		License number.
	 * @param cashToPay			The inspection cost.
	 */
	public void creditReceipt(String creditCardInfo, String licenseNumber, int cashToPay)
	{
		new Receipt().creditReceipt(creditCardInfo, licenseNumber, cashToPay);
	}
	
	/**
	 * Makes inspection results into true/false from pass/fail.
	 * @param inspect	Inspection results by user.
	 * @return			Inspection results boolean.
	 */
	public boolean [] getInspections(String [] inspect)
	{
		boolean[] checkInspection;

		checkInspection = new Inspections().getInspections(inspect);
		return checkInspection;
	}
	
	/**
	 * Gives parts to view.
	 * @param inspectionpart	Part being inspected.
	 */
	public void parts(String [] inspectionpart)
	{
		new Inspections().parts(inspectionpart);
	}
	
	/**
	 * Gives information to make printout.
	 * @param inspectionresults		Results from inspection.
	 * @param testnames				Names of inspections.
	 */
	public void printout(boolean[] inspectionresults, String[] testnames)
	{
		Printout.printout(inspectionresults, testnames);
	}
	
}
