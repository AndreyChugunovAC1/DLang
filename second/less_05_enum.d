module less_05_enum;

import std.stdio;

// by default like 'enum class' in C++
enum Enum : int /* string */ {
  elem1,
  elem2,
  elem4 = 4
}

void main() {
  Enum e;

  e += 3;
  writeln(e); // cast(Enum)3
  e++;
  writeln(e); // elem4
  writeln();

  import std.traits;
  foreach (elem; EnumMembers!Enum) {
    writeln(elem);
  }
}
