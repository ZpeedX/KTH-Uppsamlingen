package model;
import java.util.Random;

/**
 * <code>Receipt</code> creates a receipt and prints it out.
 */
public class Receipt {
	
	private  Random rand = new Random();
	private  int receiptNumber = rand.nextInt(100);
	private  String creditCardNumberMasked= "XXXX XXXX XXXX ";
	
	/**
	 * Created a receipt for cash payment and prints it out.
	 * @param licenseNumber		Vehicle license number.
	 * @param cashToPay			Inspection cost.
	 * @param cashPayed			Amount paid in cash.
	 * @param totalChange		Amount of change.
	 */
	public  void cashReceipt (String licenseNumber, int cashToPay, int cashPayed, int totalChange)
	{
        System.out.println(".---.              _             .-.");
        System.out.println(": .; :            :_;           .' `.");
        System.out.println(":   .' .--.  .--. .-. .--. .---.`. .'");
        System.out.println(": :.`.' '_.''  ..': :' '_.': .; `: :");
        System.out.println(":_;:_;`.__.'`.__.':_;`.__.': ._.':_;");
        System.out.println("                           : :       ");
        System.out.println("                           :_;      ");
		System.out.println("Emil and Evan's Inspection agency - Receipt\n" 
				+ "--------------------------\n"
				+ "Receipt number: " + receiptNumber +"\n"
				+ "License number: " + licenseNumber + "\n"
				+ "Inpsection cost: " + cashToPay + " dollars\n"
				+ "Cash payed: " + cashPayed + " dollars\n"
				+ "Change: " + totalChange + " dollars");
	}
	/**
	 * Creates a receipt for credit card payment.
	 * @param creditCardInfo	Credit card information.
	 * @param licenseNumber		Vehicle license number.
	 * @param cashToPay			Inspection cost.
	 */
	public  void creditReceipt(String creditCardInfo, String licenseNumber, int cashToPay )
	{
		for(int i = 12; i <16; i++)
		{
			creditCardNumberMasked += creditCardInfo.charAt(i);
		}
        System.out.println(".---.              _             .-.");
        System.out.println(": .; :            :_;           .' `.");
        System.out.println(":   .' .--.  .--. .-. .--. .---.`. .'");
        System.out.println(": :.`.' '_.''  ..': :' '_.': .; `: :");
        System.out.println(":_;:_;`.__.'`.__.':_;`.__.': ._.':_;");
        System.out.println("                           : :       ");
        System.out.println("                           :_;      ");
		System.out.println("Emil and Evan's Inspection agency - Receipt\n" 
				+ "--------------------------\n"
				+ "Receipt number: " + receiptNumber +"\n"
				+ "License number: " + licenseNumber + "\n"
				+ "Inpsection cost: " + cashToPay + " dollars\n"
				+ "Payed with credit card: " + creditCardNumberMasked);
	}
}