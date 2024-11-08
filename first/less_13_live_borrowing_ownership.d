module less_13_live_borr_own;

// there is one owner (live mutable pointer) -- like in rust
// others - read-only

import std.stdio;
import core.stdc.stdlib;

// nogc attribute says,
// that this function do not use gc
// so there are relevant requirements to that
@nogc @system
int* allocate() {
  int* p = cast(int*) malloc(int.sizeof);

  // writeln("pointer: ", p);
  return p;
}

@nogc @system
void release(int* p) {
  free(p);
}

@live
void test() {
  auto p = allocate();

  release(p);
}

void main(string[] args) {
  test;
}
