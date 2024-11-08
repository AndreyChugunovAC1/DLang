module less_08_main;

// echo $? -- view code returned by previous process
// run this code with "rdmd .\less_08_main.d -x=3 -y=4"
int main(string[] args) {
  import std.stdio;
  import std.getopt;

  // first argument -- path there your executable was called

  uint firstValue = 0;
  uint secondValue = 0;

  auto info = getopt(args,
    "x", &firstValue,
    "y", &secondValue
  );

  if (info.helpWanted) {
    writeln("run this code with \"rdmd ./less_08_main.d -x=3 -y=4\"");
  }

  // writeln(info); -- some class
  writeln("Your values: ", firstValue, ", ", secondValue, " and their sum: ", firstValue + secondValue);

  import core.stdc.stdlib; // standart c library (also exist c++)
  return EXIT_SUCCESS;
}
