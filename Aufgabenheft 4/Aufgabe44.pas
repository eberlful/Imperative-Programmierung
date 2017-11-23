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
var
zustandLinks, zustandRechts, uebergabe, ersterDurchlauf : boolean;

begin
  uebergabe := false;
  zustandLinks := true;
  zustandRechts := true;
  ersterDurchlauf := false;

  if inRefWurzel^.links <> nil then
  begin

    {Uebergibt das groessere Element}
    if (inRefWurzel^.Wert > inPfadMax) then
    begin
      writeln('Springe in linkes Element mit Uebergabeparameter: ', inRefWurzel^.Wert, ' ist groesser als ', inPfadMax);
      zustandLinks := BlattMax(inRefWurzel^.links, inRefWurzel^.Wert);
      writeln(zustandLinks, ' wurde von linkem Element uebergeben');
    end
    else
    begin
      writeln('Springe in linkes Element mit Uebergabeparameter: ', inPfadMax, ' ist groesser als ', inRefWurzel^.Wert);
      zustandLinks := BlattMax(inRefWurzel^.links, inPfadMax);
      writeln(zustandLinks, ' wurde von linkem Element uebergeben');
    end;
  end;
  writeln('Abschnitt 1');
  if inRefWurzel^.rechts <> nil then
  begin
    {Uebergibt das groessere Element}
    if (inRefWurzel^.Wert > inPfadMax) then
    begin
      writeln('Springe in rechtes Element mit Uebergabeparameter: ', inRefWurzel^.Wert, ' ist groesser als ', inPfadMax);
      zustandRechts := BlattMax(inRefWurzel^.rechts, inRefWurzel^.Wert);
      writeln(zustandRechts, ' wurde von rechtem Element uebergeben');
    end
    else
    begin
      writeln('Springe in rechtes Element mit Uebergabeparameter: ',inPfadMax , ' ist groesser als ', inRefWurzel^.Wert);
      zustandRechts := BlattMax(inRefWurzel^.rechts, inPfadMax);
      writeln(zustandRechts, ' wurde von rechtem Element uebergeben');
    end;
  end;
  writeln('Abschnitt 2');
  if (zustandLinks = false) or (zustandRechts = false) then
  begin
    writeln('links und rechts false');
    BlattMax := false;
    uebergabe := true;
  end;
  writeln('Abschnitt 3');
  {Springt nur bei letztem Element in diese Abfrage}
  if (inRefWurzel^.links = nil) and (inRefWurzel^.rechts = nil) then
  begin
  {Vergleicht letztes Element mit Vorgaenger}
    ersterDurchlauf := true;
    if (inPfadMax < inRefWurzel^.Wert) then
    begin
      writeln('letztes Element ist richtig weil Blatt: ', inRefWurzel^.Wert, ' ist groesser als ', inPfadMax);
      BlattMax := true;
      uebergabe := true;
    end
    else
    begin
      writeln('letztes Element ist falsch weil Blatt: ', inRefWurzel^.Wert, ' ist kleiner als ', inPfadMax);
      BlattMax := false;
      uebergabe := true;
    end;    
  end;
  writeln('Abschnitt 4');
  {Uberprueft ob beide Knoten richtig sind}
  if (zustandRechts = true) and (zustandLinks = true) and (uebergabe = false) and (ersterDurchlauf = false) then
  begin
    writeln('Beide Knoten waren richtig, uebergebe true');
    BlattMax := true;
    uebergabe := true;
  end;
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
    end;

  begin
    read (index);

    new (outWurzel);
    read (Zahl);
    outWurzel^.Wert := Zahl;

    read (index);
    while (index <> 0) do
    begin            
      elter := KnotenVonIndex(outWurzel, index div 2);
       
      new (neuerKnoten);
      read (Zahl);    
      neuerKnoten^.Wert := Zahl;  

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