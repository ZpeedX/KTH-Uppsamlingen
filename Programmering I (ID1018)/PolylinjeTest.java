public class PolylinjeTest
{
 public static void main(String[] args)
 {
  Punkt[] punktVektor = {new Punkt("A", 1, 1), new Punkt("C", 3, 3)};
  Polylinje polyLinje = new Polylinje(punktVektor, "svart");
  System.out.println(polyLinje.stracka());
  polyLinje.laggTillFramfor(new Punkt("B", 2, 2), "C");
  System.out.println(polyLinje.stringRepresentation());

  // Uppgift D - gå igenom en Polylinje
  // Gå fram med PolylinjeIterator
  while(polyLinje.finnsHorn())
  {
   System.out.println(polyLinje.horn().stringRepresentation());
   polyLinje.gaFram();
  }
 }
}