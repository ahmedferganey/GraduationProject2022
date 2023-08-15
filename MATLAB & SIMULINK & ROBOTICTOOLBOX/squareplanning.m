L(1)= Link('d', 0 , 'a', 40, 'alpha', pi/2);
L(2)= Link('d', 68 , 'a', 262, 'alpha', 0);
L(3)= Link('d', 0 , 'a', 0, 'alpha', -pi/2); 
L(4)= Link('d', 292 , 'a', 0, 'alpha', -pi/2);
L(5)= Link('d', 0 , 'a', 0, 'alpha', -pi/2);
L(6)= Link('d', 0 , 'a', 75, 'alpha', 0);
Inmoov= SerialLink(L, 'name', 'Inmoov');
Inmoov.teach;
qi = [ 0 0 0 0 0 0 ];
Ti = Inmoov.fkine(qi);
Ti = double(Ti);
T2 = Ti;
T3 = Ti;
T4 = Ti;
T2(2,4) = (T2(2,4) - 100);
T3(2:3,4) = (T3(2:3,4) -100);
T4(3,4) = (T4(3,4) - 100);
Ti = SE3(Ti);
T2 = SE3(T2);
T3 = SE3(T3);
T4 = SE3(T4);
t = (0:0.1:2);
p1 = transl(Ti);
p2 = transl(T2);
p3 = transl(T3);
p4 = transl(T4);
Ts1 = ctraj( Ti,T2, length(t));
Ts2 = ctraj( T2,T3, length(t));
Ts3 = ctraj( T3,T4, length(t));
Ts4 = ctraj( T4,Ti, length(t));
qs1 = Inmoov.ikine(Ts1);
qs2 = Inmoov.ikine(Ts2);
qs3 = Inmoov.ikine(Ts3);
qs4 = Inmoov.ikine(Ts4);
Inmoov.plot(qs1)
x = [p1(1), p2(1)];
y = [p1(2), p2(2)];
z = [p1(3), p2(3)];
plot3(x,y,z)
hold on
Inmoov.plot(qs2)
x = [p2(1), p3(1)];
y = [p2(2), p3(2)];
z = [p2(3), p3(3)];
plot3(x,y,z)
hold on
Inmoov.plot(qs3)
x = [p3(1), p4(1)];
y = [p3(2), p4(2)];
z = [p3(3), p4(3)];
plot3(x,y,z)
hold on
Inmoov.plot(qs4)
x = [p4(1), p1(1)];
y = [p4(2), p1(2)];
z = [p4(3), p1(3)];
plot3(x,y,z)
hold on