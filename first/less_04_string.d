module less_04_string;

import std.stdio : writeln;
import std.string;
import std.typecons;

void main() {
  // string is immutable(char)[]
  char[] mutable_string = cast(char[])"Undrey";
  string immutable_string = cast(string)mutable_string;

  mutable_string[0] = 'A';
  // immutable_string[0] = 'A'; // compile error

  // Just thash of clear examples of string usage:
  string s = "abc def !";
  string s2 = " ghi";

  writeln(s);
  writeln(s ~ s2);
  writeln(s.center(20, '='));
  writeln(center(s, 20, '='));
  s = "Some ununderstandable TeX(t)!";
  writeln(indexOf(s, 'u'));
  writeln(indexOf(s, 'T', 0, Yes.caseSensitive));
  writeln(s ~ ' ' ~ "It says completely nothing.");

  // something like:
  alias String = immutable(char)[];

  String str_raw = r"abcdef\n";
  Strings str_unicode = "\u20AC";
  writeln(str_raw); // will print '\n' at end
  writeln(str_unicode); // strange creature
}
