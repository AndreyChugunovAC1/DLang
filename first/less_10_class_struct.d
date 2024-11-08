module less_10_class_struct;

import std.stdio;

// reference semantics
class Class {
  int[10] data;
}

// value semantics
struct Struct {
  int[10] data;
}

void main() {
  writeln(Class.sizeof);  // 8 (on my pc) -- size of pointer
  writeln(Struct.sizeof); // 40           -- 10 * sizeof(int)
}