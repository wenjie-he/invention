#include "src/interface.h"

#include "stdlib.h"

Interface::Interface() :
    a(1),
    b(0) {

}

Interface::~Interface() {

}


void Interface::get_input() {
    a += rand();
    b += rand();
    return;
}
