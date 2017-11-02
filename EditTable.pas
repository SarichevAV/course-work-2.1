unit EditTable;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, LinkedList;
type
  TFTable = class(TForm)
    StringGridTable: TStringGrid;
    SaveButton: TButton;
    AddRowButton: TButton;
    RemoveRowButton: TButton;
    DownloadButton: TButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ClearTable: TButton;
    Button1: TButton;
    Button2: TButton;
    InfoAdoutBookButton: TButton;
    BooksByAuthorButton: TButton;
    BooksByDisciplineButton: TButton;
    DiagramButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure AddRowButtonClick(Sender: TObject);
    procedure RemoveRowButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure DownloadButtonClick(Sender: TObject);
    procedure ClearTableClick(Sender: TObject);
    procedure InfoAdoutBookButtonClick(Sender: TObject);
    procedure BooksByAuthorButtonClick(Sender: TObject);
    procedure BooksByDisciplineButtonClick(Sender: TObject);
    procedure DiagramButtonClick(Sender: TObject);
  end;
var
  FTable: TFTable;
  tableList : list;
  myTextFile : text;
implementation
uses IOList, SearchBookByName, SearchBooksByAuthor, SearchBooksByDiscipline,
  Diagramma;
{$R *.dfm}

// Инициализация списка
procedure InitList(StringGrid : TStringGrid; var emptyList : list);
var
  i : integer;
  discipline : string;
  name : string;
  author : string;
  yearPublish : integer;
  formatOfFile : string;
  language : string;
begin
  emptyList := nil; // Очищаем список
  // Пробегаем по всем строкам
  for i := 1 to StringGrid.RowCount - 1 do
    begin
      // Считываем информацию о книге
      discipline := StringGrid.Cells[1,i];
      name := StringGrid.Cells[2,i];
      author := StringGrid.Cells[3,i];
      yearPublish := StrToInt(StringGrid.Cells[4,i]);
      formatOfFile := StringGrid.Cells[5,i];
      language := StringGrid.Cells[6,i];
      // Добавляем элемент в список
      LinkedList.add(emptyList, discipline, name, author, yearPublish, formatOfFile, language);
    end;
end;

// Заполняем таблицу данными из списка
procedure DownloadTable(StringGrid : TStringGrid; downloadList : list);
var
  size, i : integer;
begin
  // Определяем длину списка
  size := getSizeList(downloadList);
  // Создаем строки в таблице
  StringGrid.RowCount := size + 1;
  // Заносим в таблицу информацию о книге
  for i := 1 to size do begin
    StringGrid.Cells[0,i] := IntToStr(i);
    StringGrid.Cells[1,i] := downloadList^.discipline;
    StringGrid.Cells[2,i] := downloadList^.name;
    StringGrid.Cells[3,i] := downloadList^.author;
    StringGrid.Cells[4,i] := IntToStr(downloadList^.yearPublish);
    StringGrid.Cells[5,i] := downloadList^.formatOfFile;
    StringGrid.Cells[6,i] := downloadList^.language;
    // Переходим к следующему элементу списка
    downloadList := downloadList^.next;
  end;
end;

// Обработка события сохранения в текстовый файл
procedure TFTable.SaveButtonClick(Sender: TObject);
var
  fileName : string;
begin
  // Создаем список из элементов таблицы
  initList(StringGridTable, tableList);
  if SaveDialog1.Execute then begin
    // Определяем путь к файлу
    fileName := SaveDialog1.FileName;
    // Сохраняем список в текстовый файл
    SaveTextFile(myTextFile, fileName, tableList);
  end;
end;

// Обработка события добавления строки в таблицу
procedure TFTable.AddRowButtonClick(Sender: TObject);
begin
  // Добавляем строку
  StringGridTable.RowCount := StringGridTable.RowCount + 1;
  // Записываем номер строки в поле '№'
  StringGridTable.Cells[0, StringGridTable.RowCount - 1] := IntToStr(StringGridTable.RowCount - 1);
end;

// Обработка события удаления строки из таблицы
procedure TFTable.RemoveRowButtonClick(Sender: TObject);
begin
  // Проверяем коллиство строк в таблице
  if StringGridTable.RowCount > 2 then
    begin
      // Очищаем строку
      StringGridTable.Rows[StringGridTable.RowCount - 1].Clear;
      // Удаляем строку
      StringGridTable.RowCount := StringGridTable.RowCount - 1;
    end;
  // Если первый элемент таблицы
  if StringGridTable.RowCount = 2 then
    begin
      // Очищаем строку
      StringGridTable.Rows[1].Clear;
      // Добавляем индекс строки
      StringGridTable.Cells[0,1] := IntToStr(StringGridTable.RowCount - 1);
    end;
end;

// Обработка события очистки таблицы
procedure TFTable.InfoAdoutBookButtonClick(Sender: TObject);
begin
  try
    InitList(StringGridTable, tableList);
    SearchElementForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('Не оставляйте пустые поля!','Ошибка',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.BooksByAuthorButtonClick(Sender: TObject);
begin
  try
    InitList(StringGridTable, tableList);
    BooksForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('Не оставляйте пустые поля!','Ошибка',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.BooksByDisciplineButtonClick(Sender: TObject);
begin
  try
    tableList := nil;
    InitList(StringGridTable, tableList);
    DisciplineTableForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('Не оставляйте пустые поля!','Ошибка',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.ClearTableClick(Sender: TObject);
var
  count : integer;
begin
  // Определяем колличество строк в таблице
  count := StringGridTable.RowCount;
  // Проходим по всем заполненным строкам таблицы
  while count >= 1 do
    begin
      // Очищаем текую строку
      StringGridTable.Rows[count].Clear;
      // Переходим к следующей
      count := count - 1;
    end;
  tableList := nil;
end;

// Обработка события загрузки таблицы из текстового файла
procedure TFTable.DiagramButtonClick(Sender: TObject);
begin
  try
    InitList(StringGridTable, tableList);
    DiagramForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('Не оставляйте пустые поля!','Ошибка',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.DownloadButtonClick(Sender: TObject);
var
  fileName : string;
begin
  if OpenDialog1.Execute then
    begin
      // Определяем путь до файла
      fileName := OpenDialog1.FileName;
      // Записываем содержимое файла в список
      ReadTextFile(myTextFile, fileName, tableList);
      // Загружаем данные из списка в таблицу
      DownloadTable(StringGridTable, tableList);
    end;
end;


procedure TFTable.FormShow(Sender: TObject);
var
  i :integer;
begin
  StringGridTable.RowCount := 10;
  for I := 1 to 30 do StringGridTable.Cells[0,i] := IntToStr(i);
  StringGridTable.Cells[0,0] := '№';
  StringGridTable.Cells[1,0] := 'Дисциплина';
  StringGridTable.Cells[2,0] := 'Название';
  StringGridTable.Cells[3,0] := 'Автор';
  StringGridTable.Cells[4,0] := 'Год издания';
  StringGridTable.Cells[5,0] := 'Формат';
  StringGridTable.Cells[6,0] := 'Язык';

  StringGridTable.ColWidths[0] := 40;
  StringGridTable.ColWidths[1] := 100;
  StringGridTable.ColWidths[2] := 250;
  StringGridTable.ColWidths[3] := 120;
  StringGridTable.ColWidths[4] := 80;
  StringGridTable.ColWidths[5] := 60;
  StringGridTable.ColWidths[6] := 100;
end;
end.
