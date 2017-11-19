import java.util.*; // Scanner, Locale

class EnTriangelOchDessCirklar
{
	public static double InskrivnaCirkeln (double a, double b, double c)
	{
	double s = Triangel.semiper(a , b, c);
	double r = Math.sqrt(((s-a)*(s-b)*(s-c))/s);
	return r;
	}

    public static double OmskrivnaCirkeln (double a, double b, double c)
	{
	double r = (a * b * c)/(4 * Triangel.tresid(a, b, c));
	return r;
    }

	public static void main (String[] args)
	{

	// inmatningsverktyg
	Scanner in = new Scanner (System.in);
	in.useLocale (Locale.US);

	double [] tal = new double [3];

	for (int inmatning = 0; inmatning <= 2; inmatning++)
	{
		System.out.println ("Skriv in sida " + (inmatning+1) + ":");
		tal[inmatning] = in.nextDouble ();
	}
	System.out.println("Radien for omskrivna cirkeln är: " + OmskrivnaCirkeln(tal[0], tal[1], tal[2]));
	System.out.println("Radien for inskrivna cirkeln är: " + InskrivnaCirkeln(tal[0], tal[1], tal[2]));



}
}
