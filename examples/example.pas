{
compile with:
fpc -Fu../src/ example.pas
}

program example;

  uses
    ArraySort,
    HelperUnit,
    CentralTendecy,
    StatisticFunc;

var
  arrDouble: array of Double;
  arrInt64: array of Int64;

  arrEmpty: array of Double;

  i: Integer;

begin
  SetLength(arrDouble, 10);
  SetLength(arrInt64, 10);

  SetLength(arrEmpty, 0);

  for i := 0 to 9 do
  begin
    arrDouble[i] := i;
    arrInt64[i] := i;
  end;

  WriteLn('Arithmetic mean in aray of 0..10 is ', CentralTendecy.mean(arrDouble):0:5);
  WriteLn('Median in aray of 0..10 is: ', CentralTendecy.median(arrInt64):0:5);

  WriteLn('Harmonic mean in emtpy array is ', CentralTendecy.meanHarmonic(arrEmpty):0:5); // becouse array is empty

  WriteLn('Standard Error in aray of 0..10 is ', StatisticFunc.standardError(arrDouble):0:5);

  WriteLn('Standard Deviation in aray of 0..10 is ', StatisticFunc.standardDeviation(arrInt64, False):0:5);

  WriteLn('is arrEmty empty: ', HelperUnit.isEmpty(arrEmpty));

  ReadLn;

end.

