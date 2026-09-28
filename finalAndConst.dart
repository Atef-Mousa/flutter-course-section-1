// If you never intend to change a variable, use final or const, either instead of var or in addition to a type.
// A final variable can be set only once; a const variable is a compile-time constant. (Const variables are implicitly final.)

// final: set once, but the value can be determined at runtime.
// const: set once, and the value must be known at compile time — before the program even runs.
void main() {
  // final String nickname = 'Bobby';

  // final now = DateTime.now(); // fine — runtime value, only known when the app actually runs
  // const now = DateTime.now();

  // int _ = 32 ;
  // int _ = 33 ;
}
