unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Price.Interfaces;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FPrice : iPrice;

    procedure PrintMemo(aValue  : String);
    procedure GetNameAndPrice(aPrice  : iPrice);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  PriceController.Classes, Helpers.Enum;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  GetNameAndPrice(FPrice);
  FPrice.PriceOperations.GetPrice(Edit1.Text);

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  FPrice  :=
    TPricesEnum(ComboBox1.ItemIndex)
      .This
      .PriceParams
        .Display(PrintMemo)
      .&End;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown :=  True;

  TPriceController.New.ListPrice(ComboBox1.Items);

end;

procedure TForm1.GetNameAndPrice(aPrice: iPrice);
begin
  Memo1.Lines.Add(aPrice.PriceParams.PriceName);
end;

procedure TForm1.PrintMemo(aValue: String);
begin
  Memo1.Lines.Add(aValue);

end;

end.
