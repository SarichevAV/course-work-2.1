program MyLibraryProject;

uses
  Forms,
  FrameMain in 'FrameMain.pas' {FMain},
  LinkedList in 'LinkedList.pas',
  EditTable in 'EditTable.pas' {FTable},
  IOList in 'IOList.pas',
  SearchBookByName in 'SearchBookByName.pas' {SearchElementForm},
  SearchBooksByAuthor in 'SearchBooksByAuthor.pas' {BooksForm},
  SearchBooksByDiscipline in 'SearchBooksByDiscipline.pas' {DisciplineTableForm},
  Diagramma in 'Diagramma.pas' {DiagramForm},
  LinkedFormatList in 'LinkedFormatList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFTable, FTable);
  Application.CreateForm(TSearchElementForm, SearchElementForm);
  Application.CreateForm(TBooksForm, BooksForm);
  Application.CreateForm(TDisciplineTableForm, DisciplineTableForm);
  Application.CreateForm(TDiagramForm, DiagramForm);
  Application.Run;
end.
