{$R+}
{$B+}

{Handbewertete Aufgabe}
program TesteSortiereListe(input, output);
{Sortieren durch Einfügen (der sogenannte Insertionsort) ist effizient für bereits teilweise sortierte Listen. 
Die Grundidee dieses Sortierverfahrens ist, dass jede Liste aus zwei Teilen besteht. Der Anfang jeder Liste ist sortiert, danach folgt ein unsortiertes Ende. 
In jedem Iterationsschritt des Sortierverfahrens wird das erste Element des unsortierten Bereichs an die richtige Position des sortierten Teils verschoben. 
Der sortierte Teil wird damit in jedem Iterationsschritt um ein Element größer. 
Ist der unsortierte Teil erschöpft, terminiert der Algorithmus und die Liste ist sortiert.
Hinweis: Zu Beginn des Sortierens durch Einfügen ist der bereits sortierte Anfang oft nur das erste Element.

Verwenden Sie die unten stehenden Typdefinitionen und den angegebenen Prozedurkopf und implementieren Sie das Sortieren einer linearen Liste natürlicher Zahlen mit Hilfe des Sortierens durch Einfügen. 
Knoten des unsortierten Teils sollen in den sortierten Teil der Liste durch Umhängen der Knoten eingefügt werden. 
Keinesfalls sollen die Werte der Knoten kopiert oder überschrieben werden.}

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;

  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }

  var
  ZwischenSpeicher, {Speicher fuer das zu sortierende Element}
  SourceList, {Zeiger, der auf die zu sortierende Liste Zeigt}
  DestinationList,  {Zeiger, der auf den Anfang der sortierten Liste zeigt}
  DestAktList,  {Zeiger für den Suchdurchlauf}
  PreDestList : tRefListe;  {Zeiger für den Suchdurchlauf}
  i : integer;
  check : boolean;

  begin
    {Uebergabe der Liste}
    SourceList := ioRefListe;
    DestAktList := ioRefListe;
    new (DestinationList);  {Erzeugung des Zwischenspeichers}
    i := 0; {Zaehler zuruecksetzten}

    while SourceList <> nil do  
    begin {Ueberprueft ob Quellliste noch Element besitz}
      i := i + 1;

      {Lade neues Element von unsortierter Liste in Zwischenspeicher}
      ZwischenSpeicher := SourceList;
      SourceList := ZwischenSpeicher^.next;
      ZwischenSpeicher^.next := nil;
        
      if i = 1 then {Beim ersten Element nur in neue Liste kopieren }
      begin
        DestinationList := ZwischenSpeicher;
        DestinationList^.next := nil;
      end;
        
      if i = 2 then {Zweiter Durchgang muss nur einfach verglichen werden}
      begin {Fügt Element nach dem erstem Element ein}
        if DestinationList^.info <= ZwischenSpeicher^.info then
        begin
        DestinationList^.next := ZwischenSpeicher;
        ZwischenSpeicher^.next := nil;
        end
        else  {Fügt Element vor dem erstem Element ein}
        begin
        ZwischenSpeicher^.next := DestinationList;
        DestinationList := ZwischenSpeicher;
        ZwischenSpeicher := nil;
        end;
      end;

      if i > 2 then {Ab dritten Durchlauf wird hier iteriert}
      begin
        {Zuweisung der Durchlaufvariablen zur Einfügefunktion
        DestAktList -> Aktuelles Element
        PreDestList -> Element vor dem aktuellem Element}
        DestAktList := DestinationList^.next;
        PreDestList := DestinationList;

            while DestAktList <> nil do
              begin {Durchlaeuft die Zielliste um richtige Position zu finden}
                if (PreDestList^.info <= ZwischenSpeicher^.info) and (DestAktList^.info >= ZwischenSpeicher^.info) then 
                begin {Wenn erfüllt, dann einfügen des aktuellen Elements}
                  PreDestList^.next := ZwischenSpeicher;
                  ZwischenSpeicher^.next := DestAktList; 
                  check := true;
                end;

                if  ZwischenSpeicher^.info < DestinationList^.info then 
                begin {Wenn Element kleiner als Listenanfang ist, am Anfang einfügen}
                  ZwischenSpeicher^.next := DestinationList;
                  DestinationList := ZwischenSpeicher;
                end;
                
                if (ZwischenSpeicher^.info > DestAktList^.info) and (DestAktList^.next = nil) then
                begin {Fügt letztes Listenelement ein}
                  DestAktList^.next := ZwischenSpeicher;
                  ZwischenSpeicher := nil;
                  check := true;
                end;

                {Zuweisung des Nächsten Elements für den Durchlauf}
                PreDestList := DestAktList;
                DestAktList := PreDestList^.next;

                if check = true then  {Setzt Listenende}
                begin
                  DestAktList := nil;
                end;

                {Setzt Status fuer das letzte Element zurueck}
                check := false;
              end;
      end;
    end;

    if i = 0 then {Falls Liste leer war}
    begin
      ioRefListe := nil;
    end
    else {Falls Liste nicht leer war}
    begin
      ioRefListe := DestinationList;
    end;

    {Loescht Zeiger aus Speicher}  
    dispose (DestinationList);
  end;

  procedure Anhaengen(var ioListe : tRefListe;
                        inZahl : tNatZahl);
{ Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
begin
  Zeiger := ioListe;
  if Zeiger = nil then
  begin
    new(ioListe);
    ioListe^.info := inZahl;
    ioListe^.next := nil;
  end
  else
  begin
    while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
    { Jetzt zeigt Zeiger auf das letzte Element }
    new(Zeiger^.next);
    Zeiger := Zeiger^.next;
    Zeiger^.info := inZahl;
    Zeiger^.next := nil;
  end;
end;

procedure ListeEinlesen(var outListe:tRefListe);
{ liest eine durch Leerzeile abgeschlossene Folge von Integer-
  Zahlen ein und speichert diese in der linearen Liste RefListe. }
  var
  Liste : tRefListe;
  Zeile : string;
  Zahl, Code : integer;
begin
  writeln('Bitte geben Sie die zu sortierenden Zahlen ein.');
  writeln('Beenden Sie Ihre Eingabe mit einer Leerzeile.');
  Liste := nil;
  readln(Zeile);
  val(Zeile, Zahl, Code); { val konvertiert String nach Integer }
  while Code=0 do
  begin
    Anhaengen(Liste, Zahl);
    readln(Zeile);
    val(Zeile, Zahl, Code);
  end; { while }
  outListe := Liste;
end; { ListeEinlesen }

procedure GibListeAus(inListe : tRefListe);
{ Gibt die Elemente von inListe aus }
  var Zeiger : tRefListe;
begin
  Zeiger := inListe;
  while Zeiger <> nil do
  begin
    writeln(Zeiger^.info);
    Zeiger := Zeiger^.next;
  end; { while }
end; { GibListeAus }

begin
  ListeEinlesen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end.