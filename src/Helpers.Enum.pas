unit Helpers.Enum;

interface

uses
  Price.Interfaces;

type
  TPricesEnum = (eFeriado, eAtacado, eVarejo);

  TPriceHelper = record helper for TPricesEnum
    function This : iPrice;

  end;

implementation

uses
  Feriado.Classes, Atacado.Classes, Varejo.Classes;

{ TPriceHelper }

function TPriceHelper.This: iPrice;
begin
  case Self of
    eFeriado: Result  := TFeriado.New;
    eAtacado: Result  := TAtacado.New;
    eVarejo:  Result  := TVarejo.New;
  end;

end;

end.
