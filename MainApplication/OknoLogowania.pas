{
@@@TODO:
			        podmiana na wlasciwa tabele + kolumny po utworzeniu bazy
              @@@@uruchamianie odpowiedniego panelu w zaleznosci od roli konta --- DO ZMIANY -> BEDZIE TABELA "GRUPA"
}

unit OknoLogowania;

interface

uses
  ConnectionModule,uDB, Entities, IdGlobal, IdHash, IdHashMessageDigest,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style, System.Hash,
  FMX.ScrollBox, FMX.Grid, System.Generics.Collections, Data.DB,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Aurelius.Criteria.Linq, FMX.Ani, FMX.Layouts,
  FMX.ExtCtrls, FMX.Edit,  OknoSekretarka, OknoLaborant, OknoAdministrator;


type
  TForm2 = class(TForm)
    Zaloguj: TButton;
    Koniec: TButton;
    Label1: TLabel;
    Login: TLabel;
    Haslo: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ImageViewer1: TImageViewer;
    BitmapAnimation1: TBitmapAnimation;
    Label2: TLabel;
    Brush1: TBrushObject;
    Brush2: TBrushObject;
    procedure KoniecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure ZalogujClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Value: Int64;
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

 procedure TForm2.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text = ' ') or (Edit2.Text = ' ')   then
    Zaloguj.Enabled:= false
  else
    Zaloguj.Enabled:=true;

end;


procedure TForm2.Edit2Change(Sender: TObject);
begin
 if (Edit1.Text = '') or (Edit2.Text = '')   then
    Zaloguj.Enabled:= false
  else
    Zaloguj.Enabled:=true;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
        Zaloguj.Enabled:=false;
end;

procedure TForm2.ZalogujClick(Sender: TObject);
	var
    OsobaTestList: TList<Ttest_osoba>;
    hashMessageDigest5 : TIdHashMessageDigest5;
    Result: String;
	begin
    OsobaTestList:=DBConnection.Manager.Find<Ttest_osoba>().Where(Linq['Ftest_login'] = Edit1.Text).List;
		try
      //HASZOWANIE PODANEGO PRZEZ UZYTKOWNIKA HASLA
      hashMessageDigest5 := TIdHashMessageDigest5.Create;
      Result := IdGlobal.IndyLowerCase(hashMessageDigest5.HashStringAsHex(Edit2.Text));
		  if(OsobaTestList.count>0) and (OsobaTestList.Count<2) then
      begin
        //POROWNANIE HASZY MD5
        if (OsobaTestList.First.test_haslo = Result) then
        begin
            ShowMessage('Logowanie zakończone sukcesem!');
            Form2.Hide;
            Edit1.Text:='';
            Edit2.Text:='';
            //TODO: SPRAWDZ ROLE I URUCHOM ODPOWIEDNI PANEL
            if(OsobaTestList.First.test_typ = 1) then
            //SEKRETARKA
            Form3.ShowModal
            else if (OsobaTestList.First.test_typ = 2) then
            //LABORANT
            Form4.ShowModal
            else if (OsobaTestList.First.test_typ = 3) then
            //WYSZUKANIE
            begin
            ShowMessage('TU BEDZIE WYSZUKIWANIE');
            Form2.ShowModal
            end
            else if (OsobaTestList.First.test_typ = 4) then
            //ADMINISTRATOR
            Form5.ShowModal;
        end
        else
        showMessage('Nieprawidłowe dane logowania!');
      end
      else
      showMessage('Nieprawidłowe dane logowania!');
    finally
      FreeAndNil(OsobaTestList);
      hashMessageDigest5.Free;
    end;

end;

procedure TForm2.KoniecClick(Sender: TObject);
begin
Application.Terminate;
end;

end.
