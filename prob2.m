% A
fc = 1e6; % hz
Tc = .001; %s
corr = @(dt, df) (besselj(0,2*pi*dt/Tc))^2/(1 + (df/fc)^2);

p = .2;

fun = @(x) corr(0, x) - .2;
df = fzero(fun, fc/2)

fun = @(x) corr(x, 0) - .2;
dt = fzero(fun, Tc/2)
