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

procedure SymAusgabe (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
     write (inRefWurzel^.info);
     if inRefWurzel^.links <> nil  then
       SymAusgabe(inRefWurzel^.links);
     if inRefWurzel^.rechts <> nil then
       SymAusgabe(inRefWurzel^.rechts)
  end
end; {SymAusgabe}


{
    [B]
}


procedure SymAusgabe (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel^.links <> nil  then
    SymAusgabe(inRefWurzel^.links);
  write(inRefWurzel^.info);
  if inRefWurzel^.rechts <> nil then
    SymAusgabe(inRefWurzel^.rechts)
end; {SymAusgabe}


{
    [C]
}


procedure SymAusgabe (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in 
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    SymAusgabe(inRefWurzel^.links);
    write (inRefWurzel^.info);
    SymAusgabe(inRefWurzel^.rechts)
  end
end; {SymAusgabe}



{
    [D]
}


procedure SymAusgabe (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in 
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    if inRefWurzel^.links <> nil  then
      SymAusgabe(inRefWurzel^.links);
    if inRefWurzel^.rechts <> nil then
      SymAusgabe(inRefWurzel^.rechts);
  write (inRefWurzel^.info)
  end
end; {SymAusgabe}



{
    [E]
}


procedure SymAusgabe (
              inRefWurzel : tRefBinBaum);
{gibt die Knotenwerte eines Binärbaums in
 symmetrischer Reihenfolge aus}
begin
  if inRefWurzel <> nil then
  begin
    if inRefWurzel^.links <> nil  then
      SymAusgabe(inRefWurzel^.links);

    write (inRefWurzel^.info);
    if inRefWurzel^.rechts <> nil then
      SymAusgabe(inRefWurzel^.rechts)
  end
end; {SymAusgabe}