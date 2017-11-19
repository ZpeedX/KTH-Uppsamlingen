package vehicleInspection;

import static org.junit.Assert.*;
import model.GarageDoor;
import model.CashRegister;
import model.PaymentAuthorizationSystem;
import model.Display;
import model.Inspections;
import org.junit.Test;

public class ModelTest {
private GarageDoor garageDoor = new GarageDoor();
private CashRegister cashRegister = new CashRegister();
private PaymentAuthorizationSystem paymentAuthorizationSystem = new PaymentAuthorizationSystem();
private Display display = new Display();
private Inspections inspections = new Inspections();
private int cashToPay = new CashRegister().cashToPay;
private boolean garageDoorResults;
private int cashRegisterResults;
private boolean  boolcashRegisterResults;
private boolean creditCardResults;
private int displayResults;
private boolean [] allTrue = new boolean [10];
private boolean [] inspectionResults = new boolean [7];
private String [] inspectionPart = new String [7];
 
@Test
 public void GarageDoorTest() {
  
  garageDoorResults = garageDoor.isOpen("o");
  assertEquals(true, garageDoorResults);
  
  garageDoorResults = garageDoor.isOpen("a");
  assertEquals(false, garageDoorResults);
  
  garageDoorResults = garageDoor.isOpen("1");
  assertEquals(false, garageDoorResults);
  
  garageDoorResults = garageDoor.isOpen("+");
  assertEquals(false, garageDoorResults);
 }
 
 @Test
 public void DisplayTest(){
  displayResults = display.displayNextNumber(true);
  assertEquals((1337), displayResults); 
  
  displayResults = display.displayNextNumber(false);
  assertEquals((1336), displayResults);
 }
 
 @Test
 public void InspectionTest(){
  
  for(int i = 0 ; i < 7; i++)
   inspectionPart[i] = "pass";
  
  inspectionResults = inspections.getInspections(inspectionPart);
  
  for(int i= 0; i < 7; i++)
   assertEquals(true, inspectionResults[i]);
  
  for(int i = 0 ; i < 7; i++)
   inspectionPart[i] = "fail";
  
  inspectionResults = inspections.getInspections(inspectionPart);
  for(int i= 0; i < 7; i++)
   assertEquals(false, inspectionResults[i]);
  
  for(int i = 0 ; i < 7; i++)
   inspectionPart[i] = "notValidInput";
  
  inspectionResults = inspections.getInspections(inspectionPart);
  for(int i= 0; i < 7; i++)
   assertEquals(false, inspectionResults[i]);
 }
 
 @Test
 public void CashRegisterTest() {
  
	 for(int i = 0; i < 10000001; i++)
	 {
  cashRegisterResults = cashRegister.payAndReturnChange(i);
  assertEquals((i - cashToPay), cashRegisterResults);
	 }
	 
	 for(int i = 0; i <= 2000; i++)
	 {
		 boolcashRegisterResults = cashRegister.canCashRegisterPayChangeCheck(i);
		  assertEquals(true, boolcashRegisterResults);
	 }
	 
	 for(int i = 0; i > 2000; i++)
	 {
		 boolcashRegisterResults = cashRegister.canCashRegisterPayChangeCheck(i);
		  assertEquals(false, boolcashRegisterResults);
	 }
 }
 
 @Test
 public void PaymentAuthorizationSystemTest(){
  String testing = "1";
  for(int i= 0; i <14; i++)
  {
   creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest(testing += "1", "7778");
   assertEquals(false, creditCardResults);
  }
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("1234123412341234", "7778");
  assertEquals(true, creditCardResults);
  
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("15642", "7778");
  assertEquals(false, creditCardResults);
  
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("1564233534630424", "778");
  assertEquals(false, creditCardResults);
  
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("1564233534630", "778");
  assertEquals(false, creditCardResults);
  
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("15642335a630", "7a78");
  assertEquals(false, creditCardResults);
  
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("15642335a630", "778");
  assertEquals(false, creditCardResults);
  
  creditCardResults = paymentAuthorizationSystem.sendPaymentAuthorizationRequest("15642335346304a4", "1a11");
  assertEquals(false, creditCardResults);
  
	 for(int i = 0; i < 10;i++)
	 {
		 allTrue[i] = true;
	 }
	  creditCardResults = paymentAuthorizationSystem.areAllTrue(allTrue);
	  assertEquals(true, creditCardResults);
	  
		 for(int i = 0; i < 10;i++)
		 {	
			 if(i < 4)
			 allTrue[i] = true;
			 else
				 allTrue[i] = false; 
		 }
		  creditCardResults = paymentAuthorizationSystem.areAllTrue(allTrue);
		  assertEquals(false, creditCardResults);
 }
}