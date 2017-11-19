package model;

public class WrongLicenseNumberException extends Exception{

	public WrongLicenseNumberException(String message, Exception rootCause)
	{
		super(message, rootCause);
	}
}
