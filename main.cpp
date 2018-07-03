#include <phpcpp.h>
#include <cstdlib>
#include <iostream>

extern "C" {
PHPCPP_EXPORT void *get_module() {
    static Php::Extension extension("etype", "1.0");

    // List adds here. `extension.add<myFunction>("myFunction");`
    // class etype.
    //Php::Class<etype> etype("Etype");
    //etype.method<&etype::test> ("test");
    extension.add(std::move(etype));

    // End of add declarations.
    return extension;
}
}