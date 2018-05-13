{
@@TODO:       IMPORT DANYCH BADANIA
}

unit OknoLaborant;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm4 = class(TForm)
    ImageViewer1: TImageViewer;
    ImportujDaneBadania: TButton;
    Wyloguj: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Brush1: TBrushObject;
    procedure WylogujClick(Sender: TObject);
    procedure ImportujDaneBadaniaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}
uses OknoLogowania,OknoImport;

procedure TForm4.ImportujDaneBadaniaClick(Sender: TObject);
begin
Form4.Hide;
Form1.Showmodal;
end;

procedure TForm4.WylogujClick(Sender: TObject);
begin
Form4.Hide;
Form4.Close;
Form2.ShowModal;
end;

end.
