import java.util.*; // Scanner
import static java.lang.System.out;


class OperationerMedNaturligaHeltalGivnaSomTeckenstrangar
{
	public static void main (String[] args)
	{
		out.println ("OPERATIONER MED NATURLIGA HELTAL GIVNA SOM TECKENSTRANGAR\n");
		// mata in två naturliga heltal
		Scanner in = new Scanner (System.in);
		out.println ("två naturliga heltal:");
		String tal1 = in.next ();
		String tal2 = in.next ();
		out.println ();

		// addera heltalen och visa resultatet
		String summa = addera (tal1, tal2);
		visa (tal1, tal2, summa, '+');
		// subtrahera heltalen och visa resultatet
		String differens = subtrahera (tal1, tal2);
		visa (tal1, tal2, differens, '-');
		}

	// addera tar emot två naturliga heltal givna som teckensträngar, och returnerar deras
	// summa som en teckensträng.
	public static String addera (String tal1, String tal2)
	{
		int n = tal1.length();
		int m = tal2.length();
		int max = Math.max(m,n);
		int min = Math.min(m,n);
		int skillnad = max-min;
		int [] minne = new int[max];
		int [] minne1 = new int[max];
		int [] sumtotal = new int[max];
		String summa = "";
		String[] numbers = tal1.split("");
		String[] numbers1 = tal2.split("");

		for(int tal = 0; tal <= max -1; tal++)
		{
			if (n>m)
			{
				minne[tal] = Integer.parseInt(numbers[tal]);

				if(tal <= skillnad-1)
					minne1[tal] = 0;

				if(tal > skillnad-1)
				minne1[tal] = Integer.parseInt(numbers1[tal-skillnad]);
			}
			if (m>n)
			{
				 minne1[tal] = Integer.parseInt(numbers1[tal]);

				if(tal <= skillnad-1)
				minne[tal] = 0;

				if(tal > skillnad-1)
				minne[tal] = Integer.parseInt(numbers[tal-skillnad]);
			}
			if (skillnad == 0)
			{
				minne[tal] = Integer.parseInt(numbers[tal]);
				minne1[tal] = Integer.parseInt(numbers1[tal]);
			}

		sumtotal[tal] = minne[tal] + minne1[tal];
		}

		for(int tal = 0; tal <= max -1; tal++)
		{
			for(int talet = 0; talet <= max -1; talet++)
			{
				if(sumtotal[talet] > 9 && talet > 0)
				{
				sumtotal[talet] = sumtotal[talet] - 10;
				sumtotal[talet-1] = sumtotal[talet-1] + 1;
				}
			}
		}

		for(int tal = 0; tal <= max -1; tal++)
		{
			summa += Integer.toString(sumtotal[tal]);
		}

		return summa.replaceFirst("^0+(?!$)", "");

				/*StringBuilder tal = new StringBuilder ("");

				int siffra1 = 0;
				int siffra2 = 0;
				int siffra = 0;
				int minnessiffra = 0;
				int sum = 0;
				int pos1 = tal1.length() - 1;
				int pos2 = tal2.length() - 1;
				int max = Math.max(pos1, pos2);
				int min = Math.min(pos1, pos2);
				int medel = max - min;

				while (pos1 >= 0 && pos2 >= 0)
				{
					siffra1 = tal1.charAt(pos1) + (-48);
					siffra2 = tal2.charAt(pos2) + (-48);
					sum = minnessiffra + siffra1 + siffra2;
					siffra = sum % 10;
					tal.insert(0, siffra);
					minnessiffra = sum / 10;

					pos1--;
					pos2--;

				}

		if(minnessiffra > 0)
		tal.insert(0, minnessiffra);

		return tal.toString();*/
	}


