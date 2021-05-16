#include "src/interface.h"

#include "stdlib.h"

namespace invention {

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

}
