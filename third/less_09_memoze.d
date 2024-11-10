module third.less_09_memoze;

import std.stdio : writeln;
import std.functional;

ulong fib(int n) {
  return n < 2 ? n : fib(n - 1) + fib(n - 2);
}

ulong fastFib(int n) {
  return n < 2 ? n : memoize!fastFib(n - 1) + memoize!fastFib(n - 2);
}

void main(string[] args) {
  writeln(fib(45));     // ~ 7 seconds
  writeln(fastFib(45)); // ~ 0 seconds
}
