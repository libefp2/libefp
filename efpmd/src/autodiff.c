#include "autodiff.h"

DualNumber constant(double value) {
    DualNumber result;
    result.value = value;
    result.derivative = 0.0;
    return result;
}

DualNumber variable(double value) {
    DualNumber result;
    result.value = value;
    result.derivative = 1.0;
    return result;
}

DualNumber add(DualNumber a, DualNumber b) {
    DualNumber result;
    result.value = a.value + b.value;
    result.derivative = a.derivative + b.derivative;
    return result;
}

DualNumber subtract(DualNumber a, DualNumber b) {
    DualNumber result;
    result.value = a.value - b.value;
    result.derivative = a.derivative - b.derivative;
    return result;
}

DualNumber multiply(DualNumber a, DualNumber b) {
    DualNumber result;
    result.value = a.value * b.value;
    result.derivative = (a.derivative * b.value) + (a.value * b.derivative);
    return result;
}

DualNumber divide(DualNumber a, DualNumber b) {
    DualNumber result;
    result.value = a.value / b.value;
    result.derivative = (a.derivative * b.value - a.value * b.derivative) / (b.value * b.value);
    return result;
}
