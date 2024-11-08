module less_03_struct_inheritance;

// structure inheritance is not needed (and not allowed in D):
//   struct basic_data;
//   struct data_block_a : basic_data;
//   struct data_block_b : basic_data;
//
// is not better than:
//   struct basic_data
//   struct data_block_a { basic_data bd; ... };
//   struct data_block_b { basic_data bd; ... };

// classes allow inheritance:
//    - only from 1 parent
//    - from any number of interfaces
// In fact, it must be enough

void main() {
}
