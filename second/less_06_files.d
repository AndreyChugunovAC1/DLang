module less_06_files;

import std.stdio;

// compile & run manually!
void main() {
  // r, r+ rb
  // w, w+ wb
  // a, a+
  File f = File("example.txt", "r");
  // do this at the end of main's {}
  scope (exit) {
    f.close(); // not nesscessary
  }

  // read by line:
  foreach (line; f.byLine) {
    writefln("ftell: %3d: %s", f.tell, line);
  }

  f.rewind;

  // read by chunk:
  foreach (ubyte[] chunk; f.byChunk(10)) {
    // string === immutable(char)[]
    writeln( /* cast(string) */ chunk);
  }
  writeln("f.eof: ", f.eof);
  writeln("f.error: ", f.error);
  writeln("f.name: ", f.name);
}
