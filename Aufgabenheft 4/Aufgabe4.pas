{$B+}
{$R+}

program Aufgabe4 (output,input);

const
  UNTEN = 0; { Array-Untergrenze }
  OBEN = 10; { Array-Obergrenze }

  type
  tIndex = UNTEN..OBEN;
  tFeld = array[tIndex] of integer;

{  Welche der folgenden Funktionen bestimmen das Maximum in einem Feld mit den variablen Grenzen inUnten und inOben korrekt?
Sie können davon ausgehen, dass beim (ersten) Aufruf der Funktionen stets
UNTEN <= InUnten <= InOben <= OBEN gilt.
(Bemerkung: Bei A-D handelt es sich um keine sinnvolle Anwendung der Rekursion.)}

{
    [A]
}

function FeldMaxA (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten = inOben then
    FeldMaxA := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxA (inFeld,inUnten,Mitte);
    MaxR := FeldMaxA (inFeld,Mitte+1,inOben);
    if MaxL > MaxR then
      FeldMaxA := MaxL
    else
      FeldMaxA := MaxR
  end
end; { FeldMaxA }

{
    [B]
}


function FeldMaxB (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem
    Feld mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten = inOben then
    FeldMaxB := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxB (inFeld,inUnten,Mitte);
    MaxR := FeldMaxB (inFeld,Mitte,inOben);
    if MaxL > MaxR then
      FeldMaxB := MaxL
    else
      FeldMaxB := MaxR
  end
end; { FeldMaxB }


{
    [C]
}


function FeldMaxC (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld  
    mit den Grenzen inUnten und inOben }

  var
  Mitte : tIndex;
  MaxL,
  MaxR : integer;

begin
  if inUnten > inOben then
    FeldMaxC := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxC (inFeld,inUnten,Mitte);
    MaxR := FeldMaxC (inFeld,Mitte+1,inOben);
    if MaxL > MaxR then
      FeldMaxC := MaxL
    else
      FeldMaxC := MaxR
  end
end; { FeldMaxC }


{
    [D]
}


function FeldMaxD (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

    var
    Mitte : tIndex;
    MaxL,
    MaxR : integer;

begin
  if inUnten > inOben then
    FeldMaxD := inFeld[inUnten]
  else
  begin
    Mitte := (inUnten + inOben) div 2;
    MaxL := FeldMaxD (inFeld,inUnten,Mitte);
    MaxR := FeldMaxD (inFeld,Mitte,inOben);
    if MaxL > MaxR then
      FeldMaxD := MaxL
    else
      FeldMaxD := MaxR
  end
end; { FeldMaxD }


{
    [E]
}


function FeldMaxE (
          var inFeld : tFeld;
              inUnten,
              inOben : tIndex) : integer;
{ bestimmt iterativ das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

  var
  i : tIndex;
  HilfMax : integer; { Hilfsvariable }

begin
  HilfMax := 0;
  for i := inUnten to inOben do
    if inFeld[i] > HilfMax then
      HilfMax := inFeld[i];
  FeldMaxE := HilfMax
end; { FeldMaxE }
