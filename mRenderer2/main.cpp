#include "cLib/Engine.h"
#include <iostream>
extern "C"

int main() {
    initEngine();
    printSystemDetails();
    shutdownEngine();
    return 0;
}
