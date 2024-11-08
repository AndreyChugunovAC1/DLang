module less_06_foreach_assoc;

import std.stdio;

// trash of information
void main() {
  string[string] pairs;

  pairs["A"] = "B";
  // reference semantics
  string[string] rpairs = pairs;

  pairs["Bless"] = "You";
  pairs["Hell"] = "Heaven";

  // order unspecified (because of hash table)
  writeln(pairs);
  writeln(rpairs);

  if ("A" in pairs) {
    writeln("Here comes the 'A'");
  }

  foreach (value; pairs) {
    write(value, " ");
  }
  writeln("");

  foreach (key, value; pairs) {
    writeln(key, " -> ", value);
  }

  // foreach
  int[] arr = [1, 2, 4, 8, 16, 32];
  foreach (ref int key; arr) { // OR (ref key; arr)
    key *= 2;
  }

  foreach (ref const int key; arr) {
    writeln(key);
  }
}