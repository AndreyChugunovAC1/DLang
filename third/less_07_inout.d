module third.less_07_inout;

// dfmt off
int[] overloaded(int[] a, int count)                       => a;
const(int)[] overloaded(const(int)[] a, int count)         => a;
immutable(int)[] overloaded(immutable(int)[] a, int count) => a;
// dfmt on

// can be done using inout:
inout(int)[] notOverloaded(inout(int)[] a, int count) => a;

void main(string[] args) {
}