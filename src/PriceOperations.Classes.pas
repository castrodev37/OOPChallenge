unit PriceOperations.Classes;

interface

uses
  Price.Interfaces;

type
  TPriceOperations = class(TInterfacedObject, iPriceOperations)
    private
    [weak]
      FParent       : iPrice;
      //FPriceValue   : Currency;

    public
      constructor Create(aValue : iPrice);
      destructor Destroy; override;
      class function New(aValue : iPrice)  : iPriceOperations;

      //function GetPrice  : Currency; overload;
      function GetPrice(aValue  : Currency) : Currency; overload;
      function GetPrice(aValue  : String)   : Currency; overload;

      function &End : iPrice;

  end;

implementation

uses
  System.SysUtils, PriceParams.Classes;

{ TPriceOperations }

constructor TPriceOperations.Create(aValue : iPrice);
begin
  FParent :=  aValue;

end;

destructor TPriceOperations.Destroy;
begin

  inherited;
end;

function TPriceOperations.&End: iPrice;
begin
  Result := FParent;

end;

//function TPriceOperations.GetPrice: Currency;
//begin
//  Result := FPriceValue;
//
//end;

function TPriceOperations.GetPrice(aValue: Currency): Currency;
begin
  Result  := (aValue * FParent.PriceParams.PriceVar) + aValue;

  if Assigned(FParent.PriceParams.Display()) then
    FParent.PriceParams.Display()(CurrToStr(Result));

end;

function TPriceOperations.GetPrice(aValue: String): Currency;
begin
  Result := 0;

  if TryStrToCurr(aValue, Result) then
    GetPrice(StrToCurr(aValue));

end;

class function TPriceOperations.New(aValue : iPrice)  : iPriceOperations;
begin
  Result := Self.Create(aValue);

end;


end.
