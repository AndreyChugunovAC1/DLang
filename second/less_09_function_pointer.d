module less_09_function_pointer;

import std.stdio;

void hello(int v) {
  writeln("Hello ", v);
}

void bye(int v) {
  writeln("Bye ", v);
}

void main(string[] args) {
  void function(int) ph = &hello;

  // that syntax is stange
  writeln(typeid(ph)); // void function(int)*

  ph(228_239); // = 228'239 (in C++) = 228239
  ph = &bye;
  ph(1000 - 7);
}
