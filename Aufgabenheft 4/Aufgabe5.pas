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
refBaumKnoten6, refBaumBlatt1, refBaumBlatt3, refBaumBlatt4, refBaumBlatt8 : tRefBinBaum;

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
  
  new (refBaumKnoten6);
  new (refBaumBlatt3);
  new (refBaumBlatt8);
  new (refBaumBlatt1);
  new (refBaumBlatt4);

  refBaumKnoten6^.info := 6;
  refBaumKnoten6^.rechts := refBaumBlatt8;
  refBaumKnoten6^.links := refBaumBlatt3;

  refBaumBlatt3^.info := 3;
  refBaumBlatt3^.rechts := refBaumBlatt4;
  refBaumBlatt3^.links := refBaumBlatt1;

  refBaumBlatt8^.info := 8;
  refBaumBlatt8^.rechts := nil;
  refBaumBlatt8^.links := nil;

  refBaumBlatt1^.info := 1;
  refBaumBlatt1^.rechts := nil;
  refBaumBlatt1^.links := nil;

  refBaumBlatt4^.info := 4;
  refBaumBlatt4^.rechts := nil;
  refBaumBlatt4^.links := nil;

  if (auswahl = 'A') or (auswahl = 'a') then
  begin
    SymAusgabeA(refBaumKnoten6);
  end;

  if (auswahl = 'B') or (auswahl = 'b') then
  begin
    SymAusgabeB(refBaumKnoten6);
  end;

  if (auswahl = 'C') or (auswahl = 'c') then
  begin
    SymAusgabeC(refBaumKnoten6);
  end;

  if (auswahl = 'D') or (auswahl = 'd') then
  begin
    SymAusgabeD(refBaumKnoten6);
  end;

  if (auswahl = 'E') or (auswahl = 'e') then
  begin
    SymAusgabeE(refBaumKnoten6);
  end;  
end.