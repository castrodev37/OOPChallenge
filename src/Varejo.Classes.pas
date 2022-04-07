unit Varejo.Classes;

interface

uses
  Price.Interfaces;

type
  TVarejo = class(TInterfacedObject, iPrice)
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

constructor TVarejo.Create;
begin
  PriceParams
    .PriceName('Varejo')
    .PriceVar(0.3);

end;

destructor TVarejo.Destroy;
begin

  inherited;
end;

class function TVarejo.New: iPrice;
begin
  Result  :=  Self.Create;

end;

function TVarejo.PriceOperations: iPriceOperations;
begin
  if not Assigned(FPriceOperations) then
    FPriceOperations  :=  TPriceOperations.New(Self);

  Result := FPriceOperations;

end;

function TVarejo.PriceParams: iPriceParams;
begin
  if not Assigned(FPriceParams) then
    FPriceParams  :=  TPriceParams.New(Self);

  Result := FPriceParams;

end;

initialization
  TPriceController.New.Registry(Integer(eVarejo), TVarejo.New.PriceParams.PriceName);


end.
