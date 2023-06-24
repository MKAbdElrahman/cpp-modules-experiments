export module MK.School;

import <iostream>;
namespace MK::School{
 export class Student{
    private:
    std::string m_name;
    int m_ID;
    public:
    Student(std::string name,int ID);
 };  
}