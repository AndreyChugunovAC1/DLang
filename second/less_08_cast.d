module less_08_cast;

import std.stdio;

void main(string[] args) {
  // cast allowed in inheritance and work like dynemic_cast
  class Base {
  }

  class Derived : Base {
  }

  writeln(cast(Derived)(new Base)); // nullptr
  writeln(cast(Base)(new Derived));

  // allowed implicit:
  float vf = 3u;
  writeln(vf);

  // not allowed implicit:
  int vi = cast(int) 3.3f;
  writeln(vi);

  // a.k.a. SO optimization example:
  import core.stdc.string;

  ubyte[4] storage;
  int value = 0xABCD;
  int otherValue = -1;

  memcpy(&storage, &value, value.sizeof); // memcpy(&storage[0], ...
  otherValue = *cast(int*)&storage; // *cast(int*)&storage[0]

  writeln(value, " == ", otherValue);

  import std.conv;

  // writeln("" ~ 2);         // smile face (smth from unicode)
  writeln("" ~ to!string(2)); // 2

  // the safest and explicitest (and not really usefull) cast:
  writeln(castFrom!int.to!long(100));
}
