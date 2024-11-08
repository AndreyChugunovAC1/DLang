module second.less_02_immutable;

// const      -- local constantness
//    i.e. in function it is const, but outside it - not;
// immutable  -- global constantness for object
//    nowhere can be changed except 'this()' method

void main() {
  int[] arr = [1, 1, 1];
  // can not convert none -> immutable:
  //   immutable(int[]) arrr = arr; 
  // converts none -> const:
  const(int[]) arrr = arr;

  class Class {
    int data;
  }

  Class cc = new Class;
  const Class ccc = cc;
  cc.data = 10;

  // can not skip immutable keyword here:
  immutable Class ic = new immutable Class;
  // ic.data = 10;

  class Struct {
    int data;
  }

  Struct css;
  const Struct ccss = css;
  Struct cccss = ccss;
  css.data = 10;
  cccss.data = 100;

  // can not skip immutable keyword here:
  immutable Struct iss = new immutable Struct;
  // iss.data = 10;
}
