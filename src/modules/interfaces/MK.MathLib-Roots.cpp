export module MK.MathLib:Roots;

import <cmath>;
export namespace MK::MathLib {
    int cubeRoot(int x){return std::sqrt(x);}
    int squareRoot(int x){return std::cbrt(x);}
}