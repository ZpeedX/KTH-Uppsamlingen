
public class PolylinjeIterator
{
 private int aktuell = -1;
 private Polylinje polylinje;

 public PolylinjeIterator(Polylinje polylinje)
 {
  if(polylinje.getHorn().length > 0)
  {
   aktuell = 0;
   this.polylinje = new Polylinje(polylinje.getHorn(), polylinje.getFarg());
  }
 }

 public boolean finnsHorn()
 {
  return aktuell != -1;
 }

 public Punkt horn() throws java.util.NoSuchElementException
 {
  if(!this.finnsHorn()) {
   throw new java.util.NoSuchElementException("Slut av iterationen.");
  }

  Punkt horn = polylinje.getHorn()[aktuell];

  return horn;
 }

 public void gaFram()
 {
  if(aktuell >= 0 && aktuell < polylinje.getHorn().length - 1)
  {
   aktuell++;
  }else
  {
   aktuell = -1;
  }
 }
}