# Root Estimation: False position.

* falsePosition Function will try to estimate a root of a given function and given upper, and lower estimate for the root. This function will run for a certain number of iterations and desired error.

* Note: When calling the function, make sure to define a symbolic function using syms function that's built in MatLab, define a function, t

# INPUTS:

*       func - the function being evaluated
*       xl- the lower guess
*       xu- the upper guess
*       es - the desired relative error (should default to 0.0001*)
*       maxiter - the number of iterations desired (should default to 200)

# OUTPUTS:

*       root - the estimated root location
*       fx - the function evaluated at the root location
*       ea - the approximate relative error (*)
*       iter - how many iterations were performed