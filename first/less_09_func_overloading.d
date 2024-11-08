module less_09_func_overloading;

import std.stdio;

void int_or_uint(int) {
  writeln("Int called");
}

void int_or_uint(uint) {
  writeln("Unsigned int called");
}

void generallyUncallableFromInt(bool) {
}

void main() {
  int_or_uint(0);
  int_or_uint(100);
  int_or_uint(int.max + 1);
  int_or_uint(1u);
  generallyUncallableFromInt(1);
  // generallyUncallableFromInt(2);
}
