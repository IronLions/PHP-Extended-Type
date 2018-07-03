#include <phpcpp.h>
#include <cstdlib>
#include <iostream>

Php::Value myFunction()
{
    return random();
}

extern "C" {
PHPCPP_EXPORT void *get_module() {
    static Php::Extension extension("etype", "1.0");
    extension.add<myFunction>("myFunction");
    return extension;
}
}