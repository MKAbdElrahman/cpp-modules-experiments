export module MK.Welcome;

import <iostream>;
using std::cout, std::endl;

namespace MK::Welcome{
void print_hello();
export void welcome(){
    print_hello();
}}

module :private;

void MK::Welcome::print_hello(){
    cout << "Hello Modules" << std::endl;
}