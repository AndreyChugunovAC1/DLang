module less_10_short_functions;

import std.stdio;

void main() {
  @safe
  pure auto max(T)(T a, T b) => a > b ? a : b;

  auto id(int a) => a;

  writeln(max(100, 0));
  writeln(typeid(max(100, 0))); // int

  writeln(max(100.0f, -1.0f));
  writeln(typeid(max(100.0f, -1.0f))); // float
}