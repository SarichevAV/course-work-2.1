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
    Application.MessageBox('Ошибка','Книга не найдена',MB_OK+MB_ICONWARNING)
  else
    begin
      disciplineLabel.Caption := 'Дисциплина : ' + element.discipline;
      nameLabel.Caption := 'Название книги : ' + element.name;
      authorLabel.Caption := 'Автор : ' + element.author;
      yearLabel.Caption := 'Год издания : ' + IntToStr(element.yearPublish);
      formatLabel.Caption := 'Формат : ' + element.formatOfFile;
      languageLabel.Caption := 'Язык : ' + element.language;
    end;
end;

end.
