#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern double factorial(double x);

double randomValue() {
    srand(time(NULL));
    return -100 + (double) rand() / RAND_MAX * (115);
}

int main(int argc, char **argv) {
    struct timespec start;
    struct timespec end;
    double val;
    double result = 0;
    double next;
    if (argc == 2 && argv[1][0] == '1') {
        val = randomValue();
    }
    else if (argc == 2 && argv[1][0] == '2') {
        scanf("%lf", &val);
    }
    else if (argc == 4 && argv[1][0] == '3') {
        FILE *input_file = fopen(argv[2], "r");
        fscanf(input_file, "%lf", &val);
    } else {
        printf("Invalid input!");
        return 0;
    }
    double a = 0;
    clock_gettime(CLOCK_MONOTONIC, &start);

    for (int i = 0; i < 1000; ++i) {
        result = 0;
        a = 0;
        do {
            next = pow(-1, a) * pow(val, 2 * a) / factorial(2 * a);
            if (result + next >= INFINITY) {
                break;
            }
            result += next;
            ++a;
        } while (fabs(next) > 0);
    }

    clock_gettime(CLOCK_MONOTONIC, &end);

    long long result_time = end.tv_sec * 10e8 + end.tv_nsec - start.tv_sec * 10e8 - start.tv_nsec;

    if (argc == 4) {
        FILE *output_file = fopen(argv[3], "w");
        fprintf(output_file, "Result: %.50lf\n", result);
        fprintf(output_file, "Precision: %.20lf%%\n", fabs(result - exp(-val)) / (exp(-val)) * 100);
        fprintf(output_file, "Time: %lld ns\n", result_time);
    } else {
        printf("Result: %.50lf\n", result);
        printf("Precision: %.20lf%%\n", fabs(result - exp(-val)) / (exp(-val)) * 100);
        printf("Time: %lld ns\n", result_time);
    }
    return 0;
}

