module third.less_08_lazy;

import std.stdio : writeln;
import core.thread.osthread;
import std.datetime;

// "lazy T" means that you are going to call function, that is
//    returning type T (we'll talk about delegates later)
//    you can still pass parameters to longComputationWithParameters
//    and it still won't be called.
void expencive(bool condition, lazy int value) {
  if (condition) {
    writeln("Compued: ", value);
  }
  writeln("No work to do");
}

int longComputation() {
  writeln("computing...");
  Thread.sleep(dur!"seconds"(3));
  writeln("finished.");
  return 42;
}

int longComputationWithParameters(int something) {
  writeln("computing...");
  Thread.sleep(dur!"seconds"(3));
  writeln("finished.");
  return something;
}

// also possible:
//    lazy void -- for void function
void callIfNeeded(bool need, lazy void call) {
  if (need) {
    call;
  }
}

void main(string[] args) {
  expencive(false, longComputation); // no work to do
  expencive(false, longComputationWithParameters(100)); // no work to do
  // it's done fast
}