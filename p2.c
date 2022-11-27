double factorial(double x) {
    double i = 1;
    while (x > 0) {
        i *= x;
        --x;
    }
    return i;
}

