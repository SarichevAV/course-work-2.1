unit Diagramma;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, LinkedFormatList;

  const
  widthColomns = 50;
type
  TDiagramForm = class(TForm)
    Image: TImage;
    procedure FormShow(Sender: TObject);
end;

var
  DiagramForm: TDiagramForm;
  formsList : formatList;

implementation

uses EditTable, LinkedList;
{$R *.dfm}

procedure setSizeForm(collumnsCount : integer);
var
  widthForm : integer;
begin
  widthForm := widthColomns*(1 + 2*collumnsCount);
  DiagramForm.Width := widthForm;
  DiagramForm.Image.Width := widthForm;
end;

procedure drawDiagramm(booksCount : integer);
var
  temp : formatList;
  x1, x2, xText : integer;
  nameFormat : string;
  procentFormat : integer;
  stringProcentFormat : string;
begin
  randomize;
  x1 := widthColomns;
  x2 := 2*widthColomns;
  temp := formsList;
  while temp <> nil do
    begin
      nameFormat := temp^.name;
      procentFormat := Round(temp^.count/booksCount*100);
      stringProcentFormat := IntToStr(procentFormat) + ' %';
      with DiagramForm.Image.Canvas do
        begin
          Brush.Color := rgb(random(255), random(255), random(255));
          Rectangle(x1, 130-procentFormat, x2, 130);
          Brush.Style := bsClear;
          Font.Name := 'Tahoma';
          Font.Size := 8;
          xText := Round(x1 +(x2-x1-TextWidth(nameFormat)) div 2);
          Textout(xText, 130 + Font.Size, nameFormat);
          xText := Round(x1 +(x2-x1-TextWidth(stringProcentFormat)) div 2);
          Textout(xText, 120-procentFormat-Font.Size, stringProcentFormat);
          x1 := x1 + 2*widthColomns;
          x2 := x2 + 2*widthColomns;
        end;
      temp := temp^.next
    end;
end;

procedure TDiagramForm.FormShow(Sender: TObject);
var
  collumnsCount : integer;
  booksCount : integer;
begin
  formsList := nil;
  createFormatList(formsList, tableList);
  collumnsCount := getSizeFormatList(formsList);
  setSizeForm(collumnsCount);
  booksCount := getSizeList(tableList);
  drawDiagramm(booksCount);
end;

end.
