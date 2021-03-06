unit Atacado.Classes;

interface

uses
  Price.Interfaces;

type
  TAtacado = class(TInterfacedObject, iPrice)
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

{ TAtacado }

constructor TAtacado.Create;
begin
  PriceParams
    .PriceName('Atacado')
    .PriceVar(0.1);

end;

destructor TAtacado.Destroy;
begin

  inherited;
end;

class function TAtacado.New: iPrice;
begin
  Result  :=  Self.Create;

end;

function TAtacado.PriceOperations: iPriceOperations;
begin
  if not Assigned(FPriceOperations) then
    FPriceOperations  :=  TPriceOperations.New(Self);

  Result := FPriceOperations;

end;

function TAtacado.PriceParams: iPriceParams;
begin
  if not Assigned(FPriceParams) then
    FPriceParams  :=  TPriceParams.New(Self);

  Result := FPriceParams;

end;

initialization
  TPriceController.New.Registry(Integer(eAtacado), TAtacado.New.PriceParams.PriceName);

end.
