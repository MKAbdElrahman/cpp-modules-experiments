import <iostream>;
import MK.Welcome;
import MK.Math;


using std::endl;
using std::cout;

int main() {
  MK::Welcome::welcome() ;
  cout  << MK::Math::complex_function(15) <<endl;
}
