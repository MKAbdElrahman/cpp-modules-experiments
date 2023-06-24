import <iostream>;
import MK.Welcome;
import MK.Math;
import MK.School;


using std::endl;
using std::cout;

int main() {
  MK::Welcome::welcome() ;
  cout  << MK::Math::complex_function(15) <<endl;

  MK::School::Student student("mohamed kamal", 15);
}
