#include <stdio.h>
#include <stdlib.h>
#include <cspecs/cspec.h>

context (complete_example) {

    describe("Describe 1", {

        int *a = NULL,
             b;

        before({
            puts("before 1");
            a = malloc(sizeof(int));
            *a = 10;
            b = 20;
        });

        after({
            puts("after 1");
            free(a);
            a = NULL;
        });

        it("*a should be 10 and b should be 20", {
            should_int(*a) be equal to(10);
            should_int(b) be equal to(20);
        });

        describe("Describe 2", {

            before({
                puts("before 2");
                *a = 30;
                b = 15;
            });

            after({
                puts("after 2");
                free(a);
                a = NULL;
            });

            it("*a should be 30 and b should be 15", {
                should_int(*a) be equal to(30);
                should_int(b) be equal to(15);
            });

            describe("Describe 3", {

                before({
                    puts("before 3");
                    b = 150;
                });

                after({
                    puts("after 3");
                    free(a);
                    a = NULL;
                });

                it("*a should be 30 and b should be 150", {
                    should_int(*a) be equal to(30);
                    should_int(b) be equal to(150);
                });

            });

        });

        describe("Describe 4", {

            it("*a should be 10 and b should be 20", {
                should_int(*a) be equal to(10);
                should_int(b) be equal to(20);
            });

        });

    });

}
