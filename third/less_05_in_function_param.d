module third.less_05_in_function_param;

import std.stdio : writeln;

// in == const scope

// no problem, scope works only with ref types
@safe int square(scope int x) => x * x;
@safe int cube(in int x) => square(x) * x;

// real usage:
@safe int squareIt(in int* p) {
  // *p *= *p; -- const
  return *p;
}

void main(string[] args) {
  writeln(square(3));
  writeln(cube(3));

  int x;
  writeln(squareIt(&x));
  writeln(x);
}
