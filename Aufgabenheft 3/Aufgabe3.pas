{$R+}
{$B+}

program TesteAnhaengen (input, output);
{ testet die Prozedur anhaengen }
{Schreiben Sie eine PASCAL-Prozedur anhaengen, die zwei verschiedene lineare Listen durch Hintereinanderhängen zu einer einzigen Liste verknüpft. 
Ein Aufruf der Prozedur bewirkt also, daß anschließend die next-Komponente des letzten Elementes der ersten Liste auf das erste Element der zweiten Liste zeigt.}

  type
  tRefListe = ^tListe;
  tListe = record
             info : integer;
             next : tRefListe
           end;

  var 
  Liste1, 
  Liste2,
  Gesamtliste : tRefListe;


procedure anhaengen (    inRefAnfang1,
                           inRefAnfang2 : tRefListe;
                       var outRefAnfang : tRefListe);
  { Haengt die lineare Liste mit Anfangszeiger inRefAnfang2 an
    die Liste mit Anfangszeiger inRefAnfang1 an.
    Zurueckgegeben wird outRefAnfang, der Anfangszeiger der Ergebnisliste. }

  var
  Zeiger : tRefListe;

begin
  while (inRefAnfang1 <> nil) or (inRefAnfang2 <> nil) do
    begin
      {Falls noch beide Listen ein Element besitzen}
      if (inRefAnfang1 <> nil) and (inRefAnfang2 <> nil) then
        begin
          if outRefAnfang = nil then
            begin
              new (Zeiger);
              {writeln(inRefAnfang1^.info, 'in Zeiger');}
              Zeiger^.info := inRefAnfang1^.info;
              Zeiger^.next := outRefAnfang;
              outRefAnfang := Zeiger;
              new (Zeiger);
              Zeiger := inRefAnfang1^.next;
              inRefAnfang1 := Zeiger;
              new (Zeiger);
              {writeln(inRefAnfang2^.info, 'in Zeiger');}
              Zeiger^.info := inRefAnfang2^.info;
              Zeiger^.next := outRefAnfang;
              outRefAnfang := Zeiger;
              new (Zeiger);
              Zeiger := inRefAnfang2^.next;
              inRefAnfang2 := Zeiger;
            end
          else
          begin
              new (Zeiger);
              {writeln(inRefAnfang1^.info, 'in Zeiger');}
              Zeiger^.info := inRefAnfang1^.info;
              Zeiger^.next := outRefAnfang;
              outRefAnfang := Zeiger;
              new (Zeiger);
              Zeiger := inRefAnfang1^.next;
              inRefAnfang1 := Zeiger;
              new (Zeiger);
              {writeln(inRefAnfang2^.info, 'in Zeiger');}
              Zeiger^.info := inRefAnfang2^.info;
              Zeiger^.next := outRefAnfang;
              outRefAnfang := Zeiger;
              new (Zeiger);
              Zeiger := inRefAnfang2^.next;
              inRefAnfang2 := Zeiger;
          end;

        end;
      {Falls nur noch in inRefAnfang1 was in der Liste steht}
      if (inRefAnfang1 <> nil) and (inRefAnfang2 = nil) then
        begin
          new (Zeiger);
          Zeiger^.info := inRefAnfang1^.info;
          Zeiger^.next := outRefAnfang;
          outRefAnfang := Zeiger;
          new (Zeiger);
          Zeiger := inRefAnfang1^.next;
          inRefAnfang1 := Zeiger;
        end;
      {Falls nur noch in inRefAnfang2 was in der Liste steht}
      if (inRefAnfang1 = nil) and (inRefAnfang2 <> nil) then
        begin
          new (Zeiger);
          Zeiger^.info := inRefAnfang2^.info;
          Zeiger^.next := outRefAnfang;
          outRefAnfang := Zeiger;
          new (Zeiger);
          Zeiger := inRefAnfang2^.next;
          inRefAnfang2 := Zeiger;
        end;
    end;
end;





procedure LiesListe(var outListe : tRefListe);
  { Liest eine (evtl. leere) Liste ein und gibt deren Anfangszeiger outListe zurueck. }

    var
    Anzahl : integer;
    i : integer;
    neueZahl : integer;
    Listenanfang,
    Listenende : tRefListe;


  begin
    Listenanfang := nil;
    repeat
      write ('Wie viele Zahlen wollen Sie eingeben? ');
      readln (Anzahl);
    until Anzahl >= 0;
 
    write ('Bitte geben Sie ', Anzahl, ' Zahlen ein: ');

    { Liste aufbauen }
    for i := 1 to Anzahl do
    begin
      read (neueZahl);
      if Listenanfang = nil then
      begin
        new (Listenanfang);
        Listenanfang^.next := nil;
        Listenanfang^.info := neueZahl;
        Listenende := Listenanfang;
      end
      else
      begin
        new (Listenende^.next);
        Listenende := Listenende^.next;
        Listenende^.next := nil;
        Listenende^.info := neueZahl
      end  { if Liste = nil }
    end; { for }
  outListe := Listenanfang;
  writeln
  end; { LiesListe }


  procedure gibListeAus (inListe : tRefListe);
  { gibt die Liste mit Anfangszeiger inListe aus }
    var
    ListenElement : tRefListe;
  begin
    ListenElement := inListe;
    while ListenElement <> nil do
    begin
      write(ListenElement^.info, ' ');
      ListenElement := ListenElement^.next;
    end;
    writeln;
  end; { gibListeAus }


begin { testeAnhaengen }
  writeln('Bitte geben Sie die erste Liste ein! ');
  LiesListe (Liste1);
  writeln;

  writeln('Bitte geben Sie die zweite Liste ein! ');
  LiesListe (Liste2);
  writeln;

  writeln('Die konkatenierte Liste lautet: ');
  Anhaengen (Liste1, Liste2, Gesamtliste);
  GibListeAus (Gesamtliste);
end. { TesteAnhaengen }  