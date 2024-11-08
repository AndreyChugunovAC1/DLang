module less_11_ufcs;

// universal function call syntax
void main(string[] args) {
  import std.algorithm, std.stdio, std.array;

  int val = 99;

  // the same:
  writeln(val);
  val.writeln();
  val.writeln;

  int[] values = [81, 1, -3, 4, -6, -3, 6, 13, 24, 66];
  values.filter!(a => a >= 0)
    .array
    .sort!"a > b"
    .array
    .writeln;
}
