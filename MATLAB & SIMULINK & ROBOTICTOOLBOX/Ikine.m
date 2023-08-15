L(1)= Link('d', 0 , 'a', 39.85, 'alpha', pi/2);
L(2)= Link('d', 82 , 'a', 262.1, 'alpha', 0);
L(3)= Link('d', 0 , 'a', 323.5, 'alpha', pi/2); %d(2) not equal to zero
L(4)= Link('d', 0 , 'a', 0, 'alpha', -pi/2);
L(5)= Link('d', 0 , 'a', 70.5, 'alpha', 0);
Inmoov= SerialLink(L, 'name', 'Inmoov');
T = SE3(200,100,300);
qi = Inmoov.ikine(T,'q',[0 0 0 0 0],'mask',[1 1 1 0 0 0]);
Inmoov.plot(qi)