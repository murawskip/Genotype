{
@@TODO:       ZARZ�DZANIE U�YTKOWNIKAMI
              ZARZ�DZANIE S�OWNIKAMI
}
unit OknoAdministrator;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ExtCtrls;

type
  TForm5 = class(TForm)
    ImageViewer1: TImageViewer;
    DodajUzytkownika: TButton;
    WyswietlSpisUzytkownikow: TButton;
    ImportujSlowniki: TButton;
    Wyloguj: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Brush1: TBrushObject;
    procedure WylogujClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}
  uses OknoLogowania;
procedure TForm5.WylogujClick(Sender: TObject);
begin
Form5.Hide;
Form5.Close;
Form2.ShowModal;
end;

end.