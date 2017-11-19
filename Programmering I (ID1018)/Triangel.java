import java.util.*; // Scanner, Locale

class Triangel
{

	public static double semiper (double a, double b, double c)
	{
	double s = (a + b + c)/2;

	return s;
	}

	public static double tresid (double a, double b, double c)
	{

	double s = semiper(a , b, c);
	double area = Math.sqrt(s*(s-a)*(s-b)*(s-c));

	return area;

	}
	public static double area (double h, double b)
	{
	double ar = (h * b)/2;
	return ar;
	}

	// bisektris tar emot två sidor i en triangel och vinkeln (i radianer) mellan dessa sidor.
	// Metoden returnerar längden av den motsvarande bisektrisen - den som delar den givna vinkeln
	// i två lika delar.
	public static double bisektris (double b, double c, double alfa)
	{
	double p = 2 * b * c * Math.cos (alfa / 2);
	double bis = p / (b + c);
	return bis;
	}


	public static void main (String[] args)
	{
	System.out.println ("TRIANGEL\n");

	// inmatningsverktyg
	Scanner in = new Scanner (System.in);
	in.useLocale (Locale.US);

	double [] tal = new double [6];


	System.out.println ("1 area av tre sidor\n" + "2 Area av höjd och bredd\n" + "3 bisektris\n" + "4 bisketris av alla sidor");
	int val = in.nextInt ();

	switch (val)
	{
	case 1:
	for (int inmatning = 0; inmatning <= 2; inmatning++)
	{
	System.out.println ("Skriv in sida " + (inmatning+1) + ":");
	tal[inmatning] = in.nextDouble ();
	}

	System.out.println ("Area: " + tresid(tal[0], tal[1], tal[2]));
	break;

	case 2:
	System.out.println ("Skriv in höjd och bredd: ");
	for (int inmatning = 0; inmatning <= 1; inmatning++)
	tal[inmatning] = in.nextDouble ();

	System.out.println ("Area: " + area(tal[0], tal[1]));
	break;

	case 3:
	System.out.println ("Skriv in de två första sidorna och sedan vinkeln: ");
	for (int inmatning = 0; inmatning <= 2; inmatning++)
	tal[inmatning] = in.nextDouble ();

	System.out.println ("Bisektris: " + bisektris (tal[0], tal[1], tal[2]));
	break;


	case 4:
	System.out.println ();
	for (int inmatning = 0; inmatning <= 5; inmatning++)
	{
	if (0 <= inmatning && inmatning <= 2)
	System.out.println ("Mata in sida " + (inmatning+1) + " :");

	if (inmatning == 3)
	System.out.println ("Mata in vinkel 1 för sida 1 och 2: ");
	if (inmatning == 4)
	System.out.println ("Mata in vinkel 2 för sida 2 och 3: ");
	if (inmatning == 5)
	System.out.println ("Mata in vinkel 3 för sida 1 och 3: ");

	tal[inmatning] = in.nextDouble ();

	}
	System.out.println ("Bisektris 1: " + bisektris (tal[0], tal[1], tal[3]));
	System.out.println ("Bisektris 2: " + bisektris (tal[1], tal[2], tal[4]));
	System.out.println ("Bisektris 3: " + bisektris (tal[0], tal[2], tal[5]));
	break;
	default:

	System.out.println("Valet finns inte");
	break;

}
}
}


