unit Feriado.Classes;

interface

uses
  Price.Interfaces;

type
  TFeriado = class(TInterfacedObject, iPrice)
    private
      FPriceParams      : iPriceParams;
      FPriceOperations  : iPriceOperations;

    public
      constructor Create;
      destructor Destroy; override;
      class function New  : iPrice;

      function PriceParams      : iPriceParams;
      function PriceOperations  : iPriceOperations;

  end;

implementation

uses
  PriceOperations.Classes, PriceParams.Classes, PriceController.Classes,
  Helpers.Enum;

{ TFeriado }

constructor TFeriado.Create;
begin
  PriceParams
    .PriceName('Feriado')
    .PriceVar(0.5);

end;

destructor TFeriado.Destroy;
begin

  inherited;
end;

class function TFeriado.New: iPrice;
begin
  Result  :=  Self.Create;

end;

function TFeriado.PriceOperations: iPriceOperations;
begin
  if not Assigned(FPriceOperations) then
    FPriceOperations  :=  TPriceOperations.New(Self);

  Result := FPriceOperations;

end;

function TFeriado.PriceParams: iPriceParams;
begin
  if not Assigned(FPriceParams) then
    FPriceParams  :=  TPriceParams.New(Self);

  Result := FPriceParams;

end;


initialization
  TPriceController.New.Registry(Integer(eFeriado), TFeriado.New.PriceParams.PriceName);

end.
