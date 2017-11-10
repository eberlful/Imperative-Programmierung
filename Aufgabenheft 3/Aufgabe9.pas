{$R+}
{$B+}

program Aufgabe9 (input, output);

type 
tRefListe = ^tListe;
tListe = record 
           info : integer;
           next : tRefListe
         end;

var
Auswahl : char;

{Die nachfolgende Prozedur verändert eine lineare Liste derart, dass sich häufig gesuchte Elemente im vorderen Teil der Liste aufhalten. 
Dazu wird das gefundene Element aus der Liste herausgenommen und als erstes Element wieder eingefügt. 
Kommt das gesuchte Element nicht vor, dann wird der Parameter outGefunden auf false gesetzt, sonst auf true.
An der mit { **Umhaengen** }{ markierten Stelle fehlen in dieser Prozedur die Anweisungen, die das lokalisierte Element an den Listenanfang bringen.}

procedure moveToFront (
                inSuchwert : integer;
            var ioAnfang : tRefListe;
            var outGefunden : boolean);
{ bestimmt in einer linearen Liste das erste Element mit dem 
  Wert inSuchwert und positioniert es als erstes Listen-
  element }

  var 
  ZuletztGeprueftesElement,
  UmhaengeHilfe : tRefListe;
  gefunden : boolean;

    begin
  gefunden := false;
  if ioAnfang <> nil then { Liste ist nicht leer }
    if ioAnfang^.info = inSuchwert then 
      { gefundenes Element ist schon das erste Element }
      gefunden := true
    else 
    begin
      ZuletztGeprueftesElement := ioAnfang;
      while (ZuletztGeprueftesElement^.next <> nil) and not gefunden do
        if ZuletztGeprueftesElement^.next^.info = inSuchwert then
        begin { Suchwert ist gefunden }
          gefunden := true;
          { **Umhaengen** }
        end
        else 
          ZuletztGeprueftesElement := ZuletztGeprueftesElement^.next
    end; { else }
  outGefunden := gefunden
    end; { moveToFront }

begin
    writeln('Geben sie eine Auswahl an (A, B, C)');
    readln(Auswahl);

    if (Auswahl = 'A') or (Auswahl = 'a') then
        begin
            UmhaengeHilfe := ZuletztGeprueftesElement^.info;
            ZuletztGeprueftesElement^.next := ioAnfang^.next;
            ioAnfang^.next := UmhaengeHilfe;
        end;
    if (Auswahl = 'B') or (Auswahl = 'b') then
        begin          
            UmhaengeHilfe := ZuletztGeprueftesElement^.next;
            UmhaengeHilfe^.next := ZuletztGeprueftesElement^.next;
            ZuletztGeprueftesElement^.next := ioAnfang;
            ioAnfang := ZuletztGeprueftesElement;
        end;
    if (Auswahl = 'C') or (Auswahl = 'c') then
        begin
            UmhaengeHilfe := ZuletztGeprueftesElement^.next;
            ZuletztGeprueftesElement^.next := UmhaengeHilfe^.next;
            UmhaengeHilfe^.next := ioAnfang;
            ioAnfang := UmhaengeHilfe;    
        end;
    if (Auswahl = 'D') or (Auswahl = 'd') then
        begin
            UmhaengeHilfe^.next := ZuletztGeprueftesElement^.next;
            ZuletztGeprueftesElement^.next := UmhaengeHilfe^.next^.next;
            UmhaengeHilfe^.next^.next := ioAnfang;
            ioAnfang := UmhaengeHilfe^.next;
        end;
    if (Auswahl = 'E') or (Auswahl = 'e') then
        begin
            UmhaengeHilfe := ZuletztGeprueftesElement^.next;
            UmhaengeHilfe^.next := ioAnfang;
            ioAnfang := UmhaengeHilfe;
        end;
end.