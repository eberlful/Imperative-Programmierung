{$B+}
{$R+}

{Die Tiefe eines Knotens in einem Baum entspricht der Pfadlänge von der Wurzel zu diesem Knoten gemessen an der Anzahl der Knoten auf diesem Pfad. 
Beim folgenden binären Baum ist jeder Knoten mit seiner Tiefe gekennzeichnet:

Bild Aufgabe3.png

Schreiben Sie eine rekursive Prozedur BerechneTiefeUndMaxTiefe, 
mit der die Tiefe jedes Knotens in einem gegebenen binären Baum ermittelt und dieser Wert der Recordkomponente Tiefe zugewiesen wird. 
Zudem soll auch die maximale Tiefe des Baumes gefunden werden. 
Benutzen Sie dabei die vorgegebenen Typdeklarationen und den Prozedurkopf für BerechneTiefeUndMaxTiefe. 
Ergänzen Sie im Prozedurkopf die noch unvollständige Deklaration der Prozedurparameter.

Beurteilen Sie, ob es sich um eine sinnvolle Anwendung der Rekursion handelt.}

program testeBerechneTiefeUndMaxTiefe (input, output);
{ testet die Prozedur BerechneTiefeUndMaxTiefe }

  type
  tRefBinbaum = ^tBinbaum;
  tBinBaum = record
           Info,
           Tiefe : integer;
           links,
           rechts : tRefBinBaum;
          end;
  tNatZahl = 0..maxint;

  var
  Wurzel : tRefBinBaum;
  Max : tNatZahl;

 procedure BerechneTiefeUndMaxTiefe (
                  ??RefWurzel : tRefBinBaum;
              ??? ??Tiefe : tNatZahl;
              ??? ??MaxTiefe : tNatZahl);
  { berechnet die Tiefe aller Knoten in einem Binaerbaum, auf
    dessen Wurzel ??RefWurzel zeigt; ??MaxTiefe muss vor dem Aufruf
    mit Null initialisiert sein und liefert die maximale Tiefe }












 procedure BBKnotenEinfuegen (
                  inZahl : integer;
              var ioWurzel : tRefBinBaum);
  { fuegt in den Suchbaum, auf dessen Wurzel ioWurzel
    zeigt, ein Blatt mit Wert inZahl an. }

  var
  Zeiger : tRefBinBaum;

  begin
    if ioWurzel = nil then

    begin
      new (Zeiger);
      Zeiger^.Info := inZahl;
      Zeiger^.links := nil;
      Zeiger^.rechts := nil;
      Zeiger^.Tiefe := 0;
      ioWurzel := Zeiger
    end { if }
    else { ioWurzel <> nil }
      if inZahl < ioWurzel^.info then
        BBKnotenEinfuegen (inZahl, ioWurzel^.links)
      else
        BBKnotenEinfuegen (inZahl, ioWurzel^.rechts);
  end; { BBKnotenEinfuegen }

  procedure BBAufbauen (var outWurzel : tRefBinBaum);
  { Liest eine Folge von Integer-Zahlen ein (0 beendet die
    Eingabe, gehoert aber nicht zur Folge) und speichert
    die Folge in einem binren Suchbaum. }

    var 
    Zahl : integer;

  begin
    outWurzel := nil; { mit leerem Baum initialisieren }
    read (Zahl);
    while Zahl <> 0 do
    begin
      BBKnotenEinfuegen (Zahl, outWurzel);
      read (Zahl)
    end
  end; { BBAufbauen }

  procedure BaumAusgeben(inWurzel : tRefBinBaum);
  { Durchlaeuft den Binaerbaum mit Wurzel inWurzel und gibt
    die Knoteninhalte und Knotentiefen in preorder-Reihenfolge aus. }

    var
    Knoten : tRefBinBaum;

  begin
    if inWurzel <> nil then
    begin
      write (inWurzel^.info, ':', inWurzel^.Tiefe,' ');
      BaumAusgeben (inWurzel^.links);
      BaumAusgeben (inWurzel^.rechts);
      write('u ');
    end; { if }
  end; { BaumAusgeben }


begin
  writeln('Bitte integer-Zahlen eingeben (0=Ende):');
  BBAufbauen (Wurzel);
  Max := 0;
  BerechneTiefeUndMaxTiefe (Wurzel, 1, Max);
  WriteLn('Jetzt wird der Baum in preorder-Reihenfolge durchlaufen und die');
  WriteLn('Knoteninhalte in der Form Knoten:Tiefe ausgegeben.');
  WriteLn('Um die Knotentiefen kontrollieren zu koennen, wird bei jedem ');
  WriteLn('Ruecksprung aus der Prozedur ein "u" ausgegeben.');
  BaumAusgeben (Wurzel);
  writeln ('Maximale Tiefe: ', Max);
end. { testeBerechneTiefeUndMaxTiefe }

{
Handelt es sich um eine sinnvolle Anwendung der Rekursion?
Begruenden Sie Ihre Aussage:





}