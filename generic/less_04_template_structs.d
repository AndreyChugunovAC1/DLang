module generic.less_04_template_structs;

import std.stdio : writeln;

struct Vec3(T) {
  T x, y, z;
}

void main(string[] args) {
  alias Vec = Vec3!float;

  Vec origin;
  auto b1 = Vec(1, 0, 0), b2 = Vec(0, 1, 0), b3= Vec(0, 0, 1);
  writeln(b1);
  writeln(b2);
  writeln(b3);
}
