#include <stdio.h>
#include <stdbool.h>
#include <cspecs/cspec.h>

context (ejemplo) {

    describe("Describe de ejemplo", {

        it("true debería ser igual a true", {
            should_bool(true) be equal to(true);
        });

        it("true no debería ser igual a false", {
            should_bool(true) not be equal to(false);
        });

        it("este test va a fallar porque 10 no es igual a 11", {
            should_int(10) be equal to(11);
        });

        skip("este test deberia fallar porque \"Hola\" no es \"Chau\"", {
            should_string("Hola") be equal to("Chau");
        });

    });

}
