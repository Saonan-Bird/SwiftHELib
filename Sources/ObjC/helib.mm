#import "helib.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#pragma clang diagnostic pop
#import "helib/helib.h"
#import <iostream>

@implementation HELib

+ (void)print_sth {
    std::cout<<"Hello World!"<<std::endl;
    std::cout<<"This is C++ code running from swift."<<std::endl;
    // Check C++ Compiler Version
    if (__cplusplus == 202101L) std::cout << "C++23";
    else if (__cplusplus == 202002L) std::cout << "C++20";
    else if (__cplusplus == 201703L) std::cout << "C++17";
    else if (__cplusplus == 201402L) std::cout << "C++14";
    else if (__cplusplus == 201103L) std::cout << "C++11";
    else if (__cplusplus == 199711L) std::cout << "C++98";
    else std::cout << "pre-standard C++." << __cplusplus;
    std::cout << "\n";

}

@end
