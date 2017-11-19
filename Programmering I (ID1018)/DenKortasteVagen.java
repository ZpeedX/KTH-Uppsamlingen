import java.util.*; // Scanner, Locale


class DenKortasteVagen
{
	// mellanstationer returnerar en vektor med de mellanstationer som finns på den kortaste
	// vägen. Ordningsnummer av den första mellanstationen finns på index 1, och ordningsnummer
	// av den andra mellanstationen på index 2 i vektorn.
/*	public static int[] mellanstationer (double [] a, double[][] b, double [] c)
	{

	}
*/
	// langd returnerar längden av den kortaste vägen.
	public static double langd (double[] a, double[][] b, double[] c)
	{

	double vagLangd = 0;
	double mVagLangd = a[0] + b[0][0] + c[0];

	for(int in = 1; in <= a.length-1; in++)
	{
		for(int i = 1; i <= c.length-1; i++)
		{
		vagLangd = a[in] + b[i][in] + c[in];
		}
		if (vagLangd < mVagLangd)
		mVagLangd = vagLangd;

	}
	return vagLangd;

	}

	public static void main (String[] args)
	{
	double [] a = new double[3];
	double [][] b = new double[3][4];
	double [] c = new double[4];

		a[0] = 1500;
		a[1] = 1200;
		a[2] = 1400;

		for(int i = 0; i <= 3; i++)
		b[0][i] = 500 + (i*100);

		b[1][0] = 600;
		b[1][1] = 500;
		b[1][2] = 600;
		b[1][3] = 700;
		b[2][0] = 700;
		b[2][1] = 500;
		b[2][2] = 600;
		b[2][3] = 700;

		c[0] = 1350;
		c[1] = 1200;
		c[2] = 1400;
		c[3] = 1500;

		System.out.println("Minsta langd: " + langd(a, b, c));
	}
}