unit ArraySort;

{$mode ObjFPC}{$H+}

interface

  // Procedures
  procedure insertionSort(var arr: array of Double); overload;
  procedure insertionSort(var arr: array of Int64); overload;

  procedure shellSort(var arr: array of Double); overload;
  procedure shellSort(var arr: array of Int64); overload;

implementation

    procedure insertionSort(var arr: array of Double); overload;

    var
      key: Double;
      i: Integer;
      j: Integer;

    begin

      if Length(arr) = 0 then
      begin
        Exit;
      end;

      for j := (Low(arr) + 1) to High(arr) do
      begin
        key := arr[j];
        i := j - 1;
        while (i >= Low(arr)) and (arr[i] > key) do
        begin
          arr[i + 1] := arr[i];
          i := i - 1;
        end;
        arr[i + 1] := key;
      end;
    end;

    procedure insertionSort(var arr: array of Int64); overload;

    var
      key: Int64;
      i: Integer;
      j: Integer;

    begin

      if Length(arr) = 0 then
      begin
        Exit;
      end;

      for j := (Low(arr) + 1) to High(arr) do
      begin
        key := arr[j];
        i := j - 1;
        while (i >= Low(arr)) and (arr[i] > key) do
        begin
          arr[i + 1] := arr[i];
          i := i - 1;
        end;
        arr[i + 1] := key;
      end;
    end;

    procedure shellSort(var arr: array of Double); overload;

    var
      endValue: Integer;
      step: Integer;
      i: Integer;
      j: Integer;
      delta: Integer;
      temp: Double;

    begin

      if Length(arr) = 0 then
      begin
        Exit;
      end;

      endValue := Length(arr);
      step := endValue div 2;

      while step > 0 do
      begin
        for i := step to endValue - 1 do
        begin
          j := i;
          delta := j - step;
          while (delta >= 0) and (arr[delta] > arr[j]) do
          begin
            temp := arr[delta];
            arr[delta] := arr[j];
            arr[j] := temp;

            j := delta;
            delta := j - step;
          end;
        end;
        step := step div 2;
      end;
    end;

        procedure shellSort(var arr: array of Int64); overload;
    var
      endValue: Integer;
      step: Integer;
      i: Integer;
      j: Integer;
      delta: Integer;
      temp: Int64;

    begin

      if Length(arr) = 0 then
      begin
        Exit;
      end;

      endValue := Length(arr);
      step := endValue div 2;

      while step > 0 do
      begin
        for i := step to endValue - 1 do
        begin
          j := i;
          delta := j - step;
          while (delta >= 0) and (arr[delta] > arr[j]) do
          begin
            temp := arr[delta];
            arr[delta] := arr[j];
            arr[j] := temp;

            j := delta;
            delta := j - step;
          end;
        end;
        step := step div 2;
      end;
    end;

end.

