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

// @safe can be used as:
//    that marks all the functions below it as safe 
@safe:

void main(string[] args) {
  int x = to!int("109");

  x += 91;
  writeln(x);
  checkEquality(x, 109);
}
