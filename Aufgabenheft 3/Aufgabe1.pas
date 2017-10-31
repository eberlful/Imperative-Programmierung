program testeFeldZweitMax (input, output);
{ testet die Funktion FeldZweitMax }

  const
  FELDGROESSE = 10;

  type
  tIndex = 1..FELDGROESSE;
  tFeld = array [tIndex] of integer;

  var 
  Feld : tFeld;
  i : integer;

function FeldZweitMax (var inFeld : tFeld) : integer;
  
    var
    k,
    firstValue,
    secondValue : integer;

begin
  {firstValue := inFeld[1];
  secondValue := inFeld[1];}
  for k := 1 to FELDGROESSE do
    begin
      if (firstValue < inFeld[k]) then
        begin
          secondValue := firstValue;
          firstValue := inFeld[k];
        end;
      if (secondValue < inFeld[k]) and (firstValue > inFeld[k]) then
        begin
          secondValue := inFeld[k];
        end;
    end;
    FeldZweitMax := secondValue;
end;

begin { Testprogramm }
  writeln('Bitte geben Sie ', FELDGROESSE, ' Zahlen ein:');
  for i := 1 to FELDGROESSE do
    read (Feld [i]);
  writeln('Die zweitgroesste Zahl ist ', FeldZweitMax (Feld), '.');
end. { testeFeldZweitMax }