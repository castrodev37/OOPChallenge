unit Price.Interfaces;

interface

uses
  System.Classes, System.SysUtils;

type
  TDisplay = procedure(aValue : String) of object;

  iPriceParams = interface;
  iPriceOperations  = interface;

  iPriceController  = interface
  ['{43A02F67-E371-4D1B-9589-CAA77ADA96BE}']
    function Registry(aKey  : Integer; aValue : String) : iPriceController;
    function ListPrice(aValue : TStrings) : iPriceController;

  end;


  iPrice  = interface
  ['{4863608D-D95D-43E0-9925-0BF03CFC30F3}']
    function PriceParams      : iPriceParams;
    function PriceOperations  : iPriceOperations;

  end;


  iPriceOperations  = interface
  ['{71BACB9F-17DF-4339-8F33-524031820807}']
    //function GetPrice  : Currency; overload;
    function GetPrice(aValue  : String)   : Currency; overload;
    function GetPrice(aValue  : Currency) : Currency; overload;

  end;


  iPriceParams = interface
  ['{943340E4-4644-4572-A0C2-26B2834AEB98}']
    function PriceName  : String; overload;
    function PriceName(aValue  : String)    : iPriceParams; overload;
    function PriceVar   : Currency; overload;
    function PriceVar(aValue : Currency)  : iPriceParams; overload;
    function Display    : TDisplay; overload;
    function Display(aValue : TDisplay) : iPriceParams; overload;

    function &End : iPrice;
    
  end;

implementation

end.
