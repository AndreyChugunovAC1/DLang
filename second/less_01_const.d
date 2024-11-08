module less_01_const;

import std.math : PI;
import std.stdio;

void main(string[] args) {
  const float pi1 = PI;
  const  /* auto */ pi2 = PI;
  // cast(real) pi2 = 4.0; -- UB

  int val = 10;
  const int cval;

  // int const * const
  const int* pi_01 = &cval;
  const int* pi_02 = &val;
  const(int*) pi_03 = &cval;
  const(int*) pi_04 = &val;

  // int const *
  const(int)* pi_11 = &val;
  const(int)* pi_12 = &val;

  // int * const ?
}
