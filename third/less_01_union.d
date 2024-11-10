module third.less_01_union;

import std.stdio : writeln;

union Union {
  // default initialization:
  //   it must be single and only for the first field
  int i = 13;
  double d;
  long l;
  char ch;
}

// anonymous:
struct Struct {
  int a;
  union {
    long b;
    byte c;
  }
}

union Union2 {
  int a;
  struct {
    int b;
    bool c;
  }
}

// interesting
struct Complicated {
  bool f;
  union {
    // only one of these structures is alowed
    struct {
      int x, y, z;
    }
    struct {
      int r, g, b;
      union {
        int l;
        uint t;
      }
    }
    int[] a;
  }
}

// "Complicated" graphically:
// f x y z
//   r g b l
//         t
//   a
// and so on, you can parallize more

void main(string[] args) {
  Union u;

  // just prnts "Union" (name of union)
  //    because compiler don't know thich type to print:
  writeln(u);

  writeln(Union2.a.offsetof); // 0
  writeln(Union2.b.offsetof); // 0
  writeln(Union2.c.offsetof); // 4
  writeln(Union2.alignof); // 4
}
