module less_14_tuples;

import std.stdio;

void main() {
  /** 
   * TUPLE
   */
  import std.typecons;

  Tuple!(int, float) t;

  // not allowed if v is unknown at compile time:
  //  t[v] = 10;
  t[0] = v;
  t[1] = 10;
  writeln(t);

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
