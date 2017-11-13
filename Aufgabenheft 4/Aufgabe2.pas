{$B+}
{$R+}

{Gegeben seien folgende Typdefinitionen für einen Binärbaum von natürlichen Zahlen:}

type
  tNatZahl = 1..maxint;
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               Wert:tNatZahl;
               links:tRefBinBaum;
               rechts:tRefBinBaum
             end;
{Schreiben Sie eine rekursive Funktion, die einen Binärbaum mit mindestens zwei Knoten übergeben bekommt und den gesamten Baum durchläuft. 
Dabei entscheidet Ihre Funktion ob der Wert jedes Blattes des Baumes größer ist als jeder der Werte der Knoten auf dem Pfad von der Wurzel zu diesem Blatt. 
Neben dem üblichen Zeiger auf die Baumwurzel ist ein weiterer Übergabeparameter erforderlich. 
Kommentieren Sie, mit welchem Wert dieser beim ersten Aufruf zu belegen ist.

Als Beispiel betrachten wir die folgenden zwei Binärbäume: Der linke Baum erfüllt die Bedingung, während der rechte Baum die Bedingung verletzt.}

program TesteBlattMax (input, output);

type
  tNatZahl = 1..maxint;
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               Wert:tNatZahl;
               links:tRefBinBaum;
               rechts:tRefBinBaum
             end;
           
var
  Wurzel : tRefBinBaum;
  blaetterSindMax : Boolean;
  
function BlattMax ( inRefWurzel : tRefBinBaum; inPfadMax : tNatZahl) : Boolean;
  { prüft ob alle Blätter des Baumes die Maxima der Pfade zu ihnen sind }














begin
    
end;

procedure BaumAufbauen (var outWurzel : tRefBinBaum) ;
  var 
    index,
    Zahl : integer;
    elter, neuerKnoten : tRefBinBaum;    
     
  function KnotenVonIndex (baum : tRefBinBaum; index : integer) : tRefBinBaum;
    var
      elter : tRefBinBaum;
    begin
      if (index = 1) then
        KnotenVonIndex := baum
      else
      begin
        elter := KnotenVonIndex(baum, index div 2);
        if ( (index mod 2 ) = 0 ) then
          KnotenVonIndex := elter^.links
        else
          KnotenVonIndex := elter^.rechts
      end;
    end;{ KnotenVonIndex }

  begin
    read (index);
    new (outWurzel);
    read (Zahl);
    outWurzel^.Wert := Zahl;
    outWurzel^.links := nil;
    outWurzel^.rechts := nil;
    read (index);
    while (index <> 0) do
    begin            
      elter := KnotenVonIndex(outWurzel, index div 2);
      new (neuerKnoten);
      read (Zahl);    
      neuerKnoten^.Wert := Zahl;  
      neuerKnoten^.links := nil;
      neuerKnoten^.rechts := nil;
      if ( (index mod 2 ) = 0 ) then
        elter^.links := neuerKnoten
      else
        elter^.rechts := neuerKnoten;
      read (index);      
    end;    
  end; { BaumAufbauen }

begin
  writeln('Bitte Baum in level-order eingeben Eingabeformat: Immer erst der Index eines Knotens, dann dessen Wert:');
  BaumAufbauen (Wurzel);
  blaetterSindMax := BlattMax(Wurzel, 1);
  if blaetterSindMax then
    writeln ('Alle Blaetter sind groesser als alle Knoten auf den jeweiligen Pfaden zu ihnen.')
  else
    writeln ('Mind. ein Blatt ist nicht groesser als alle Knoten auf seinem Pfad.');

end. { TesteBBKnotenzahl }
