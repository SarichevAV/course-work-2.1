unit SearchBookByName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TSearchElementForm = class(TForm)
    nameBook: TEdit;
    SearchButton: TButton;
    disciplineLabel: TLabel;
    nameLabel: TLabel;
    authorLabel: TLabel;
    yearLabel: TLabel;
    formatLabel: TLabel;
    languageLabel: TLabel;
    procedure SearchButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SearchElementForm: TSearchElementForm;

implementation

uses LinkedList, EditTable;
{$R *.dfm}



procedure TSearchElementForm.SearchButtonClick(Sender: TObject);
var
  name : string;
  element : list;
begin
  name := nameBook.Text;
  element := getSearchElement(name, tableList);
  if element = nil then
    Application.MessageBox('������','����� �� �������',MB_OK+MB_ICONWARNING)
  else
    begin
      disciplineLabel.Caption := '���������� : ' + element.discipline;
      nameLabel.Caption := '�������� ����� : ' + element.name;
      authorLabel.Caption := '����� : ' + element.author;
      yearLabel.Caption := '��� ������� : ' + IntToStr(element.yearPublish);
      formatLabel.Caption := '������ : ' + element.formatOfFile;
      languageLabel.Caption := '���� : ' + element.language;
    end;
end;

end.
