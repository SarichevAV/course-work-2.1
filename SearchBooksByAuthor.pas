unit SearchBooksByAuthor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TBooksForm = class(TForm)
    authorEdit: TEdit;
    FromEdit: TEdit;
    Label1: TLabel;
    BeforeEdit: TEdit;
    Button1: TButton;
    StringGridTable1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BooksForm: TBooksForm;

implementation

uses EditTable, LinkedList;

{$R *.dfm}

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

procedure TBooksForm.Button1Click(Sender: TObject);
var
  from, before : integer;
  author : string;
  myList : list;
begin
  BooksForm.Width := 932;
  BooksForm.Position := poMainFormCenter;
  StringGridTable1.Visible := true;
  author := authorEdit.Text;
  from := StrToInt(fromEdit.Text);
  before := StrToInt(beforeEdit.Text);
  myList := getListBooksAuthor(author, from, before, tableList);
  DownloadTable(StringGridTable1, myList);
end;

procedure TBooksForm.FormShow(Sender: TObject);
var
  i : integer;
begin
  for I := 1 to 30 do StringGridTable1.Cells[0,i] := IntToStr(i);
  StringGridTable1.Cells[0,0] := '№';
  StringGridTable1.Cells[1,0] := 'Дисциплина';
  StringGridTable1.Cells[2,0] := 'Название';
  StringGridTable1.Cells[3,0] := 'Автор';
  StringGridTable1.Cells[4,0] := 'Год издания';
  StringGridTable1.Cells[5,0] := 'Формат';
  StringGridTable1.Cells[6,0] := 'Язык';

  StringGridTable1.ColWidths[0] := 40;
  StringGridTable1.ColWidths[1] := 100;
  StringGridTable1.ColWidths[2] := 250;
  StringGridTable1.ColWidths[3] := 120;
  StringGridTable1.ColWidths[4] := 80;
  StringGridTable1.ColWidths[5] := 60;
  StringGridTable1.ColWidths[6] := 100;
  StringGridTable1.Visible := false;
end;


end.
