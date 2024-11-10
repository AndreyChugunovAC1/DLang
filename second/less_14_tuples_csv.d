module less_14_tuples;

import std.stdio;

void main() {
  /** 
   * TUPLE
   */
  import std.typecons;

  Tuple!(int, float) t0;
  Tuple!int t1;
  auto t2 = Tuple!(int, float)(1, 3.0f);
  alias Pair = Tuple!(int, "first", int, "second");

  Pair p;
  p.first = 10;
  p.second = 20;
  writeln(p);
  writeln(typeid(p));

  // not allowed if v is unknown at compile time:
  //  t[v] = 10;
  t0[0] = 11;
  t0[1] = 10.0f;
  writeln(t0);

  /** 
   * CSV
   */

  // file format csv -- records x_ij:
  // X00, X01, X02, ..., X0N\n
  // X10, X11, X12, ..., X1N\n
  // .........................
  // XM0, XM1, XM2, ..., XMN

  // example of stringified csv file as text:
  string text = "Andrey, 109, 55.5\n" ~
    "Violence, 1000000000, 0.0";

  import std.csv;

  // example of iteration over the records using Tuple and csv lib:
  foreach (record; csvReader!(Tuple!(string, "name", int, "age", float, "weight"))(text)) {
    writeln(record.name, ", age: ", record.age, ", weight: ", record.weight);
  }
}
