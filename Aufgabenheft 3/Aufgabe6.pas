{$R+}
{$B+}

program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
  ten Programmierstil und dient nur zum Ueben der Parameterueber-
  gabearten. }

  var 
  a,
  b,
  c : integer;

  procedure globalProc ({call_by_1} d, e, f: integer);

    var 
    a : integer; 

    procedure lokalProc ({call_by_2} g, h, i: integer);

      var 
      b : integer;

    begin
      g := h + i;
      b := c;
      a := 2 * b;
      i := a + b
    end; { lokalProc }

  begin
    a := 4;
    b := 5;
    c := 6;
    d := e - f;
    lokalProc (a, d, e);
    e := f - d
  end; { globalProc }

begin
  a := 1;
  b := 2;
  c := 3;
  globalProc (c, b, a);
  writeln (a, ' ', b, ' ', c)
end. { Parameter1 }

{Zielausgabe: 1 5 6}
{
    Welche Formen der Parameterübergabe sind beim Programm Parameter1zu wählen, damit das Programm die Ausgabe   1 5 6   erzeugt?

    A[]     Die Parameterübergaben beider Prozeduren erfolgen als var-Parameter.

    B[x]     Die Parameterübergaben beider Prozeduren erfolgen als Wertparameter.

    C[]     Die Parameterübergabe erfolgt bei der Prozedur globalProc als var-Parameter und bei der Prozedur lokalProc als Wertparameter.

    D[]     Die Parameterübergabe erfolgt bei der Prozedur globalProc als Wertparameter und bei der Prozedur lokalProc als var-Parameter.

    E[]     Die Ausgabe des Programms ist unabhängig von der Art der Parameterübergabe.
}