This is simple statistic library for Free Pascal written for my programming practice.
It contains 4 units:
1) ArraySort - an auxiliary module with the implementation of two sorts - Shell Sort and Insertion Sort for arrays of Double and arrays of Int64
2) HelperUnit - an auxiliary module with functions: checking an array for emptiness, checking an array for values ​​less than or equal to 0, sum of array elements, searching for a smaller array element, searching for a larger array element
3) CentralTendency - module with functions: search for range, arithmetic mean, harmonic mean, geometric mean, median
4) StatisticFunc - module with functions: variance search, standard deviation search, standard error search

For compiling example use
fpc -Fu../src/ example.pas