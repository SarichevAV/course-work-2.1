unit LinkedFormatList;

interface
uses
  sysUtils, LinkedList;
type
  formatList = ^format;
  format = record
    name : string;
    count : integer;
    next : formatList;
  end;

  procedure createFormatList(var formats : formatList; tableList : list);
  function getSizeFormatList(myList : formatList) : integer;
//  function getFormatListCount(formats : formatList) : integer;

implementation

procedure add(var listForAdd : formatList; format : string);
var
  temp : formatList;
  changes : boolean;
begin
  changes := false;
  // Проверяем список на наличие записей
  if (listForAdd = nil) then
    begin
      // Если пустой, то создаем первый элемент
      new(listForAdd);
      temp := listForAdd;
      temp^.name := format;
      temp^.count := 1;
      temp^.next := nil;
    end
  else
    // Иначе переходим к записи с таким же форматом
    begin
      temp := listForAdd;
      while (temp^.next <> nil) do
        begin
          if temp^.name = format then
            begin
              temp^.count := temp^.count + 1;
              changes := true;
            end;
          temp := temp^.next;
        end;
      if temp^.name = format then
        begin
          temp^.count := temp^.count + 1;
          changes := true;
        end;
      if not changes then
        begin
          new(temp^.next);
          temp := temp^.next;
          temp^.name := format;
          temp^.count := 1;
          temp^.next := nil;
        end;
    end;
end;

procedure createFormatList(var formats : formatList; tableList : list);
begin
  while tableList <> nil do
    begin
      add(formats, tableList^.formatOfFile);
      tableList := tableList^.next;
    end;
end;

function getSizeFormatList(myList : formatList) : integer;
var
  s : integer;
begin
  s := 1;
  while myList^.next <> nil do begin
    s := s + 1;
    myList := myList^.next;
  end;
  getSizeFormatList := s;
end;

//function getFormatListCount(formats : formatList) : integer;

end.
