module third.less_02_pure_functions;

import std.stdio : writeln;

// run this code like that:
// rdmd -debug .\third\less_02_pure_functions.d

immutable int immutableGlobalVariable = -42;
int mutableGlobalVariable = 47;

// "pure" functions are pure (as term)
//    they can not change mutable global state
//    and their behavour can not depend on it:
//    similar arguments == similar behavour
// pure functions can call only pure functions
uint increment(uint x) pure {
  // pure int increment(uint x) {
  // pure increment(uint x) {

  x += immutableGlobalVariable; // OK, immutable guarantee unchangement
  // x += mutableGlobalVariable; -- Not allowed

  // debug keyword -- this code 
  //    will run only in debug mode, use flag -debug
  ///   so this does not affect real pureness of "increment"
  debug writeln("inc of x is: ", x);

  // "debug:" can be used in structures:
  struct WithDebugFields {
    int usual;
    debug : int onlyInDebug = 999;
  }

  WithDebugFields wdf;
  debug writeln(wdf);
  return wdf.sizeof;
}

// pureness inside structures:
struct Struct {
  int value;

  pure changeValue() {
    // it's local state:
    value += immutableGlobalVariable;
    // value += mutableGlobalVariable; -- No
    return value;
  }
}

// weak purity:
pure weak(int[] arr) {
  arr[] += 1;
  return arr[0];
}

// strong purity:
//    you have to track it yourself:
pure strong(immutable(int)[] arr) {
  // arr[] += 1;
  return arr[0];
}

void main(string[] args) {
  writeln(increment(10)); // 8 in debug, 4 really
  Struct s;
  s.changeValue();
  s.value.writeln; // -42
  weak([1, 2, 3]).writeln;
  strong([1, 2, 3]).writeln;
}
