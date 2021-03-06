unit PriceParams.Classes;

interface

uses
  Price.Interfaces;

type
  TPriceParams = class(TInterfacedObject, iPriceParams)
    private
    [weak]
      FParent       : iPrice;
      FPriceName    : String;
      FPriceVar     : Currency;
      FDisplay      : TDisplay;

    public
      constructor Create(aValue : iPrice);
      destructor Destroy; override;
      class function New(aValue : iPrice) : iPriceParams;

      function PriceName    : String; overload;
      function PriceName(aValue  : String)    : iPriceParams; overload;
      function PriceVar : Currency; overload;
      function PriceVar(aValue : Currency)  : iPriceParams; overload;
      function Display    : TDisplay; overload;
      function Display(aValue : TDisplay) : iPriceParams; overload;

      function &End : iPrice;

  end;

implementation

uses
  System.SysUtils;

{ TPriceParams }

constructor TPriceParams.Create(aValue: iPrice);
begin
  FParent :=  aValue;

end;

destructor TPriceParams.Destroy;
begin

  inherited;
end;

function TPriceParams.Display(aValue: TDisplay): iPriceParams;
begin
  Result    :=  Self;
  FDisplay  :=  aValue;

end;

function TPriceParams.Display: TDisplay;
begin
  Result := FDisplay;

end;

function TPriceParams.&End: iPrice;
begin
  Result := FParent;

end;

class function TPriceParams.New(aValue: iPrice): iPriceParams;
begin
  Result := Self.Create(aValue);

end;

function TPriceParams.PriceName: String;
begin
  Result := FPriceName;

end;

function TPriceParams.PriceName(aValue: String): iPriceParams;
begin
  Result      :=  Self;
  FPriceName  :=  aValue;

end;

function TPriceParams.PriceVar(aValue: Currency): iPriceParams;
begin
  Result    := Self;
  FPriceVar :=  aValue;

end;

function TPriceParams.PriceVar: Currency;
begin
  Result := FPriceVar;

end;

end.
