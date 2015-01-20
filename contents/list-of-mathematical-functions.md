---
title: List of mathematical functions
---
## Polynomials

- `polyval`: `polyval([3 1 2], 5)` returns the result of $$3 \times 5^2 + 1 \times 5 + 2$$

## Elementray transcendental functions

- `sqrt`: square root
- `power` (`.^`)
- `exp`: exponential
- `log`, `log2`, `log10`: natural, common, binary logarithm
- `expm1`, `log1p`: accurate version of $$\exp(x) - 1$$ and $$\log(1 + x)$$ for small $$x$$

## Trigonometric functions

- `sin`, `cos`, `tan`, `cot`, `sec`, `csc`
- `a`- prefix for inverse (arc)
- -`d` postfix for degrees rather than radians
- -`h` postfix for hypoerbolic
- Tangent has another inverse function, `atan2`, that accepts two input arguments

## Complex numbers

- `abs`, `norm`
- `angle`
- `real`, `imag`, `conj`

## Discrete mathematics

- `factor`: prime factors
- `factorial`
- `gcd`, `lcm`
- `nchoosek`: binomial coefficient

## Special functions

- `sign`
- `round`, `floor`, `ceil`
- `mod`, `rem`: modulus and remainder after division
- `gamma`, `beta`, `erf`
- `airy`, `bessel?`

## Statistics

- `mean`, `median`, `mode`, `std`, `var`
- `corrcoef`, `cov`
- Random numbers
  - `rand`: uniform in $$(0, 1)$$
  - `randn`: normal distribution
  - `randi`: random integers
  - `randperm`: random permutation
- Distributions (Statistics Toolbox)
  - `pdf`, `cdf`
  - `normpdf`, `normcdf`, `norminv`
  - `gam`- for gamma, `f`- for F, `t`- for Student's t, and so on

## Numerical integration and differentiation

- `integral`, `integral2`, `integral3`
- `quadgk`, `quad2d` (Some functions can evaluate improper integrals)
- `diff`, `del2`
- `polyint`, `polyder`
