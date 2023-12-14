#ifndef AUTODIFF_H
#define AUTODIFF_H


typedef struct {
    double value;
    double derivative;
} DualNumber;

DualNumber constant(double value);
DualNumber variable(double value);
DualNumber add(DualNumber a, DualNumber b);
DualNumber subtract(DualNumber a, DualNumber b);
DualNumber multiply(DualNumber a, DualNumber b);
DualNumber divide(DualNumber a, DualNumber b);




#endif /* AUTODIFF_H */
