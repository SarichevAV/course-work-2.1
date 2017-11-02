unit IOList;
{$H+}

interface

uses
  Classes, SysUtils, LinkedList;

{public declarations}
procedure SaveTextFile(var textFile : text; filename : String; commonWeather : list);
procedure ReadTextFile(var textFile : text; filename : String; var nowList : list);

implementation

(*
    Запись в текстовый файл
*)
procedure SaveTextFile(var textFile : text; filename : String; commonWeather : list);
var
  temp : list;
    begin
         temp := commonWeather;
         assign(textfile, fileName);
         rewrite(textfile);
         while (temp <> nil)do
            begin
                write(textfile, temp^.discipline);
                write(textfile, #13#10);
                write(textfile, temp^.name);
                write(textfile, #13#10);
                write(textfile, temp^.author);
                write(textfile, #13#10);
                write(textfile, temp^.yearPublish);
                write(textfile, #13#10);
                write(textfile, temp^.formatOfFile);
                write(textfile, #13#10);
                write(textfile, temp^.language);
                write(textfile, #13#10);
                write(textfile, #13#10);
                temp := temp^.next;
            end;
        close(textfile);
    end;

(*
    Чтение из текстового файла
*)
procedure ReadTextFile(var textFile : text; filename : String; var nowList : list);
var
  fullFileName : string;
  discipline : string;
  name : string;
  author : string;
  yearPublish : integer;
  formatOfFile : string;
  language : string;
  empty : string;
    begin
      fullFileName := filename;
      assign(textfile, fullFileName);
      reset(textFile);
      while (not (eof(textFile))) do
        begin
          readln(textfile, discipline);
          readln(textfile, name);
          readln(textfile, author);
          readln(textfile, yearPublish);
          readln(textfile, formatOfFile);
          readln(textfile, language);
          readln(textFile, empty);
          LinkedList.add(nowList, discipline, name, author, yearPublish, formatOfFile, language);
        end;
      close(textfile);
    end;
end.
