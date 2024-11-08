module less_03_arrays;

import std.stdio;

void main() {
  // static arrays - allocated on stack
  //    they must have compile time constant size (no VLA)
  int[5] sa1 = [5, 1, 4, 2, 3];
  int[5] sa2 = sa1; // copying values

  // here [] - shortcut for slice of all the array
  sa2[] += 5;   // operation on all the values
  writeln(sa2); // [10, 6, 9, 7, 8]

  string[3] sa3 = ["Coward", "Bobby", "Experienced"];
  // sa3[] ~= "(Mr)";
  writeln(sa3);
  writeln(typeid(sa3.tupleof)); // creates tuple


  // dynamic arrays -- allocated on heap
  //    they use reference semantics
  //    It means, that assigning do not copy the data (works like pointers)
  int[] da1 = [3, 1, 2];
  int[] da2 = da1; // no copying

  da2[0] = 10;
  writeln(da1[0]); // 10

  // adding an element or a range to array:
  da1 ~= 4;           // 1
  da1 ~= [6];         // 2
  int[] push = [5];
  da1 ~= push;        // 3
  writeln(da1); // 10 1 2 4 6 5

  da1 = []; // refer to an empty, data will be cleared by gc.

  // slices:
  int[] da3 = [0, 20, 42];
  da1 ~= da3[0..1];
  da1 ~= da3[0..$]; // here $ is the same as da3.length

  int[] vec = [1, 2, 3];
  vec[] += 5;
  // or: vec[] = vec[] + 5;
  writeln(vec); // [6, 7, 8]

  vec = vec[0..$-1];
  writeln(vec); // [6, 7]

  int[] origin = [0, 1, 2, 3, 4, 5];
  int[] reciever = origin[0..$-1];

  origin[0] = 10;
  writeln(reciever[0]); // also 10, no copying when slicing!!!

  reciever[0] = 42;
  writeln(origin[0]); // also 42

  // it means, that it's a pop_back:
  origin = origin[0..$-1];
  // also this one:
  import std.array;
  origin.popBack;

  writeln(origin); // 42 1 2 3 -- we made 2 pop backs
  // length changing leads to array reallocation:
  origin.length--; // also pop back

  writeln;

  // changind length and slicing do not copy a data never:
  //   only 'test' will be changed, 'testRef' won't
  int[] test = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  int[] testRef = test[2..8];

  test = test[];
  test[3] = 1000;
  test = test[2..8];
  test[4] = 2000;
  writeln(testRef); // gets all the changes done before
  test.length = 2;
  writeln(testRef); // gets all the changes done before
  test[0] = 16_000; // still changes testRef
  writeln(testRef); // gets all the changes done before

  // Some additional info:
  // (C): To maximize efficiency, the runtime always tries to 
  //        resize the array in place to avoid extra copying.
  //        (Requires allocation done by gc)

  // there is also capacity option, so you
  // can clearly understand what is happening:
  // because now we know that this is an std::vector<T>
  // with as efficent as possible memory reallocation
  writeln(test.ptr);
  // capacity is 0, because 'test' is a view:
  writeln("view     :: cap: ", test.capacity, " length: ", test.length);

  test = [1, 2, 3];
  writeln(test.ptr);
  // now capacity is correct:
  writeln("original :: cap: ", test.capacity, " length: ", test.length);
  test.reserve(10);
  writeln(test.ptr); // then I tested, test.ptr does not changed -- wow
  writeln("reserved :: cap: ", test.capacity, " length: ", test.length);
}
