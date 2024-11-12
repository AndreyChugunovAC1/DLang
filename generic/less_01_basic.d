module generic.less_01_basic;

import std.stdio : writeln;

auto add1(T)(inout /* ref  */ T val1, inout /* ref  */T val2) {
  return val1 + val2;
}

auto add2(T, U)(T val1, U val2) {
  return val1 + val2;
}

void main(string[] args) {
  // remember:
  int n = 100;
  foreach (i; 0 .. n) { // wow
    writeln(i);
  }
  writeln(add1(1, 2));
  writeln(add2(0.4f, 0.7));
}