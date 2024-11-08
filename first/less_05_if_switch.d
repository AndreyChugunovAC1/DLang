module less_05_if_switch;

import std.stdio : writeln;

void main(string[]) {
  // ifs works like in C++

  // ternary
  bool condition = false;
  int value_if_true = 10, value_if_false = -10;

  writeln(condition ? value_if_true : value_if_false);

  // switch
  int value = 2;

  switch (value) {
  case 1:
    writeln("value is 1");
    break; // required here
  case 2:
    writeln("value is 2");
    goto case; // like there is no break
    // it's required here if we want to stack cases
  case 3:
    writeln("value is 2 or 3");
    break;
  default: // required in every switch
    // no break required
  }

  switch (value) {
  case 1: .. case 10:
    writeln(value, " is in range [1..10]");
    break;
  default:
    break;
  }

  switch (value) {
  case 1, 2, 5, 7, 10, 11, 12, 14, 15:
    writeln("value in [1, 2, 5, 7, 10, 11, 12, 14, 15]");
    break;
  default:
  }

  enum Enum {
    e1,
    e2,
    e3
  }

  Enum e; // init == Enum.e1

  switch (e) {
  case e.e1:
    writeln("e == Enum.e1");
    break;
  default:
  }

  final switch (e) {
  case e.e1:
    writeln("e == Enum.e1");
    break;
  case e.e2:
    writeln("e == Enum.e2");
    break;
  case e.e3:
    writeln("e == Enum.e3");
    break;
    // default: -- not allowed in final switch
    // you must specify all the cases of enum.
  }

  // occasional addition: signed and unsigned comparison
  int a = -5;
  uint b = 5;
  
  if (a > b) {
    // this branch will take place: -5 > 5u
    writeln(a, " is bigger than ", b);
  } else {
    writeln(a, " is NOT bigger than ", b);
  }
}
