unit StatisticFunc;

{$mode ObjFPC}{$H+}

interface

uses

  CentralTendecy,
  HelperUnit;

  // Functions
  {----------------------------------------------------------------------------
  Return varience
  ----------------------------------------------------------------------------}
  function varience(values: array of Double; isPopulation: Boolean): Double; overload;
  function varience(values: array of Int64; isPopulation: Boolean): Double; overload;

  {----------------------------------------------------------------------------
  Return standart deviation for sample (if True) or population (if false)
  ----------------------------------------------------------------------------}
  function standardDeviation(values: array of Double; isPopulation: Boolean): Double; overload;
  function standardDeviation(values: array of Int64; isPopulation: Boolean): Double; overload;
  {----------------------------------------------------------------------------
  Return standart error for sample (if True) or population (if false)
  ----------------------------------------------------------------------------}
  function standardError(values: array of Double): Double; overload;
  function standardError(values: array of Int64): Double; overload;

implementation

  // Functions of varience
  {Varience for Population = sum (N - X) / N, where N is size of array, X is
   mean. Varience for Sample = sum (N - X) / N - 1 (for unbiased estimation),
   where N is size of array, X is mean}
  // Function for array of Double
  function varience(values: array of Double; isPopulation: Boolean): Double; overload;

  var
    nValues: Integer;
    mean: Double;
    i: Integer;

  begin

    Result := 0;
    nValues := Length(values);
    mean := CentralTendecy.mean(values);

    for i := Low(values) to High(values) do
    begin
      Result := Result + sqr(values[i] - mean);
    end;
    if isPopulation then
    begin
      Result := Result / nValues;
    end

    else
    begin
      Result := Result / (nValues - 1);
    end;
  end;

  // Function for array of Int64
  function varience(values: array of Int64; isPopulation: Boolean): Double; overload;

  var
    nValues: Integer;
    mean: Double;
    i: Integer;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := 0;
      Exit; // If array is empty return 0
    end;

    Result := 0;
    nValues := Length(values);
    mean := CentralTendecy.mean(values);
    for i := Low(values) to High(values) do
    begin
      Result := Result + sqr(values[i] - mean);
    end;
    if isPopulation then
    begin
      Result := Result / nValues;
    end

    else
    begin
      Result := Result / (nValues - 1);
    end;
  end;

  // Function for standard deviation
  // Standart deviation for Double
  function standardDeviation(values: array of Double; isPopulation: Boolean): Double; overload;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit; // If array is empty return NaN
    end;

    Result := varience(values, isPopulation); // Call varience func
    Result := Sqrt(Result);
  end;

  // Standart deviation for Double
  function standardDeviation(values: array of Int64; isPopulation: Boolean): Double; overload;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := 0;
      Exit; // If array is empty return NaN
    end;

    Result := varience(values, isPopulation); // Call varience func
    Result := Sqrt(Result);
  end;

  function standardError(values: array of Double): Double; overload;

  var
    nValues: Integer;
    nSqrt: Double;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := NaN;
      Exit; // If array is empty return NaN
    end;

    nValues := Length(values);
    nSqrt := Sqrt(nValues);

    Result := standardDeviation(values, False) / nSqrt; // isPopulation is False
    // Becouse standard error count for samples

  end;

  function standardError(values: array of Int64): Double; overload;

  var
    nValues: Integer;
    nSqrt: Double;

  begin
    if HelperUnit.isEmpty(values) then
    begin
      Result := 0;
      Exit; // If array is empty return NaN
    end;

    nValues := Length(values);
    nSqrt := Sqrt(nValues);

    Result := standardDeviation(values, False) / nSqrt; // isPopulation is False
    // Becouse standard error count for samples

  end;

end.

