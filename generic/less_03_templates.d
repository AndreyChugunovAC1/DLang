module generic.less_03_templates;

import std.stdio : writeln;

// example from dlang.org
interface Addable(T) {
  R add(this R)(T t) {
    return cast(R)this; // cast is necessary, but safe
  }
}

class List(T) : Addable!T {
  List remove(T t) {
    return this;
  }
}

void main() {
  auto list = new List!int;
  static assert(is(typeof(list.add(1)) == List!int));
  list.add(1).remove(1); // ok, List.add

  Addable!int a = list;
  // a.add calls Addable.add
  static assert(is(typeof(a.add(1)) == Addable!int));
}
