---
title: Graphics
---
## 2D graphics

### The `plot` function

#### Basic usage

~~~plain
>> x = linspace(0, 2 * pi, 20);
>> y = sin(x);
>> plot(x, y);
>> title('Sine');
>> xlabel('x');
>> ylabel('sin(x)');
~~~

![Sine]({{ site.imagesurl }}/graphics-sine.png)
{:.text-center}

~~~plain
>> z = cos(x);
>> plot(x, y, x, z);
>> % or
>> A = [y; z];
>> plot(x, A);
~~~

![Sine and cosine]({{ site.imagesurl }}/graphics-sine-and-cosine.png)
{:.text-center}

Note that the title and axis labels are cleared.

#### Parametric plots

~~~plain
>> theta = linspace(0, 4 * pi, 30);
>> r = linspace(1, 2, 30);
>> x = r .* cos(theta);
>> y = r .* sin(theta);
>> plot(x, y);
~~~

![Parametric plot]({{ site.imagesurl }}/graphics-parametric.png)
{:.text-center}

#### Line Specification (LineSpec)

| Specifier | Line style |
|-|-|
| `-` | Solid (default) |
| `--` | dashed |
| `:` | dotted |
| `-.` | dash-dot |
{:.table}

| Specifier | Marker type |
|-|-|
| `+` | Plus sign |
| `o` | Circle |
| `*` | Asterisk |
| `.` | Point |
| `x` | Cross |
| `s`, `d`, | Square, Diamond |
| `p`, `h` | pentagram, hexagram |
| `^`, `v`, `>`, `<` | Triangles |
{:.table}

| Specifier | Color |
|-|-|
| `r` | Red |
| `g` | Green |
| `b` | Blue |
| `c` | Cyan |
| `m` | Magenta |
| `y` | Yellow |
| `k` | Black |
| `w` | White |
{:.table}

{:.alert .alert-info}
Black is `k`.

~~~plain
>> x = linspace(0, 7, 20);
>> plot(x, sin(x), '--or', x, cos(x), 'pm-.', x, -sin(x), 'g:.');
~~~

![LineSpec]({{ site.imagesurl }}/graphics-linespec.png)
{:.text-center}


## 3D graphics

~~~matlab
x = linspace(-1, 1, 11);
y = linspace(-2, 2, 15);
[X, Y] = meshgrid(x, y);
Z = exp(-X.^2 - Y.^2);

figure();
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');

figure();
mesh(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');

figure();
waterfall(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');
~~~

![Surface plot]({{ site.imagesurl }}/graphics-surf.png) ![Mesh plot]({{ site.imagesurl }}/graphics-mesh.png) ![Waterfall plot]({{ site.imagesurl }}/graphics-waterfall.png)


## Axes options

- `box`, `grid`, `axis`, `xlim`
- `title`, `xlabel`, `legend`, `text`

~~~plain
>> plot(x, sin(x));
>> grid on;
>> box off;
>> axis equal;
~~~

~~~plain
>> plot(x, sin(x));
>> xlim([-1 8]);
>> ylim([-0.5 1.5]);
~~~

![Axes options]({{ site.imagesurl }}/graphics-axes-1.png) ![Axes options]({{ site.imagesurl }}/graphics-axes-2.png)
{:.text-center}


## Subplots

~~~plain
>> x = 0:0.5:8;
>> subplot(2, 3, 1);
>> plot(x, sin(x));
>> subplot(2, 3, [2 3]);
>> plot(x, cos(x));
>> subplot(223);
>> plot(x, sin(2 * x));
>> subplot(339);
>> plot(x, cos(x / 2));
~~~

![Subplot]({{ site.imagesurl }}/graphics-subplot.png)
{:.text-center}


### More plots

- `plotyy`
- `semilogx`, `semilogy`, `loglog`
- `area`, `stem`, `stairs`
- `scatter`
- `plot3`, `stem3`, `scatter3`
- `bar`, `barh`
- `pie`
- `polar`, `rose`, `compass`
- `contour`, `contourf`
- `quiver`
- `image`, `imagesc`


## Handle graphics

~~~plain
>> x = 0:0.1:1;
>> y = x.^2;
>> hf = figure();
>> hl = plot(x, y);
>> ha = gca();
>> 
>> a = get(hf)
a = 
                 Alphamap: [1x64 double]
             BeingDeleted: 'off'
               BusyAction: 'queue'
            ButtonDownFcn: ''
                 Children: 879
                 Clipping: 'on'
          CloseRequestFcn: 'closereq'
(...)
        WindowButtonUpFcn: ''
        WindowKeyPressFcn: ''
      WindowKeyReleaseFcn: ''
     WindowScrollWheelFcn: ''
              WindowStyle: 'docked'
>> xLim = get(ha, 'XLim')
xLim =
     0     1
>> marker = get(hl, 'Color')
marker =
     0     0     1
~~~

~~~matlab
x = 1:0.1:2;
y = exp(x);
hf = figure(); % figure handle
hl = plot(x, y); % lineseries handle
ha = gca(); % axes handle

% First image here

set(ha, 'XLim', get(ha, 'XLim') + [-0.1 0.1]);
set(ha, 'XDir', 'reverse');
set(ha, 'YScale', 'log');
set(ha, 'YGrid', 'on');
set(hl, ...
  'Color', [0.4 0.8 0.1], ...
  'Marker', 'd', ...
  'MarkerSize', 12, ...
  'MarkerFace', [0.9 0.1 0.4], ...
  'LineWidth', 3);

% Second image here
~~~

![Handle graphics]({{ site.imagesurl }}/graphics-before-set.png) ![Handle graphics]({{ site.imagesurl }}/graphics-after-set.png)
{:.text-center}


## Movies

~~~matlab
% From help for getframe
Z = peaks;
figure('Renderer', 'zbuffer');
surf(Z);
axis tight manual;
set(gca, 'NextPlot', 'replaceChildren');
for k = 1:20
    surf(sin(2 * pi * k / 20) * Z, Z)
    F(k) = getframe;
end
movie(F, 5)
~~~


## Useful libraries

- export_fig ([File Exchange](www.mathworks.com/matlabcentral/fileexchange/23629-export-fig), [GitHub](https://github.com/altmany/export_fig))
- matlab2tikz ([File Exchange](http://www.mathworks.com/matlabcentral/fileexchange/22022-matlab2tikz-matlab2tikz), [GitHub](https://github.com/matlab2tikz/matlab2tikz))
