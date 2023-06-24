export module MK.Welcome;

import <iostream>;
using std::cout, std::endl;

namespace MK::Welcome{
// exporting a single item
export void welcome(){
    cout << "Hello Modules" << std::endl;
}}