module generic.less_06_mixin_version;

// compile this with dmd -J. ...
//                        ^ to import mixin.txt
//                         ^ current directory

import std.stdio : writeln;

string generateStruct(string name, string method) {
  return "struct " ~ name ~ " { void " ~ method ~ "() { writeln(\"Hello\"); } }";
}

void main(string[] args) nothrow {
  version (Windows) { // my current version
    mixin(generateStruct("Foo", "windowsWrite"));
  }

  version (linux) {
    mixin(generateStruct("Foo", "linuxWrite"));
  }

  version (all) {
    mixin(import("mixin.txt"));
  }

  version (none) {
    // this will never be compiled
    // like #if 0 
    //      #endif
  }

  // Foo x;
  // x.windowsWrite;

}
