module third.less_03_scopes;

import std.stdio : writeln;

struct Struct {
  this(string s) {
    ("[Struct]: hello " ~ s).writeln;
  }

  ~this() {
    "[Struct]: destroyed".writeln;
  }
}

@trusted /* @nogc -- we use writeln */
void trustedFunc() {
  import core.stdc.stdlib;

  int* p = cast(int*)malloc(int.sizeof);
  scope (exit) {
    free(p); // I'm safe!
  }

  *p = 100;
  writeln(p, " points to value ", *p);
}

void main(string[] args) {
  auto s = Struct("dude");

  // always happens at end:
  scope (exit) {
    // before Struct's destructor:
    writeln("exiting...");
  }

  // happens only if nothing was thrown
  scope (success) {
    writeln("succeed");
  }

  // happens only if something was thrown
  scope (failure) {
    writeln("failed");
  }

  scope (exit)
    writeln("oneline exiting...");

  trustedFunc;
}
