module less_12_attributes;

// @system  [can call anything]           - no guarantee
// @trusted [can call anything]           - system, but you guarantee
// @safe    [can call only safe, trusted] - guarantee safety
//  - bad casts (pointers/without inheritance/without implicit conversion)
//    there are exceptions to that rule
//  - no pointer arithmetics
//  - casting pointer to non pointers
//  - no systems
//  - no exceptions catching, except derived from Exception
//  - see https://dlang.org/spec/function.html#function-safety

// attributes can follow function
@safe
void safest() {
}

// attributes can follow block (also function's body)
void func() @trusted {
  import core.stdc.stdlib;

  // malloc - system
  int* p = cast(int*) malloc(int.sizeof);

  *p = 10;
  free(p); // example of our 'guarantee of safety'
}

@safe
void main(string[] args) {
  func();
}
