module MK.School;

import <iostream>;
import <format>;
namespace MK::School{
    
    Student::Student(std::string name,int ID): m_name(name), m_ID(ID){
        std::cout << std::format("My name is {}", m_name);
    } 
}