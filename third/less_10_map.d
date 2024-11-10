module third.less_10_map;

import std.stdio : writeln;
import std.algorithm;
import std.array;

void main(string[] args) {
  int[] arr = [1, 2, 3, 4];

  arr.map!(a => a * a);
  writeln(arr); // [1, 2, 3, 4]
  writeln(arr.map!(a => a * a)); // [1, 4, 9, 16]

  int[] arr2 = arr.map!(a => a * a).array;
  writeln(arr2); // [1, 4, 8, 16]

  // create tuple from every element:
  //    You have to use 'a', not x, or smth else in this mixin
  foreach (t; arr.map!("a + 4", a => a * a, "a * 4")) {
    writeln(t); // Tuple!(int, int, int)(*, *, *)
  }
}
