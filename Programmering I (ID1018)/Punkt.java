

public class Punkt
{
	//namn variabel
	private String namn;
	//kort
	private int x;
	private int y;

	// konstruktor  som deklararerar namn, x och y
	public Punkt (String namn, int x, int y)
	{
		this.namn = namn;
		this.x = x;
		this.y = y;
	}
	// konstruktor som deklararerar namn, x och y med bara en variabel
	public Punkt (Punkt p)
	{
		this.namn = p.namn;
		this.x = p.x;
		this.y = p.y;
	}
	//retunerar ut namn, x och y som string
	public String toString()
	{
		return "(" + namn + " " + x + " " + y + ")";
	}
	//returnerar namn
	public String getNamn ()
	{
		return namn;
	}
	//returnerar x koortinaten
	public int getX ()
	{
		return x;
	}
	//returnerar y koortdinaten
	public int getY ()
	{
		return y;
	}
	//returnerar avstånd mellan första och andra punkten
	public double avstand (Punkt p)
	{
		return Math.sqrt((p.x - this.x) * (p.x - this.x) + (p.y - this.y) * (p.y - this.y));
	}
	//metoden returnerar om punk1 och punk2 är lika
	public boolean equals (Punkt p)
	{
		boolean d = false;

		if (p.namn.equals(this.namn) && p.x == this.x && p.y == this.y)
		d = true;

		return d;
	}

	//ersätter  gamla x med nya x
	public void setX (int x)
	{
		this.x = x;
	}
	//ersätter  gamla y med nya y
	public void setY (int y)
	{
		this.y = y;
	}
	// andvänds i uppgift b
	 public String stringRepresentation()
	 {
	  StringBuilder sBuilder = new StringBuilder();
	  sBuilder.append(this.namn + " ");
	  sBuilder.append(this.x + " ");
	  sBuilder.append(this.y);
	  return sBuilder.toString();
 }
}