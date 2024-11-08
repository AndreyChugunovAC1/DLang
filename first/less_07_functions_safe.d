module less_07_functions_safe;

import std.conv;
import std.stdio;

// no pointer arithmetics, 'reinterpret_casts',
// system calls, bad unions, void bas stuff, stc --> @safe
@safe
void checkEquality(T)(T a, T b) {
  if (a != b) {
    writeln("Informing you: ", a, " != ", b);
  }
}

void main(string[] args) {
  int x = to!int("109");

  x += 91;
  writeln(x);
  checkEquality(x, 109);
}
