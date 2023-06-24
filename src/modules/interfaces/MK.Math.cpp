export module MK.Math;

namespace  MK::Math{
  export int add(int x,int y){return x + y;}
  export int multiply(int x, int y){return x * y;}
  int cube(int x){return x * x * x;} // not exported
 export int complex_function(int x); // not implemented here
}