module generic.less_02_template;

import std.stdio : writeln;

// here are some syntax:
// T must implicitly convert to float here:
// really, it's the instanciation
template Test(T : float) {
}

struct S {
  void foo(this T)() const {
    // T - ref (c/i) S
    pragma(msg, T); // saves constantness and mutability of type
  }
}

void bar() {
  const(S) s;
  (&s).foo();
  S s2;
  s2.foo();
  immutable(S) s3;
  s3.foo();
}

// specialization for (int, 10)
template foo(U : int, int v : 10) {
  U x = v;
}

void foo() {
  assert(foo!(int, 10).x == 10);
  // here: check if instanciation compiles:
  //    (do not know how compiles works really)
  static assert(!__traits(compiles, foo!(int, 11)));
}

template Block(T, string str) {
  T getterOf(T value) {
    writeln(str);
    return value;
  }
}

void printStatic(string str)() {
  pragma(msg, str); // can be called more than once
}

void printStatic(T : T[] /* T must be an array */ , size_t size)(T[] arr) {
  foreach (value; arr[0 .. size]) {
    writeln(value);
  }
}

void main(string[] args) {
  // printStatic!"Before compilation";
  writeln(Block!(int, "blabla").getterOf(3));

  alias IntBlock = Block!(int, "Integer block is here");
  printStatic!"Still before compilation";

  writeln(IntBlock.getterOf(100));

  int[] arr = [1, 2, 3, 4];
  printStatic!(typeof(arr), 3)(arr); // 1 2 3

  // the power of 'alias'
  alias arrayPrinterStatic = printStatic!(int[], 3);
  arrayPrinterStatic(arr);

  foo();
  bar();
}
