C++
#include <iostream> 
  int main() {
  std::cout << "enter the lenghth if the rectangel: ";
  std::cin >> lenght;

  std::cout << "enter the width of the rectangle ";
  std::cin >> width; 

  area=length*width;
  std::ccout << "the area of the rectangle is:"<<area <<std::end1;

  return0;
  } 

#include <iostream>

//corrected code 
int main() {
    // 1. Declare variables with types (double allows for decimals)
    double length, width, area;

    std::cout << "Enter the length of the rectangle: ";
    std::cin >> length;

    std::cout << "Enter the width of the rectangle: ";
    std::cin >> width;

    // 2. Perform the calculation
    area = length * width;

    std::cout << "The area of the rectangle is: " << area << std::endl;

    return 0;
}
