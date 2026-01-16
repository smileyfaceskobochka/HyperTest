program parser;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils;

type
  TQuest = record
    n: word;
    typ: word;
    colq: word;
    fq: string;
    answ: string;
    cor: string;
    pic: string;
    ves: integer;
    tema: integer;
    enab: word;
  end;

var
  filename: string;
  stream: TFileStream;
  s: string;
  i: integer;
  q: TQuest;

begin
  if ParamCount < 1 then
  begin
    Writeln('Usage: parser <database_file>');
    Exit;
  end;

  filename := ParamStr(1);

  if not FileExists(filename) then
  begin
    Writeln('File not found: ', filename);
    Exit;
  end;

  try
    stream := TFileStream.Create(filename, fmOpenRead);
    SetLength(s, stream.size);
    stream.Read(s[1], stream.Size);
    stream.Free;

    // Расшифровка: каждый байт -1
    for i := 1 to Length(s) do
      s[i] := char(ord(s[i]) - 1);

    // Вывод расшифрованного текста для отладки
    Writeln('Decrypted content (first 500 chars):');
    Writeln(Copy(s, 1, 500));
    Writeln('=====================================');

    // Парсинг вопросов
    Writeln('Parsing questions from: ', filename);
    Writeln('=====================================');

    while s <> '' do
    begin
      // номер
      q.n := StrToInt(copy(s, 1, pos('¤', s) - 1));
      delete(s, 1, pos('¤', s));

      // тип
      q.typ := StrToInt(s[1]);
      delete(s, 1, pos('¤', s));

      // кол-во вариантов ответа
      q.colq := StrToInt(copy(s, 1, pos('¤', s) - 1));
      delete(s, 1, pos('¤', s));

      // формулировка
      q.fq := copy(s, 1, pos('¤', s) - 1);
      delete(s, 1, pos('¤', s));

      // варианты ответов
      q.answ := copy(s, 1, pos('¤', s) - 1);
      delete(s, 1, pos('¤', s));

      // имя картинки
      q.pic := copy(s, 1, pos('¤', s) - 1);
      delete(s, 1, pos('¤', s));

      // правильные ответы
      q.cor := copy(s, 1, pos('¤', s) - 1);
      delete(s, 1, pos('¤', s));

      // вес
      q.ves := StrToInt(copy(s, 1, pos('¤', s) - 1));
      delete(s, 1, pos('¤', s));

      // тема
      q.tema := StrToInt(copy(s, 1, pos('¤', s) - 1));
      delete(s, 1, pos('¤', s));

      // доступность
      q.enab := StrToInt(copy(s, 1, pos('¤', s) - 1));
      delete(s, 1, pos('¤', s));

      // Вывод вопроса и правильного ответа
      Writeln('Question ', q.n, ' (Type: ', q.typ, ', Theme: ', q.tema, ')');
      Writeln('Text: ', q.fq);
      Writeln('Correct answer: ', q.cor);
      Writeln('---');
    end;

  except
    on E: Exception do
      Writeln('Error: ', E.Message);
  end;

end.