	// subtrahera tar emot två naturliga heltal givna som teckensträngar, och returnerar
	// deras differens som en teckensträng.
	// Det första heltalet är inte mindre än det andra heltalet.
	public static String subtrahera (String tal1, String tal2)
	{
		/*int n = tal1.length();
		int m = tal2.length();
		int max = Math.max(m,n);
		int min = Math.min(m,n);
		int skillnad = max-min;
		int [] minne = new int[max];
		int [] minne1 = new int[max];
		int [] subtotal = new int[max];
		String [] diff = new String[max];
		String differens = "";
		String[] numbers = tal1.split("");
		String[] numbers1 = tal2.split("");


		for(int tal = 0; tal <= max -1; tal++)
		{
			if (n>m)
			{
				minne[tal] = Integer.parseInt(numbers[tal]);

				if(tal <= skillnad-1)
				minne1[tal] = 0;

				if(tal > skillnad-1)
				minne1[tal] = Integer.parseInt(numbers1[tal-skillnad]);
			}

			else
			{
				minne[tal] = Integer.parseInt(numbers[tal]);
				minne1[tal] = Integer.parseInt(numbers1[tal]);
			}
		subtotal[tal] = minne[tal] - minne1[tal];
	 }

	for(int talet = 0; talet <= max -1; talet++)
	{
		for(int tal = 0; tal <= max -1; tal++)
		{
			if(subtotal[tal] < 0 && tal > 0)
			{
			subtotal[tal] = subtotal[tal] + 10;
			subtotal[tal-1] = subtotal[tal-1] - 1;
			}
		}
	}




	for(int tal = 0; tal <= max -1; tal++)
	{
		diff[tal] = Integer.toString(subtotal[tal]);

		differens += diff[tal];
	}
	return differens.replaceFirst("^0+(?!$)", "");
	}*/

	StringBuilder tal = new StringBuilder ("");
	int siffra1 =0;
	int siffra2 =0;
	int siffra = 0;
	boolean lan = false;
	int pos1 = (tal1.length() - 1);
	int pos2 = (tal2.length() - 1);

	while (pos1 >= 0 && pos2 >= 0)
	{
		siffra1 = tal1.charAt(pos1) + (-48);
		siffra2 = tal2.charAt(pos2) + (-48);

		if(lan)
		{
			if (siffra1 > 0)
			{
				siffra1--;
				lan = false;
			}
			else
			{
				siffra1 = 10 - 1;
				lan = true;
			}
		}
		if (siffra1 >= siffra2)
		siffra = siffra1 - siffra2;

		else
		{
			siffra = (siffra1 + 10) -siffra2;
			lan = true;
		}

		pos1--;
		pos2--;

		tal.insert(0 ,siffra);
	}

	while (pos1 >= 0)
	{
		siffra1 = tal1.charAt(pos1) + (-48);

		if(lan)
		{
					if (siffra1 > 0)
					{
						siffra1--;
						lan = false;
					}
					else
					{
						siffra1 = 10 - 1;
						lan = true;
					}
		}
		siffra = siffra1;
		tal.insert(0, siffra);

		pos1--;
	}
	return (tal.toString()).replaceFirst("^0+(?!$)", "");
}

	// visa visar två givna naturliga heltal, och resultatet av en aritmetisk operation
	// utförd i samband med hetalen
	public static void visa (String tal1, String tal2, String resultat, char operator)
	{
		// sätt en lämplig längd på heltalen och resultatet
		int len1 = tal1.length ();
		int len2 = tal2.length ();
		int len = resultat.length ();
		int maxLen = Math.max (Math.max (len1, len2), len);
		tal1 = sattLen (tal1, maxLen - len1);

		tal2 = sattLen (tal2, maxLen - len2);
		resultat = sattLen (resultat, maxLen - len);
		// visa heltalen och resultatet
		out.println (" " + tal1);
		out.println ("" + operator + " " + tal2);
		for (int i = 0; i < maxLen + 2; i++)
		out.print ("-");
		out.println ();
		out.println (" " + resultat + "\n");
	}

	// sattLen lägger till ett angivet antal mellanslag i början av en given sträng
	public static String sattLen (String s, int antal)
	{
		StringBuilder sb = new StringBuilder (s);
		for (int i = 0; i < antal; i++)
		sb.insert (0, " ");
		return sb.toString ();
	}
}
