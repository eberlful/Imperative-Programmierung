{$B+}
{$R+}

program Aufgabe5 (output,input);

type
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               info : integer;
               links,
               rechts : tRefBinBaum
             end;

{Die Prozedur SymAusgabe soll die Knoteninhalte in der symmetrischen Reihenfolge (inorder) ausgegeben. 
(Hinweis: der Begriff symmetrische Reihenfolge wird im Skript erklärt.)
Beispiel: Für den binären Baum

Bild: Aufgabe5.png

sind die Knotenwerte in der symmetrischen Reihenfolge: 1, 3, 4, 6, 8.

Welche der fünf folgenden Varianten geben die Knotenwerte für beliebige Binärbäume in der symmetrischen Reihenfolge aus?}

{
    [A]
}
var
auswahl : char;
refBaumKnoten, refBaumBlatt1, refBaumBlatt2, refBaumBlatt3, refBaumBlatt4 : tRefBinBaum;

procedure SymAusgabeA (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
     write (inRefWurzel^.info);
     if inRefWurzel^.links <> nil  then
       SymAusgabeA(inRefWurzel^.links);
     if inRefWurzel^.rechts <> nil then
       SymAusgabeA(inRefWurzel^.rechts)
  end
end; {SymAusgabe}


{
    [B]
}


procedure SymAusgabeB (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel^.links <> nil  then
    SymAusgabeB(inRefWurzel^.links);
  write(inRefWurzel^.info);
  if inRefWurzel^.rechts <> nil then
    SymAusgabeB(inRefWurzel^.rechts)
end; {SymAusgabe}


{
    [C]
}


procedure SymAusgabeC (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in 
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    SymAusgabeC(inRefWurzel^.links);
    write (inRefWurzel^.info);
    SymAusgabeC(inRefWurzel^.rechts)
  end
end; {SymAusgabe}



{
    [D]
}


procedure SymAusgabeD (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in 
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    if inRefWurzel^.links <> nil  then
      SymAusgabeD(inRefWurzel^.links);
    if inRefWurzel^.rechts <> nil then
      SymAusgabeD(inRefWurzel^.rechts);
  write (inRefWurzel^.info)
  end
end; {SymAusgabe}



{
    [E]
}


procedure SymAusgabeE (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    if inRefWurzel^.links <> nil  then
      SymAusgabeE(inRefWurzel^.links);

    write (inRefWurzel^.info);
    if inRefWurzel^.rechts <> nil then
      SymAusgabeE(inRefWurzel^.rechts)
  end
end; {SymAusgabe}

begin
  writeln('Geben Sie eine Auswahl ein (A-E)');
  readln(auswahl);
  
  new (refBaumKnoten);
  new (refBaumBlatt1);
  new (refBaumBlatt2);
  new (refBaumBlatt3);
  new (refBaumBlatt4);

  refBaumKnoten^.info := 6;
  refBaumKnoten^.rechts := refBaumBlatt2;
  refBaumKnoten^.links := refBaumBlatt1;

  refBaumBlatt1^.info := 3;
  refBaumBlatt1^.rechts := refBaumBlatt3;
  refBaumBlatt1^.links := refBaumBlatt4;

  refBaumBlatt2^.info := 8;
  refBaumBlatt2^.rechts := nil;
  refBaumBlatt2^.links := nil;

  refBaumBlatt3^.info := 1;
  refBaumBlatt3^.rechts := nil;
  refBaumBlatt3^.links := nil;

  refBaumBlatt4^.info := 4;
  refBaumBlatt4^.rechts := nil;
  refBaumBlatt4^.links := nil;

  if (auswahl = 'A') or (auswahl = 'a') then
  begin
    SymAusgabeA(refBaumKnoten);
  end;

  if (auswahl = 'B') or (auswahl = 'b') then
  begin
    SymAusgabeB(refBaumKnoten);
  end;

  if (auswahl = 'C') or (auswahl = 'c') then
  begin
    SymAusgabeC(refBaumKnoten);
  end;

  if (auswahl = 'D') or (auswahl = 'd') then
  begin
    SymAusgabeD(refBaumKnoten);
  end;

  if (auswahl = 'E') or (auswahl = 'e') then
  begin
    SymAusgabeE(refBaumKnoten);
  end;  
end.