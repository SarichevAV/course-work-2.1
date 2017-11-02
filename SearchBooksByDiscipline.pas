unit SearchBooksByDiscipline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TDisciplineTableForm = class(TForm)
    DisciplineEdit: TEdit;
    SearchButton: TButton;
    StringGridDisciplineTable: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DisciplineTableForm: TDisciplineTableForm;

implementation

uses EditTable, LinkedList;

{$R *.dfm}
procedure sortStringGrid(StrGrid: TStringGrid; NoColumn: Integer);
var
  Line, PosActual: Integer;
  Row: TStringList;
  Renglon :TStringList;
begin
  Renglon := TStringList.Create;
  Row := TStringList.Create;
  for Line := 1 to StrGrid.RowCount-1 do
    begin
      PosActual := Line;
      Row.Assign(StrGrid.Rows[PosActual]);
        while True do
          begin
            if (PosActual = 1) or (Row.Strings[NoColumn] >= StrGrid.Cells[NoColumn,PosActual-1]) then break;
            StrGrid.Rows[PosActual] := StrGrid.Rows[PosActual-1];
          Dec(PosActual);
        end;
      if (Row.Strings[NoColumn] < StrGrid.Cells[NoColumn,PosActual])
  then StrGrid.Rows[PosActual].Assign(Row);
  end;
  Row.Free;
  Renglon.Free;
end;


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

procedure TDisciplineTableForm.FormShow(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to 30 do StringGridDisciplineTable.Cells[0,i] := IntToStr(i);
  StringGridDisciplineTable.Cells[0,0] := '№';
  StringGridDisciplineTable.Cells[1,0] := 'Дисциплина';
  StringGridDisciplineTable.Cells[2,0] := 'Название';
  StringGridDisciplineTable.Cells[3,0] := 'Автор';
  StringGridDisciplineTable.Cells[4,0] := 'Год издания';
  StringGridDisciplineTable.Cells[5,0] := 'Формат';
  StringGridDisciplineTable.Cells[6,0] := 'Язык';

  StringGridDisciplineTable.ColWidths[0] := 40;
  StringGridDisciplineTable.ColWidths[1] := 100;
  StringGridDisciplineTable.ColWidths[2] := 250;
  StringGridDisciplineTable.ColWidths[3] := 120;
  StringGridDisciplineTable.ColWidths[4] := 80;
  StringGridDisciplineTable.ColWidths[5] := 60;
  StringGridDisciplineTable.ColWidths[6] := 100;
end;

procedure TDisciplineTableForm.SearchButtonClick(Sender: TObject);
var
  discipline : string;
  myList : list;
  i : integer;
begin
  discipline := DisciplineEdit.Text;
  myList := getListBooksDiscipline(discipline, tableList);
  DownloadTable(StringGridDisciplineTable, myList);
  SortStringGrid(StringGridDisciplineTable, 2);
  for i := 1 to StringGridDisciplineTable.RowCount - 1 do StringGridDisciplineTable.Cells[0,i] := IntToStr(i);
end;
end.
