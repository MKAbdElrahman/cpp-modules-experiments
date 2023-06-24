import <iostream>;
import MK.Welcome;
import MK.Math;
import MK.School;
import MK.MathLib;

using std::endl;
using std::cout;
import <format>;

void print(const std::string_view str_fmt) {
    std::cout << str_fmt;
  }

int main() {
  MK::Welcome::welcome() ;
  cout  << MK::Math::complex_function(15) <<endl;
  MK::School::Student student("mohamed kamal\n", 15);

  print(std::format("{}\n",MK::MathLib::square(7)));
  print(std::format("{}\n",MK::MathLib::cubeRoot(8)));
}
