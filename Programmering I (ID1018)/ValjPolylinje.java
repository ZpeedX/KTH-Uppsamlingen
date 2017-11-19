import java.util.Random;

public class ValjPolylinje
{

 public static void main(String[] args)
 {
  ValjPolylinje test = new ValjPolylinje();
 }

 public ValjPolylinje()
 {
  // Skapar en vektor med slumpmässigt genererade Polylinjer.
  Polylinje[] randomPolylinjeVektor = generateRandomPolylinjeVektor();

  // Skriver ut _alla_ Polylinjer & deras information
  printInfo(randomPolylinjeVektor);

  try
  {
   // Skriver ut den kortaste gula Polylinjens sträcka
   System.out.println("\n Kortaste sträcka: " +
     findKortasteGulaPolylinje(randomPolylinjeVektor).stracka());
  }catch(NullPointerException e)
  {
   System.out.println(e.getMessage());
  }
 }

 // Skriver ut information om alla Punkter & Polylinjer
 public void printInfo(Polylinje[] polyVektor)
 {
  for(int i = 0; i < polyVektor.length; i++)
  {
   System.out.println(" \n Polylinje #" + (i + 1) + ": " + polyVektor[i].stringRepresentation());
  }
 }

 // Genererar en Polylinj[] fylld med Polylinjer vars
 // egenskaper är slumpade.
 public Polylinje[] generateRandomPolylinjeVektor()
 {
  // for loop som kallar generateRandomPolylinje och
  // lägger den i en array samt returnar
  Polylinje[] polyLinjer = new Polylinje[2];
  for(int i = 0; i < polyLinjer.length; i++)
  {
   polyLinjer[i] = generateRandomPolylinje();
  }
  return polyLinjer;
 }

 // Skapar en slumpmässigt genererade Polylinje
 public Polylinje generateRandomPolylinje()
 {
  // Antalet horn på linjen
  int antalPunkter = 2;

  // Skapar en Punkt vektor som håller Punkterna
  Punkt[] punktVektor = new Punkt[antalPunkter];

  for(int i = 0; i < antalPunkter; i++)
  {
   // X koordinat för Punkten
   int x = new Random().nextInt(10) + 1;

   // Y koordinat för Punkten
   int y = new Random().nextInt(10) + 1;

   // Antal bokstäver i linjens namn
   int bokstaver = new Random().nextInt(5) + 1;

   StringBuilder sBuilder = new StringBuilder();
   for(int i2 = 0; i2 < bokstaver; i2++)
   {
    sBuilder.append((char) (new Random().nextInt(25) + 65));
   }

   punktVektor[i] = new Punkt(sBuilder.toString(), x, y);
  }

  int fargKod = 0;
  String farg = "";

  switch(fargKod)
  {
  case 0:
   farg = "gul";
   break;
  case 1:
   farg = "röd";
   break;
  case 2:
   farg = "blå";
   break;
   }

  return new Polylinje(punktVektor, farg);
 }

 // Hittar den kortaste av dem gula polylinjerna &
 // returnerar den kortaste sträckan
 public Polylinje findKortasteGulaPolylinje(Polylinje[] randomPolylinje)
 {
  // Går igenom array:en och kollar av varje
  // polylinje om den är gul; om ja - kolla dess distans
  // om inte fortsätt, gå igenom helt & behåll lägsta sträckan samt
  // index till polylinjen och skriv ut dess info.
  Polylinje[] gulaPolylinjer = sortPolylinjer(randomPolylinje);

  // Sätter första pekaren
  double kortaste = gulaPolylinjer[0].stracka();

  // Index på den kortaste Polylinjen
  int index = 0;

  // Gå igenom alla gula Polylinjer & kolla deras längd (urvalssortering)
  for(int i = 0; i < gulaPolylinjer.length; i++)
  {
   if(gulaPolylinjer[i].stracka() < kortaste)
   {
    kortaste = gulaPolylinjer[i].stracka();
	index = i;
   }
  }

  return gulaPolylinjer[index];
 }

 public Polylinje[] sortPolylinjer(Polylinje[] randomPolylinje) throws NullPointerException
 {
  int antalGula = 0;

  // Räknar antalet gula Polylinjer av dem slump-
  // mässigt genererade.

  for(int i = 0; i < randomPolylinje.length; i++)
  {
   if(randomPolylinje[i].getFarg() == "gul")
   {
    antalGula++;
   }
  }

  if(antalGula == 0)
  {
   throw new NullPointerException("\n Inga gula Polylinjer!");
  }

  Polylinje[] gulaPolylinjer = new Polylinje[antalGula];

  int i2 = 0;

  // Fyller den gulaPolylinjer vektorn med gula polylinjer
  for(int i = 0; i < randomPolylinje.length; i++)
  {
   if(randomPolylinje[i].getFarg() == "gul")
   {
    gulaPolylinjer[i2] = randomPolylinje[i];
    i2++;
   }
  }

  return gulaPolylinjer;
 }
}