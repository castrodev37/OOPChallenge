program DesafioPOO;

uses
  Vcl.Forms,
  mainUnit in 'mainUnit.pas' {Form1},
  Price.Interfaces in 'src\Price.Interfaces.pas',
  PriceController.Classes in 'src\PriceController.Classes.pas',
  Helpers.Enum in 'src\Helpers.Enum.pas',
  Feriado.Classes in 'src\Feriado.Classes.pas',
  PriceOperations.Classes in 'src\PriceOperations.Classes.pas',
  PriceParams.Classes in 'src\PriceParams.Classes.pas',
  Atacado.Classes in 'src\Atacado.Classes.pas',
  Varejo.Classes in 'src\Varejo.Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
