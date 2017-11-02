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

// ������������� ������
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
  emptyList := nil; // ������� ������
  // ��������� �� ���� �������
  for i := 1 to StringGrid.RowCount - 1 do
    begin
      // ��������� ���������� � �����
      discipline := StringGrid.Cells[1,i];
      name := StringGrid.Cells[2,i];
      author := StringGrid.Cells[3,i];
      yearPublish := StrToInt(StringGrid.Cells[4,i]);
      formatOfFile := StringGrid.Cells[5,i];
      language := StringGrid.Cells[6,i];
      // ��������� ������� � ������
      LinkedList.add(emptyList, discipline, name, author, yearPublish, formatOfFile, language);
    end;
end;

// ��������� ������� ������� �� ������
procedure DownloadTable(StringGrid : TStringGrid; downloadList : list);
var
  size, i : integer;
begin
  // ���������� ����� ������
  size := getSizeList(downloadList);
  // ������� ������ � �������
  StringGrid.RowCount := size + 1;
  // ������� � ������� ���������� � �����
  for i := 1 to size do begin
    StringGrid.Cells[0,i] := IntToStr(i);
    StringGrid.Cells[1,i] := downloadList^.discipline;
    StringGrid.Cells[2,i] := downloadList^.name;
    StringGrid.Cells[3,i] := downloadList^.author;
    StringGrid.Cells[4,i] := IntToStr(downloadList^.yearPublish);
    StringGrid.Cells[5,i] := downloadList^.formatOfFile;
    StringGrid.Cells[6,i] := downloadList^.language;
    // ��������� � ���������� �������� ������
    downloadList := downloadList^.next;
  end;
end;

// ��������� ������� ���������� � ��������� ����
procedure TFTable.SaveButtonClick(Sender: TObject);
var
  fileName : string;
begin
  // ������� ������ �� ��������� �������
  initList(StringGridTable, tableList);
  if SaveDialog1.Execute then begin
    // ���������� ���� � �����
    fileName := SaveDialog1.FileName;
    // ��������� ������ � ��������� ����
    SaveTextFile(myTextFile, fileName, tableList);
  end;
end;

// ��������� ������� ���������� ������ � �������
procedure TFTable.AddRowButtonClick(Sender: TObject);
begin
  // ��������� ������
  StringGridTable.RowCount := StringGridTable.RowCount + 1;
  // ���������� ����� ������ � ���� '�'
  StringGridTable.Cells[0, StringGridTable.RowCount - 1] := IntToStr(StringGridTable.RowCount - 1);
end;

// ��������� ������� �������� ������ �� �������
procedure TFTable.RemoveRowButtonClick(Sender: TObject);
begin
  // ��������� ��������� ����� � �������
  if StringGridTable.RowCount > 2 then
    begin
      // ������� ������
      StringGridTable.Rows[StringGridTable.RowCount - 1].Clear;
      // ������� ������
      StringGridTable.RowCount := StringGridTable.RowCount - 1;
    end;
  // ���� ������ ������� �������
  if StringGridTable.RowCount = 2 then
    begin
      // ������� ������
      StringGridTable.Rows[1].Clear;
      // ��������� ������ ������
      StringGridTable.Cells[0,1] := IntToStr(StringGridTable.RowCount - 1);
    end;
end;

// ��������� ������� ������� �������
procedure TFTable.InfoAdoutBookButtonClick(Sender: TObject);
begin
  try
    InitList(StringGridTable, tableList);
    SearchElementForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('�� ���������� ������ ����!','������',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.BooksByAuthorButtonClick(Sender: TObject);
begin
  try
    InitList(StringGridTable, tableList);
    BooksForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('�� ���������� ������ ����!','������',MB_OK+MB_ICONWARNING)
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
        Application.MessageBox('�� ���������� ������ ����!','������',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.ClearTableClick(Sender: TObject);
var
  count : integer;
begin
  // ���������� ����������� ����� � �������
  count := StringGridTable.RowCount;
  // �������� �� ���� ����������� ������� �������
  while count >= 1 do
    begin
      // ������� ����� ������
      StringGridTable.Rows[count].Clear;
      // ��������� � ���������
      count := count - 1;
    end;
  tableList := nil;
end;

// ��������� ������� �������� ������� �� ���������� �����
procedure TFTable.DiagramButtonClick(Sender: TObject);
begin
  try
    InitList(StringGridTable, tableList);
    DiagramForm.ShowModal();
  except
     on EConvertError do
        Application.MessageBox('�� ���������� ������ ����!','������',MB_OK+MB_ICONWARNING)
  end;
end;

procedure TFTable.DownloadButtonClick(Sender: TObject);
var
  fileName : string;
begin
  if OpenDialog1.Execute then
    begin
      // ���������� ���� �� �����
      fileName := OpenDialog1.FileName;
      // ���������� ���������� ����� � ������
      ReadTextFile(myTextFile, fileName, tableList);
      // ��������� ������ �� ������ � �������
      DownloadTable(StringGridTable, tableList);
    end;
end;


procedure TFTable.FormShow(Sender: TObject);
var
  i :integer;
begin
  StringGridTable.RowCount := 10;
  for I := 1 to 30 do StringGridTable.Cells[0,i] := IntToStr(i);
  StringGridTable.Cells[0,0] := '�';
  StringGridTable.Cells[1,0] := '����������';
  StringGridTable.Cells[2,0] := '��������';
  StringGridTable.Cells[3,0] := '�����';
  StringGridTable.Cells[4,0] := '��� �������';
  StringGridTable.Cells[5,0] := '������';
  StringGridTable.Cells[6,0] := '����';

  StringGridTable.ColWidths[0] := 40;
  StringGridTable.ColWidths[1] := 100;
  StringGridTable.ColWidths[2] := 250;
  StringGridTable.ColWidths[3] := 120;
  StringGridTable.ColWidths[4] := 80;
  StringGridTable.ColWidths[5] := 60;
  StringGridTable.ColWidths[6] := 100;
end;
end.
