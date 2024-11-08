module less_12_struct_construct;

import std.stdio;

void main(string[] args) {
  /** 
   * SIMPLE STRUCT
   */
  struct Struct {
    int a = -1;
    float b = -1.0f;
  }

  auto s1 = Struct(1, 2.0f);    // works without constructors
  Struct s2 = {b: 2.0f, a: 64};
  Struct s3 = {1, 2.0f};        // same as s1

  writeln(s1);
  writeln(s2);

  /** 
   * WITH CONSTRUCTORS
   */
  struct Vec {
    float x = 0, y = 0, z = 0;

    // impossible to specify default constructor,
    // it can be only marked as @disable
    //   - prevents extra toughness then creating
    @disable this();

    // example of constructor
    this(float val) {
      x = y = z = val;
    }
  }

  auto v1 = Vec(1);
  // Do not work, default Vec(float,float,float) disabled
  // because we defined a constructor (Vec(float)):
  //    auto v2 = Vec(1, 2, 3);
  writeln(v1); // Vec(1, 1, 1)

  // deleted constructor:
  // auto v2 = Vec();

  /** 
   * COPYING CONSTRUCTOR
   */
  struct CanCopy {
    int value;
    // usually copy constructor is not needed,
    // but here is reference type inside,
    // it wont be copied by default:
    int[] others;

    this(int val) {
      value = val;
    }

    // Impossible without ref
    // inout -- const/immutable/none of them
    // rhs - right-hand side
    this(ref /* return scope */ inout CanCopy rhs) {
      value = rhs.value;
      others = rhs.others.dup; // copying
    }
  }

  CanCopy cc;
  cc.others = [1, 2, 3, 4];
  auto cc2 = cc; // calls copy

  writeln(cc2.value, " AND ", cc2.others);
}
