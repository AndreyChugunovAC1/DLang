module generic.less_07_template_mixins;

import std.stdio : writeln;

template Block(T) {
  T getDefaultValue() {
    return T.init;
  }
}

mixin template PrinterX() {
  void printX() {
    writeln(x);
  }
}

mixin template Printer(alias var) {
  void printVar() {
    writeln(var);
  }
}

// mixin template -- similar to #define in C

void main(string[] args) {
  writeln(Block!int.getDefaultValue);

  alias BlockInt = Block!int;
  writeln(BlockInt.getDefaultValue);

  int x = 100;
  mixin PrinterX; // captures x from local, creates local function
  printX(); // 100

  float z = 1.3f;
  mixin Printer!z;
  printVar(); // 1.3
}













