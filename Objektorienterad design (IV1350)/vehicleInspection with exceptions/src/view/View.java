package view;

import java.util.Scanner;

import model.WrongLicenseNumberException;
import controller.Controller;

/**
 * <code>View</code> handles all the inputs and calls on the controller to use them.
 * Also prints to user.
 */
public class View {
	
	public  String licenseNumber;
	public  String licenseNumberValid;
	public  boolean licensevalidation;
	private  boolean isReady;
	private  String ready;
	private  String doorCommand;
	private  boolean doorCommandCheck;
	private  String doorState;
	private  boolean correctinput = false;
	private  boolean continueprogram = false;
	public  int queuenumber = 0;
	private  String payment;
	public  int payCash;
	public  int totalChange;
	private boolean updateCashRegister;
	private  boolean creditCardValidation;
	public  String creditCardInfo;
	private  String creditCardPin;
	public String [] inspectionPart = new String [7];
	public  String [] inspect = new String [7];
	public  boolean [] inspectionResults = new boolean[inspect.length];
	 Scanner s = new Scanner(System.in);

	/**
	 * Runs entire program.
	 * Prints out to user and takes inputs to then sent inputs to controller.
	 * @throws WrongLicenseNumberException 
	 */
	public void view() throws WrongLicenseNumberException
	{
		
		while(continueprogram == false)
		{
		
			while(correctinput == false)
			{
				System.out.println("Start new inspection? (y/n)");
				
				ready = s.nextLine();
				
				if(ready.equals("y") || ready.equals("n"))
					correctinput = true;
				
				else
				{
					correctinput = false;
					System.out.println("Invalid input");
				}
			}
			
			if(ready.equals("y"))
			{	isReady = true;
				continueprogram = true;}
			
			else
			{	isReady = false;
				continueprogram = false;
				correctinput = false;
			}
			
			queuenumber =  new Controller().startNewInspection(isReady);
			
		}
		
		System.out.println("Current number is " + queuenumber);
		
		continueprogram = false;
		
		while(continueprogram == false)
		{
			correctinput = false;
			while(correctinput == false)
			{
				System.out.println ("Press 'o' to open door");
				doorCommand = s.nextLine();
				if(doorCommand.equals("o") || doorCommand.equals("c"))
						correctinput = true;
				else
				{
					correctinput = false;
					System.out.println("Invalid input");
				}
			}
			doorCommandCheck = new Controller().isOpen(doorCommand);
			
			if(doorCommandCheck == true)
			{
				doorState = "open";
				continueprogram = true;
			}
			else
			{
				doorState = "closed";
				continueprogram = false;
				System.out.println("Open the door to start inspection");
				
			}
			
			System.out.println ("The door is " + doorState);
			
		}
		
		continueprogram = false;
		while(continueprogram == false)
		{
			correctinput = false;
			while(correctinput == false)
			{		
				System.out.println ("Press 'c' to close door");
				doorCommand = s.nextLine();
				if(doorCommand.equals("o") || doorCommand.equals("c"))
					correctinput = true;
				else
				{
					correctinput = false;
					System.out.println("Invalid input");
				}
			}
			doorCommandCheck = new Controller().isOpen(doorCommand);
			
			if(doorCommandCheck == true)
			{
				doorState = "open";
				continueprogram = false;
				System.out.println("Close the door to start inspection");
			}
			else
			{
				doorState = "closed";
				continueprogram = true;
			}
			
			
			System.out.println ("The door is " + doorState);
		}
		
		
	//	continueprogram = false;
	//	while(continueprogram == false)
	//	{
			System.out.println ("Enter vehicle license number:");
			licenseNumber = s.nextLine();
			licensevalidation = new Controller().enterVehicleInfo(licenseNumber);

	/*		if(licensevalidation == true)
			{
				licenseNumberValid = "valid";
				continueprogram = true;
			}
			else
			{
				licenseNumberValid = "invalid";
				continueprogram = false;
			} */
			
			System.out.println ("The licenseNumber is true"); 
	//	}
		
		continueprogram = false;
		
		while(continueprogram == false)
		{
			System.out.println("Your inspection payment is " + new Controller().cashToPay + " dollars");
			
			System.out.println ("Do you want pay with cash or credit? (cash/credit)");
			payment = s.nextLine();
			
			if(payment.equals("cash") || payment.equals("Cash"))
			{
			
				while(continueprogram == false)
				{
					
					System.out.println("How much do you want to pay? (in dollar bills)");
					
					continueprogram = false;
					while(continueprogram == false)
					{
					boolean isNumber;
					do {
						if (s.hasNextInt())
						{
							payCash = s.nextInt();
							isNumber = true;
							
							updateCashRegister = new Controller().canCashRegisterPayChangeCheck(payCash);
							totalChange = new Controller().payWithCash(payCash);
							
							if(updateCashRegister == true)
							{
								continueprogram = true;
							}
							else
							{
								System.out.println("Our cash register doesn't have enought cash for change, please pay with a lower amount!");
								continueprogram = false;
							}
						}
						
						else
						{
							System.out.println("Your payment is invalid or our cash register doesn't have enought cash for change, please try again!");
							isNumber = false;
							s.next();
						
						}
						
					}while(!(isNumber));
					}
					s.nextLine();
					
					if (totalChange >= 0)
					{
						System.out.println("Payemt Complete\n"
								+ "");
						 new Controller().cashReceipt(licenseNumber, new Controller().cashToPay, payCash, totalChange);
						continueprogram = true;
						System.out.println("-----------------------------------------");
						System.out.println("Total amount cash in CashRegister is: " + new Controller().cashLeftInRegister);
						

					}
					
					else
					{
						 System.out.println("You have not paid enough money, please try again");
						 continueprogram = false;
					}
				}
				
			}
			
			else if(payment.equals("credit") || payment.equals("Credit"))
			{
				while(continueprogram == false)
			    {
			     System.out.println("Enter your credit card info:");
			     
			     
			     correctinput = false;
			     while (correctinput == false)
			     {
			      creditCardInfo = s.nextLine();
			      
			      if(creditCardInfo.length() == 16)
			       correctinput = true;
			      else
			       System.out.println("Your credit card info  is invalid, try again!");
			     }
			     
			     System.out.println("Enter your pin code:");
			     
			     correctinput = false;
			     while (correctinput == false)
			     {
			      creditCardPin = s.nextLine();
			      
			      if(creditCardPin.length() == 4)
			       correctinput = true;
			      else
			       System.out.println("Your credit card pin  is invalid, try again!");
			     }
			     
			     creditCardValidation = new Controller().sendPaymentAuthorizationRequest(creditCardInfo, creditCardPin);
			     
			     if(creditCardValidation == true)
			     {
			      payment = "Complete";
			      continueprogram = true;
			     new Controller().creditReceipt(creditCardInfo, licenseNumber, new Controller().cashToPay);
			     }
			     else
			     {
			      payment = "invalid";
			      correctinput = false;
			      continueprogram = false;
			     }
			      System.out.println("Payment is " + payment
			        +"\n" );
			    }
			}
			else
				System.out.println("Wrong input, try again!");
		}
			System.out.println("Inspection will start now..." + "\n");
			
			new Controller().parts(inspectionPart);
			
			for(int i = 0; i < 7; i++)
			{
			System.out.println("Inspect:" + inspectionPart[i] + " (pass or fail)");
			inspect[i] = s.nextLine();
			
			continueprogram = false;
				while(continueprogram == false)
				{
					if(inspect[i].equals("fail") || inspect[i].equals("Fail") || inspect[i].equals("pass") || inspect[i].equals("Pass"))
						continueprogram = true;
					
					else
					{
						System.out.println("Wrong input, try again!");
						continueprogram = false;
						inspect[i] = s.nextLine();
					}
				}
		}
			inspectionResults = new Controller().getInspections(inspect);
			new Controller().printout(inspectionResults, inspectionPart);
			
			System.out.println("Thank you for using Emils & Evan's Inspection agency!");
	}
}
