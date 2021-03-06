unit PriceController.Classes;

interface

uses
  Price.Interfaces, System.Classes, System.Generics.Collections;

type
  TPriceController = class(TInterfacedObject, iPriceController)
    private
      FPriceDict  : TDictionary<Integer, String>;

    public
      constructor Create;
      destructor Destroy; override;
      class function New  : iPriceController;

      function Registry(aKey  : Integer; aValue : String) : iPriceController;
      function ListPrice(aValue : TStrings) : iPriceController;

  end;

var
  vPriceController : iPriceController;

implementation

{ TPriceController }

constructor TPriceController.Create;
begin
  FPriceDict  := TDictionary<Integer, String>.Create;

end;

destructor TPriceController.Destroy;
begin
  FPriceDict.Free;

  inherited;
end;

function TPriceController.ListPrice(aValue: TStrings): iPriceController;
var
 vIndex : TArray<Integer>;
 I      : Integer;

 begin
  vIndex  :=  FPriceDict.Keys.ToArray;
  TArray.Sort<Integer>(vIndex);

  for I in vIndex do
    aValue.Add(FPriceDict.Items[I]);

end;

class function TPriceController.New: iPriceController;
begin
  if not Assigned(vPriceController) then
    vPriceController  :=  Self.Create;

  Result := vPriceController;

end;

function TPriceController.Registry(aKey: Integer;
  aValue: String): iPriceController;
begin
  Result      := Self;
  FPriceDict.Add(aKey, aValue);

end;

end.
