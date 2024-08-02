unit HelperUnit;

{$mode ObjFPC}{$H+}

interface

  uses
  math;

  const NaN = 0 / 0;

  // Functions
  {----------------------------------------------------------------------------
  Find sum of numbers in array of Double and array of Int64
  ----------------------------------------------------------------------------}
  function sumStat(values: array of Double): Double; overload;
  function sumStat(values: array of Int64): Int64; overload;

  {----------------------------------------------------------------------------
  Return True if array of Double or array of Int64 is empty
  ----------------------------------------------------------------------------}
  function isEmpty(values: array of Double): Boolean; overload;
  function isEmpty(values: array of Int64): Boolean; overload;

  {----------------------------------------------------------------------------
  Return True if array is empty
  Function isEmpty implemented here already
  ----------------------------------------------------------------------------}
  function isContainLessThenZero(values: array of Double): Boolean; overload;
  function isContainLessThenZero(values: array of Int64): Boolean; overload;

  // Find min value in array of Double or array of Int64
  function minInArray(values: array of Double): Double; overload;
  function minInArray(values: array of Int64): Int64; overload;

  {----------------------------------------------------------------------------
  Find max value in array of Double or array of Int64
  ----------------------------------------------------------------------------}
  function maxInArray(values: array of Double): Double; overload;
  function maxInArray(values: array of Int64): Int64; overload;

implementation

  // Sumation of all elements in array
  // Sum for array of Double
  function sumStat(values: array of Double): Double; overload;

  var
    sum: double;
    i: Integer;

  begin
    sum := 0;

    for i := Low(values) to High(values) do
    begin
      sum := sum + values[i];
    end;
    Result := sum;
  end;

  // Sum for array of Int64
  function sumStat(values: array of Int64): Int64; overload;

  var
    sum: Int64;
    i: Integer;

  begin
    sum := 0;
    for i := Low(values) to High(values) do
    begin
      sum := sum + values[i];
    end;
    Result := sum;
  end;

  // Helper functions for checking is array of Double or Int64 empty
  // For Double
  function isEmpty(values: array of Double): Boolean; overload;

  begin
    Result := Length(values) = 0;
  end;

  // For Int64
  function isEmpty(values: array of Int64): Boolean; overload;

  begin
    Result := Length(values) = 0;
  end;

  // Helper function for cheking is array contains values less then zero
  //For array of Double
  function isContainLessThenZero(values: array of Double): Boolean;

  var
    i: Integer;
    epsilon: Double; // For Double nums, they can be near 0, but not equal 0

  begin

    if isEmpty(values) then
    begin
      Result := True; // If empty return True
      Exit;
    end;

    Result := False;
    epsilon := 1e-10; // For near 0 value
    for i := Low(values) to High(values) do
    begin
      if values[i] <= epsilon then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

  // For array of Int64
  function isContainLessThenZero(values: array of Int64): Boolean;

  var
    i: Integer;

  begin

    if isEmpty(values) then
    begin
      Result := True; // If empty return True
      Exit;
    end;

    Result := False;

    for i := Low(values) to High(values) do
    begin
      if values[i] <= 0 then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

  // Find min value
  // Find min value in array of Double
  function minInArray(values: array of Double): Double; overload;

  var
    min: Double;
    i: Integer;

  begin
    if isEmpty(values) then
    begin
      Result := NaN; // If empty return NaN
      Exit;
    end;

    min := values[Low(values)];

    if Length(values) = 1 then
    begin
      Result := min;
      Exit;
    end;

    for i := Low(values) to High(values) do
    begin
      if values[i] < min then
      begin
        min := values[i];
      end;
    end;

    Result := min;

  end;

  // Find min value in array of Int64
  function minInArray(values: array of Int64): Int64; overload;

  var
    min: Int64;
    i: Integer;

  begin
    if isEmpty(values) then
    begin
      Result := 0; // If empty return 0
      Exit;
    end;

    min := values[Low(values)];

    if Length(values) = 1 then
    begin
      Result := min;
      Exit;
    end;

    for i := Low(values) to High(values) do
    begin
      if values[i] < min then
      begin
        min := values[i];
      end;
    end;

    Result := min;

  end;

  // Find max value
  // Find max value in array of Double
  function maxInArray(values: array of Double): Double; overload;

  var
    max: Double;
    i: Integer;

  begin
    if isEmpty(values) then
    begin
      Result := NaN; // If empty return NaN
      Exit;
    end;

    max := values[Low(values)];

    if Length(values) = 1 then
    begin
      Result := max;
      Exit;
    end;

    for i := Low(values) to High(values) do
    begin
      if values[i] > max then
      begin
        max := values[i];
      end;
    end;

    Result := max;

  end;

  // Find max value in array of Int64
  function maxInArray(values: array of Int64): Int64; overload;

  var
    max: Int64;
    i: Integer;

  begin
    if isEmpty(values) then
    begin
      Result := 0; // If empty return 0
      Exit;
    end;

    max := values[Low(values)];

    if Length(values) = 1 then
    begin
      Result := max;
      Exit;
    end;

    for i := Low(values) to High(values) do
    begin
      if values[i] > max then
      begin
        max := values[i];
      end;
    end;

    Result := max;

  end;

end.

