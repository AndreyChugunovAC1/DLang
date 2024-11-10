module third.less_04_scope_parameters;

import std.stdio : writeln;

@safe:

class Class {
  int value = 600;
}

// scope - attribute for REFERENCE types only and only for @safe functions.
// for value types it has no effect.
// it means, that it can not escape this function by being:
//    - returned
//    - assigned to global state
// all that may be understood as escaping {} (curly brackets)
// WHY:
//    (C) the compiler can potentially avoid
//        heap-allocating a unique argument to a scope parameter
auto scopeParam(scope Class c, scope int* p) {
  // these parameters can not be passed to non-scope parameterized functions:
  // noScoper(p); -- error - it may escape our p
  scoper(p); // OK
  // return c; -- escaping the scope!
  return 10;
}

// pure & scope are similar
//  pure - for entire function
//  scope - for parameter.

void scoper(scope int* p) {
}

void noScoper(int* p) {
}

// there is also 'return scope'
// that's the same as scope, but return is possible:
auto retScopeParam(return scope int* p) {
  // noScoper(p); -- error - it may escape our p
  scoper(p);
  // we can change it:
  // p = ... (but I do not want that)
  return p; // now it is possible
}



void main(string[] args) {
  Class c = new Class;
  int* x = new int;

  writeln(scopeParam(c, x));
  writeln(retScopeParam(x));
}


