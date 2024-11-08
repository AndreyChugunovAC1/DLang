module less_11_debug;

import std.stdio;

/* GDB (LLDB is also costs your attention as well)
  dmd -g -gf ...
  gdb ./executable
  gdb ./executable --tui  // text UI
    --silent
  file ./executable (in gdb)

most useful:
  _Dmain -- main function in D (at least, usually)

  n - next, c - continue
  advance [line_number]

  info - command to get info about amth
    info functions
    info br
    info [variable]
    info

  br - create breakpoint (at line or at function)
  print [variable]
    del [number_of_breakpoint]
  focus src
 */

// just a code that I used to try debugging
class A {
  int value;
}

void foo(int forwarded) {
  A a;

  a.value = forwarded;
  writeln(a.value);
}

void main(string[] args) {
  int sum = 0;

  foreach (i, ref const arg; args[1..$]) {
    ++i;
    sum += i;
    writeln(i, " argument: ", arg);
  }

  foo(sum);
}
