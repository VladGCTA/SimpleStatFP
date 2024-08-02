unit CentralTendecy;

{$mode ObjFPC}{$H+}

interface

  uses
    Math, ArraySort, HelperUnit;

  // Functions
  {----------------------------------------------------------------------------
  Find range for array of Double and array of Int64
  ----------------------------------------------------------------------------}
  function range(values: array of Double): Double; overload;
  function range(values: array of Int64): Double; overload;

  {----------------------------------------------------------------------------
  Find arithmetic mean for array of Double and array of Int64
  ----------------------------------------------------------------------------}
  function mean(values: array of Double): Double; overload;
  function mean(values: array of Int64): Double; overload;

  {----------------------------------------------------------------------------
  Find harmonic mean for array of Double and array of Int64
  ----------------------------------------------------------------------------}
  function meanHarmonic(values: array of Double): Double; overload;
  function meanHarmonic(values: array of Int64): Double; overload;

  {----------------------------------------------------------------------------
  Find geometric mean for array of Double and array of Int64
  ----------------------------------------------------------------------------}
  function meanGeometric(values: array of Double): Double; overload;
  function meanGeometric(values: array of Int64): Double; overload;

  {----------------------------------------------------------------------------
  Find median for array of Double and array of Int64
  ----------------------------------------------------------------------------}
  function median(values: array of Double): Double; overload;
  function median(values: array of Int64): Double; overload;

implementation

  // Range search
  // Range for array of Double
  function range(values: array of Double): Double; overload;
  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit;
    end;

    Result := HelperUnit.maxInArray(values) - HelperUnit.minInArray(values);
  end;

  // Range for array of Int64
  function range(values: array of Int64): Double; overload;
  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := 0;
      Exit; // If array is empty return NaN
    end;

    Result := HelperUnit.maxInArray(values) - HelperUnit.minInArray(values);
  end;

  // Mean search
  // Mean for array of Double
  function mean(values: array of Double): Double; overload;

  begin

    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit; // If array is empty return NaN
    end;

    Result := Double(sumStat(values) / Length(values)); // Else return mean
  end;

  // Mean for array of Int64
  function mean(values: array of Int64): Double; overload;

  begin

    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit; // If array is empty return NaN
    end;

    Result := Double(sumStat(values) / Length(values)); // Else return mean
  end;

  {Harmonic mean = N / (sum(I^(-1))), where N is size of array, I is elements
  of array from first to last}
  // Hormonic mean for array of Double
  function meanHarmonic(values: array of Double): Double; overload;

  var
    i: Integer;
    nValues: Double;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit; // If array is empty return NaN
    end;

    nValues := Length(values);
    Result := 0;
    for i := Low(values) to High(values) do
    begin
      Result := Result + (1 / values[i]);
    end;
    Result := nValues / Result;
  end;

  // Hormonic mean for array of Double
  function meanHarmonic(values: array of Int64): Double; overload;

  var
    i: Integer;
    nValues: Int64;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := 0;
      Exit; // If array is empty return 0
    end;

    nValues := Length(values);
    Result := 0;
    for i := Low(values) to High(values) do
    begin
      Result := Result + (1 / values[i]);
    end;
    Result := nValues / Result;
  end;

  // Geometric mean search
  {Geometric mean = sqrt(prod(X), N), where X values in array, N - size
   Also for logs geometric mean = e^arithmetic mean(log(X)), where X - values
   in array}
   // Geometric mean for array of Double
  function meanGeometric(values: array of Double): Double; overload;

  var
    nValues: Integer;
    i: Integer;

  begin
    if HelperUnit.isContainLessThenZero(values) then // aslo check empty array
    begin
      Result := NaN;
      Exit; // If array contain less then 0 number or array is empty return NaN
    end;

    nValues := Length(values);
    Result := 0;

    for i := Low(values) to High(values) do
    begin
      Result := Result + (Log10(values[i]))
    end;

    Result := Power(10, (Result / nValues));

  end;

  // Geometric mean for array of Int64
  function meanGeometric(values: array of Int64): Double; overload;

  var
    nValues: Integer;
    i: Integer;

  begin
    if HelperUnit.isContainLessThenZero(values) then // also check empty array

    begin
      Result := 0;
      Exit; // If array is empty return 0
    end;

    nValues := Length(values);
    Result := 0;

    for i := Low(values) to High(values) do
    begin
      Result := Result + (Log10(values[i]))
    end;

    Result := Power(10, (Result / nValues));

  end;

  // Median search
  // Median for array of Double
  function median(values: array of Double): Double; overload;

  var
    nValues: Integer; // Size of array
    sortedValues: array of Double;
    i: Integer;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit; // If array is empty return NaN
    end;

    nValues := Length(values);
    SetLength(sortedValues, nValues);

    for i := Low(values) to High(values) do
    begin
      sortedValues[i] := values[i];
    end;

    ArraySort.insertionSort(sortedValues); // Sort from ArraySort unit

    if nValues mod 2 = 0 then
    begin
      Result := (sortedValues[nValues div 2 - 1] + sortedValues[nValues div 2]) / 2;
    end
    else
    begin
      Result := sortedValues[nValues div 2];
    end;
  end;

  //Median for array of Double
  function median(values: array of Int64): Double; overload;

  var
    nValues: Integer; // Size of array
    sortedValues: array of Int64;
    i: Integer;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := 0;
      Exit; // If array is empty return 0
    end;

    nValues := Length(values);
    SetLength(sortedValues, nValues);

    for i := Low(values) to High(values) do
    begin
      sortedValues[i] := values[i];
    end;

    ArraySort.insertionSort(sortedValues); // Sort from ArraySort unit

    if nValues mod 2 = 0 then
    begin
      Result := (sortedValues[nValues div 2 - 1] + sortedValues[nValues div 2]) / 2;
    end

    else
    begin
      Result := sortedValues[nValues div 2];
    end;
  end;

end.

