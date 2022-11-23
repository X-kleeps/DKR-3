uses crt;
uses graphABC;
var y:real; i1:integer;

var l:byte;
function vibor(var v: byte): byte;
begin
Textcolor(2);
writeln('Да - 1');
Textcolor(4);
writeln('Нет - 0');
Textcolor(15);
Write('Выберите вариант: ');
readln(v);
vibor := v;
end;


var n,i:integer; a,b,h,x,s,f,d:real;
  
  function f0(var x:real):real;//основная
  begin
    var f1:real;
      f1:=1*power(x,3)+(0)*power(x,2)+(5)*x+(11);
      f0:=f1;
  end;
  
  function f2(var x:real):real;//первообразная
  begin
    var f3:real;
      f3:=1 / 4 * power(x, 4) + 5 / 2 * power(x, 2) + 11*x;
      f2:=f3;
  end;
begin
  textcolor(11);
  writeln ('Найти площадь фигуры ограниченной кривой 1*x^3+(0)*x^2+(5)*x+(11)');
  textcolor(15);
  writeln ('Введите пределы интегрирования a и b при a<b');
  textcolor(4);
  readln (a,b);
  if (a>b) then begin textcolor(14); writeln ('a не может быть больше b'); exit(); end;
  textcolor(15);
  writeln ('Введите количество интервалов разбиения n');
  textcolor(3);
  readln (n);
  textcolor(15);
  h:=(b-a)/n;
  x:=a+h;
  for i:=0 to n-1 do
    begin
     f:=f0(x);
     S:=S+f;
     x:=x+h;
    end;
S:=(h*(f0(a)+f0(b)))/2+S;
textcolor(14);
writeln('S= ',s);
textcolor(15);
writeln('Вывести погрешность?');
vibor(l);
case l of
1:
begin
  textcolor(2);
  d:=abs((f2(b)-f2(a))-S);
writeln('Погрешность= ',d);
textcolor(15);
end;
0: begin
textcolor(2);
writeln('Ну и ладно');
textcolor(15);
end;
end;
writeln ('Вывести график функций?');
vibor(l);
case l of
1:
begin
  clearwindow;
  line(0,240,600,240);
  line(300,0,300,500);
  for i1:=-1500 to 1500 do
  begin
    x:=0.03*i1;
    y:=1*power(x,3)+(0)*power(x,2)+(5)*x+(11);
    setpixel(round(300+10*x),round(240-10*y),clRed);
  end;
  textout(10,10, 'y=1*x^3+(0)*x^2+(5)*x+(11)');
  end;
0:
writeln('Ну ладно');
end;
end.
