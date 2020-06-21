# GAMS

Consider the vector \[v = (1, 3, 6, 4, 7, 9, 6, 2, 3) \] We want to find the index \(k\) such that \[z = \left| \sum_{i \lt k} v_i - \sum_{i \ge k} v_i \right|\] is minimized. I.e. the sum left of the break point is as close as possible to the sum right of it.

This is easily programmed in code. However, the question is, can we do this in the form of an optimization problem?
