unit FrameMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses EditTable;

{$R *.dfm}

procedure TFMain.Button1Click(Sender: TObject);
begin
  FTable.ShowModal();
end;

end.
