module third.less_06_out_function_param;

import std.stdio : writeln;

// out -- like another return (place foe value):
//    out == ref, but ot also assigns x to x.init
void outer(out int x) { // x = x.init
  writeln(x); // 0
}

void main(string[] args) {
  // outer(3); -- ref
  int res = 999;
  outer(res);
  writeln(res); // 0
}