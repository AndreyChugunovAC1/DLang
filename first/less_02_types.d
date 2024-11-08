module less_02_types;

// module types;

void main() {
  import std.stdio : writeln;

  // sizes (guarantee)
  static assert(byte.sizeof == 1);
  static assert(char.sizeof == 1);
  static assert(short.sizeof == 2);
  static assert(int.sizeof == 4);
  static assert(long.sizeof == 8);

  static assert(float.sizeof == 4);
  static assert(double.sizeof == 8);

  // only one size that is not guaranteed:
  static assert(real.sizeof == 10);

  // types always have default initialization:
  static assert(int.init == 0);
  // I mean that init is nan, but this is false:
  // static assert(float.init == float.nan);

  // others
  static assert(float.min_normal > 0.0f);
  static assert(ulong.max > 0);
  static assert(wchar.max > 0);

  // some properties of integrals:
  writeln("int.alignof: ", int.alignof);
  writeln("int.mangleof: ", int.mangleof);
  writeln("int.min: ", int.min);
  writeln("int.max: ", int.max);
  writeln("int.sizeof: ", int.sizeof);
  writeln("int.stringof: ", int.stringof);

  writeln;

  // some properties of floating:
  writeln("float.dig: ", float.dig);
  writeln("float.alignof: ", float.alignof);
  writeln("float.epsilon: ", float.epsilon);
  writeln("float.infinity: ", float.infinity);
  writeln("float.mangleof: ", float.mangleof);
  writeln("float.max_10_exp: ", float.max_10_exp);
  writeln("float.max_exp: ", float.max_exp);
  writeln("float.min_10_exp: ", float.min_10_exp);
  writeln("float.min_exp: ", float.min_exp);
  writeln("float.sizeof: ", float.sizeof);
  writeln("float.stringof: ", float.stringof);
}
