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

* Basic math

```ShellSession
% rpn 2 2 + # 2 plus 2
4

% rpn 2 3 / # 2 divided by 3
0.666666666666667

% rpn 1 2 3 * - # 2 times 3, subtracted from 1
-5
```

* Fancier operations and functions

```ShellSession
% rpn 2 3 ** # 2 raised to the 3rd power
8

% rpn 2 1 2 / ** # 2 raised to the 1/2 power (aka square root)
1.4142135623731

% rpn 2 sqrt # square root of 2
1.4142135623731
```

* Bitwise operations

```ShellSession
% rpn '1 2 |' # 1 bitwise or 2
3

% rpn '1 3 &' # 1 bitwise and 3
1

% rpn '1 3 ^' # 1 bitwise exclusive or 3
2
```

* Manipulating the stack

```ShellSession
% rpn 2 3 / # 2 divded by 3
0.666666666666667

% rpn 2 3 swap / # 3 divded by 2
1.5

% rpn 2 dupl * # 2 times 2
4
```

* Basic trig functions

```ShellSession
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

* sin(x)^2 + cos(x)^2, 20 steps around a circle, 15 digits display precision:
```ShellSession
$ precision=15
$ steps=20
$ for i in $(seq 0 $steps); do
> x=$(./rpn tau 1 $steps / $i '* *')
> printf "x=%.${precision}f; sin(x)^2 + cos(x)^2 = %.${precision}f\n" \
>  $x \
>  "$(./rpn $x 'dupl sin 2 ** swap cos 2 ** +')"
> done
x=0.000000000000000; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=0.314159265358980; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=0.628318530717959; sin(x)^2 + cos(x)^2 = 0.999999999999999
x=0.942477796076938; sin(x)^2 + cos(x)^2 = 0.999999999999999
x=1.256637061435920; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=1.570796326794900; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=1.884955592153880; sin(x)^2 + cos(x)^2 = 0.999999999999999
x=2.199114857512860; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=2.513274122871840; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=2.827433388230820; sin(x)^2 + cos(x)^2 = 0.999999999999999
x=3.141592653589790; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=3.455751918948770; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=3.769911184307750; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=4.084070449666730; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=4.398229715025710; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=4.712388980384690; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=5.026548245743670; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=5.340707511102650; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=5.654866776461630; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=5.969026041820610; sin(x)^2 + cos(x)^2 = 1.000000000000000
x=6.283185307179590; sin(x)^2 + cos(x)^2 = 1.000000000000000
```

Hints
-----

If you use zsh, using noglob is helpful.

```ShellSession
% rpn 1 2 * # the * is globbed, expanding to all files in current directory
LICENSE? Really?

% noglob rpn 1 2 * # this time, the * is passed through
2

% alias rpn='noglob rpn'; # aliases are helpful
% rpn 2 3 **
8
```

If you use bash, quote the arguments a lot.

```ShellSession
$ noglob rpn 2 3 * # oops!
bash: noglob: command not found

$ set +o noglob
$ rpn 2 3 * # oops, bash ignores +o noglob
LICENSE? Really?

$ set -f
$ set -o | grep glob
noglob         	on
$ rpn 2 3 * # "This time, for sure! Presto!" -Bullwinkle J. Moose
6
```

[pi]: http://www.math.utah.edu/~palais/pi.html "Pi is Wrong!"
[tau]: http://www.tauday.com "No, really, pi is wrong."
