unit LinkedList;

interface
uses
  SysUtils;
type
  list = ^TLinkedList;
  TLinkedList = record
    discipline : string;
    name : string;
    author : string;
    yearPublish : integer;
    formatOfFile : string;
    language : string;
    next : list;
  end;

  procedure add(var listForAdd: list; discipline : string; name : string; author : string;
                    yearPublish : integer; formatOfFile : string; language : string);
  function getSizeList(myList : list) : integer;
  function getSearchElement(element : string; myList : list) : list;
  function getListBooksAuthor(nameAuthor : string; from : integer; before : integer; myList : list) : list;
  function getListBooksDiscipline(discipline : string; myList : list) : list;
implementation

procedure readValue(var target: list; discipline : string; name : string; author : string;
                    yearPublish : integer; formatOfFile : string; language : string);
begin
  target^.discipline := discipline;
  target^.name := name;
  target^.author := author;
  target^.yearPublish := yearPublish;
  target^.formatOfFile := formatOfFile;
  target^.language := language;
end;

procedure add(var listForAdd: list; discipline : string; name : string; author : string;
                    yearPublish : integer; formatOfFile : string; language : string);
var
  temp : list;
begin
  // Проверяем список на наличие записей
  if (listForAdd = nil) then
    begin
      // Если пустой, то создаем первый элемент
      new(listForAdd);
      temp := listForAdd;
    end
  else
    // Иначе переходим к последней записи
    begin
      temp := listForAdd;
      while (temp^.next <> nil) do
        temp := temp^.next;
      new(temp^.next);
      temp := temp^.next;
    end;
  // Указатель на следующий элемент пуст
  temp^.next := nil;
  readValue(temp, discipline, name, author, yearPublish, formatOfFile, language);
end;

function getSizeList(myList : list) : integer;
var
  size : integer;
begin
  size := 1;
  while myList^.next <> nil do begin
    size := size + 1;
    myList := myList^.next;
  end;

  getSizeList := size;
end;

function getSearchElement(element : string; myList : list) : list;
var
  temp : list;
  res : list;
begin
  temp := myList;
  res := nil;
  while temp <> nil do
    begin
      if temp^.name = element then
        res := temp;
      temp := temp^.next;
    end;
  getSearchElement := res;
end;

function getListBooksAuthor(nameAuthor : string; from : integer; before : integer; myList : list) : list;
var
  newList : list;
  head : list;
begin
  new(newList);
  head := newList;
  while myList <> nil do
    begin
      if (myList^.author = nameAuthor) and (myList^.yearPublish > from) and (myList^.yearPublish < before) then
        begin
          new(newList^.next);
          newList := newList^.next;
          newList^.discipline := myList^.discipline;
          newList^.name := myList^.name;
          newList^.author := myList^.author;
          newList^.yearPublish := myList^.yearPublish;
          newList^.formatOfFile := myList^.formatOfFile;
          newList^.language := myList^.language;
        end;
      myList := myList^.next;
    end;
    getListBooksAuthor := head^.next;
end;

function getListBooksDiscipline(discipline : string; myList : list) : list;
var
  newList : list;
  head : list;
begin
  new(newList);
  head := newList;
  while myList <> nil do
    begin
      if myList^.discipline = discipline then
        begin
          new(newList^.next);
          newList := newList^.next;
          newList^.discipline := myList^.discipline;
          newList^.name := myList^.name;
          newList^.author := myList^.author;
          newList^.yearPublish := myList^.yearPublish;
          newList^.formatOfFile := myList^.formatOfFile;
          newList^.language := myList^.language;
        end;
      myList := myList^.next;
    end;
    getListBooksDiscipline := head^.next;
end;
end.
