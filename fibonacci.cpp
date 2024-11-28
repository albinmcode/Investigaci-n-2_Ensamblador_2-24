#include <cstdlib>

int fibonacci(int n) {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else if (n > 1) {
        int* fib1 = (int*)malloc(sizeof(int));
        int* fib2 = (int*)malloc(sizeof(int));
        *fib1 = fibonacci(n - 1);
        *fib2 = fibonacci(n - 2);
        int result = *fib1 + *fib2;
        return result;
    }
    return -1;
}