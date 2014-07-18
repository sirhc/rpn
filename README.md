RPN
===

A simple Reverse Polish Notation calculator.

Supports:
---------

* Simple operators (addition, substraction, multiplication, division)
* Fancier operators (exponotation, bitwise or, bitwise and, bitwise xor)
* Common trigonometric functions (cosine, sine, tangent)
* Logarithmic functions (natural log, inverse natural log)
* Common (and uncommon) constants (e, [pi][], [tau][])
* Swapping the last two values on the stack
* Duplicating the last value on the stack

Examples:
---------

```ShellSession
% rpn 2 2 + # 2 plus 2
4

% rpn 2 3 / # 2 divided by 3
0.666666666666667

% rpn 1 2 3 * - # 2 times 3, subtracted from 1
-5

% rpn 2 3 ** # 2 raised to the 3rd power
8

% rpn 2 1 2 / ** # 2 raised to the 1/2 power (aka square root)
1.4142135623731

% rpn 2 sqrt # square root of 2
1.4142135623731

% rpn '1 2 |' # 1 bitwise or 2
3

% rpn '1 3 &' # 1 bitwise and 3
1

% rpn 2 3 / # 2 divded by 3
0.666666666666667

% rpn 2 3 swap / # 3 divded by 2
1.5

% rpn 2pi 8 / cos # 1/8th around a circle (cosine)
0.707106781186547

% rpn tau 8 / tan # 1/8th around a circle (tangent)
1

% rpn τ π / # tau = 2 * pi; greek letters supported
2

% rpn 1 exp; rpn e # natural log
2.71828182845905
2.71828182845905

% rpn 1024 log 2 log / # how many bits are in 1024?
10

% rpn tau dupl int - # what is the fractional portion of tau?
0.28318530717959

% rpn -v tau dupl int - # show me how you did that.
tau is 6.28318530717959
duplicating 6.28318530717959
int(6.28318530717959) = 6
6.28318530717959 - 6 = 0.28318530717959
0.28318530717959

```

[pi]: http://www.math.utah.edu/~palais/pi.html "Pi is Wrong!"
[tau]: http://www.tauday.com "No, really, pi is wrong."
