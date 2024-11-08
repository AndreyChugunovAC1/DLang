module first.less_01_auto;


auto add(T1, T2)(T1 a, T2 b) {
  return a + b;
}

void main() {
  import std.stdio : writef, writeln;

  auto f = 3.14f;
  writeln(typeid(add!(float, float)(1, 2)));
}
