{Es werden zwei positive ganze Zahlen eingelesen, die einen Bruch darstellen. 
Dieser Bruch soll in gekürzter Form ausgegeben werden. Um diese Aufgabe zu erfüllen, geht man nach folgendem Algorithmus vor. 
Erst findet man den größten gemeinsamen Teiler (ggT) von beiden Zahlen, dann kürzt man den Bruch (Zähler und Nenner werden durch den ggT dividiert). 
Beispielsweise liefert die Eingabe : Zaehler = 8, Nenner = 6 das Ergebnis 4/3.
Welche der drei angegebenen Programme führen die Berechnung und die Ausgabe korrekt durch?
Die Programme dokumentieren keinen guten Programmierstil und 
dienen lediglich der Veranschaulichung der verschiedenen Parameterübergabearten und der statischen Blockstrukturen.

( x aus 3)}

{
    A[x]
    B[]
    C[x]
}

program KuerzenUndAusgeben (input, output);

    var
    Auswahl : char;

procedure KuerzenUndAusgebenA ();

  type
  tNatZahlPlus = 1..maxint;

  var
  Zaehler,
  Nenner : tNatZahlPlus;

  procedure Ausgabe (inZaehler, 
            inNenner : tNatZahlPlus);
  {Gibt den gekuerzten Bruch aus}

  begin
    writeln('gekuerzter Bruch:',inZaehler,
            '/', inNenner)
  end; {Ausgabe}

  procedure Kuerzen (var ioZaehler,
                    ioNenner : tNatZahlPlus);
  {Kuerzt den Bruch}
  
    var
    Teiler : tNatZahlPlus;
  
    function GGT (
        inZahl1, 
        inZahl2 : tNatZahlPlus) : tNatZahlPlus;
    {liefert den groessten gemeinsamen 
    Teiler von inZahl1 und inZahl2}

      var
      Hilf1,
      Hilf2 : tNatZahlPlus;

    begin
      Hilf1 := inZahl1;
      Hilf2 := inZahl2;
      while Hilf1 <> Hilf2 do
        if Hilf1 > Hilf2 then 
          Hilf1 := Hilf1 - Hilf2
        else
          Hilf2 := Hilf2 - Hilf1;
      GGT := Hilf1
    end; {GGT}
    
  begin {Kuerzen}
    Teiler := GGT (ioZaehler, ioNenner);
    ioZaehler := ioZaehler div Teiler;
    ioNenner := ioNenner div Teiler
  end; {Kuerzen}

begin{KuerzenUndAusgeben}
  writeln ('Geben Sie den Zaehler ein');
  read (Zaehler);
  writeln ('Geben Sie den Nenner ein');
  read (Nenner);
  Kuerzen (Zaehler, Nenner);
  Ausgabe (Zaehler, Nenner);
end;{KuerzenUndAusgeben}

procedure KuerzenUndAusgebenB();

  type
  tNatZahlPlus = 1..maxint;

  var
  Zaehler,
  Nenner : tNatZahlPlus;
  
  procedure Kuerzen (
            var ioZaehler, 
            ioNenner : tNatZahlPlus);
  {Kuerzt den Bruch}

    var
    Teiler : integer;
  
    function GGT (
      inZahl1, 
      inZahl2 : tNatZahlPlus) : tNatZahlPlus;
    {liefert den groessten gemeinsamen 
    Teiler von inZahl1 und inZahl2}

      var
      Hilf1,
      Hilf2 : tNatZahlPlus;

    begin
      Hilf1 := inZahl1;
      Hilf2 := inZahl2;
      while Hilf1 <> Hilf2 do
        if Hilf1 > Hilf2 then 
          Hilf1 := Hilf1 - Hilf2
        else
          Hilf2 := Hilf2 - Hilf1;
      GGT := Hilf1
    end; {GGT}

      procedure Ausgabe (
            inZaehler, 
            inNenner : tNatZahlPlus);
      {Gibt den gekuerzten Bruch aus}
  
      begin
        writeln('gekuerzter Bruch:',inZaehler,
                '/', inNenner)
      end; {Ausgabe}

  begin {Kuerzen}
    Teiler := GGT (ioZaehler, ioNenner);
    ioZaehler := ioZaehler div Teiler;
    ioNenner := ioNenner div Teiler
  end; {Kuerzen}

begin {KuerzenUndAusgeben}
  writeln ('Geben Sie den Zaehler ein');
  read (Zaehler);
  writeln ('Geben Sie den Nenner ein');
  read (Nenner);
  Kuerzen (Zaehler, Nenner);
  {Ausgabe (Zaehler, Nenner)
    Musste auskommentiert werden, da diese Prozedur nur lokal in einer anderen erzeugt wurde und so nicht von außen erreichbar ist.
  }
end; {KuerzenUndAusgeben}

procedure KuerzenUndAusgebenC ();

  type
  tNatZahlPlus = 1..maxint;

  var
  Zaehler,
  Nenner,
  Teiler : tNatZahlPlus;

  procedure Ausgabe (inZaehler, 
            inNenner : tNatZahlPlus);
  {Gibt den gekuerzten Bruch aus}

  begin
    writeln('gekuerzter Bruch:',inZaehler,
            '/', inNenner)
  end; {Ausgabe}

  procedure GGT (inZahl1, 
                 inZahl2 : tNatZahlPlus);
  {bestimmt den groessten gemeinsamen 
  Teiler von inZahl1 und inZahl2}
    
    var
    Hilf1,
    Hilf2 : tNatZahlPlus;
    
  begin
    Hilf1 := inZahl1;
    Hilf2 := inZahl2;
    while Hilf1 <> Hilf2 do
      if Hilf1 > Hilf2 then 
        Hilf1 := Hilf1 - Hilf2
      else
        Hilf2 := Hilf2 - Hilf1;
    Teiler := Hilf1
  end; {GGT}

  procedure Kuerzen (inZaehler, 
                     inNenner : tNatZahlPlus);
  {Kuerzt den Bruch}
    
    var
    Temp1,
    Temp2 : tNatZahlPlus;

  begin
    Temp1 := inZaehler;
    Temp2 := inNenner;
    inZaehler := Temp1 div Teiler;
    inNenner := Temp2 div Teiler
  end; {Kuerzen}

begin {KuerzenUndAusgeben}
  writeln ('Geben Sie den Zaehler ein');
  read (Zaehler);
  writeln ('Geben Sie den Nenner ein');
  read (Nenner);
  GGT(Zaehler,Nenner);
  Kuerzen (Zaehler,Nenner);
  Ausgabe (Zaehler,Nenner)
end;{KuerzenUndAusgeben}


begin
    writeln('Geben sie ihre Auswahl ein (A, B, C)...');
    readln(Auswahl);
    if (Auswahl = 'A') or (Auswahl = 'a') then
        begin
            writeln('A gewaehlt');
            KuerzenUndAusgebenA();
        end;
    if (Auswahl = 'B') or (Auswahl = 'b') then
        begin
            writeln('B gewaehlt');
            writeln('B konnte nicht richtig kompiliert werden!!!');
            KuerzenUndAusgebenB();
        end;
    if (Auswahl = 'C') or (Auswahl = 'c') then
        begin
            writeln('C gewaehlt');
            KuerzenUndAusgebenC();
        end;
end.