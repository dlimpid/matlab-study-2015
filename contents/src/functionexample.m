tspan = [0 50];
y0 = [0.01; 0.01];

odefunrj = @(t, y) [-0.1 -1; 0.6 -0.2] * y;
[T1, Y1] = ode45(odefunrj, tspan, y0);

odefunrj = @(t, y) [-0.3 0.2; -0.7 0.3] * y;
[T2, Y2] = ode45(odefunrj, tspan, y0);

[T3, Y3] = ode45(@odefunrj2, tspan, y0);

L = [-0.3 0.2; -0.7 0.3];
[T4, Y4] = ode45(@(t, y) odefunrj2(t, y, L), tspan, y0);
