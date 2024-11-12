module third.less_11_reduce_fold_filter;

import std.stdio : writeln;
import std.algorithm /* : fold, cumulativeFold, reduce, filter */ ;
import std.array : array;

void exampleFold() {
  int[] arr = [1, 2, 4, 5, 3];
  // fold:
  //    a, b, c... -> (((initValue, a), b), c)...

  writeln(arr.fold!((a, b) => b)); // last: 3

  // instead of this:
  writeln(arr.fold!((a, b) => a + b));
  // you can use this:
  writeln(arr.sum(0 /* init value */ ));

  writeln(arr.fold!max(int.min)); // max of any integer range (even empty)
  writeln(arr.fold!min(int.max)); // max of any integer range (even empty)
  // writeln(arr.fold!sum); // max of any integer range (even empty)

  writeln(arr.fold!(min, max)(int.max, int.min)); // pair of min and max

  // prefix sums:
  writeln([0] ~ arr.cumulativeFold!"a+b".array);
  // cumulativeFold creates 'array of results' (last element - fold)

  // prefix maximums (do not really needed):
  writeln(arr.cumulativeFold!max.array); // writeln([0] ~ arr.cumulativeFold!"a + b".array);

  // reduce is the same as fold, but:
  // reduce(init, range) = fold(range, init)
  writeln(reduce!max(int.min, arr));
}

void exampleFilter() {
  int[] arr = [1, 3, 5, 2, 4];

  writeln(arr.filter!"a % 2 == 0"
      .filter!"a > 3");

  int[] arr2 = [10, 13, 16, 15, 17, 11, 12];
  int[] arr3 = [20, 23, 26, 25, 27, 21, 22];

  import std.range;

  // chain(arr1, arr2, arr3)
  writeln(arr.chain(arr2, arr3).filter!"a % 2 == 0");

  // iota and get some primes
  writeln(iota(0, 100)
      .filter!"a > 1"
      .filter!"a <= 2 || a % 2 != 0"
      .filter!"a <= 3 || a % 3 != 0"
      .filter!"a <= 5 || a % 5 != 0"
      .filter!"a <= 7 || a % 7 != 0");

  // bad E~r~a~t~h~o~s~p~h~e~n~e
  int[] primes = iota(0, 1000).array;
  primes = primes.filter!"a > 1".array;
  writeln(primes[0]);
  foreach (int i; primes) {
    primes = primes.filter!((a) => a <= i || a % i != 0).array;
  }
  writeln(primes);
}

void main(string[] args) {
  import std.string : center;

  writeln(" fold and reduce ".center(25, '='));
  exampleFold;
  writeln(" filter ".center(25, '='));
  exampleFilter;
}
