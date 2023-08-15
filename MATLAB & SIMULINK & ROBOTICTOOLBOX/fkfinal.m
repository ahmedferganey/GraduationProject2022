L(1)= Link('d', 0 , 'a', 39.85, 'alpha', pi/2);
L(2)= Link('d', 12.14 , 'a', 262.1, 'alpha', 0);
L(3)= Link('d', 0 , 'a', 323.5, 'alpha', pi/2); %d(2) not equal to zero
L(4)= Link('d', 0 , 'a', 0, 'alpha', -pi/2);
L(5)= Link('d', 0 , 'a', 70.5, 'alpha', 0);
Inmoov= SerialLink(L, 'name', 'Inmoov');
Inmoov.teach
qi = [0 0 0 0 0];
T = Inmoov.fkine(qi);
T=T.double; %Then edit the position vector  
qn = Inmoov.ikine(T, 'q', [0 0 0 0 0], 'mask',[1 1 1 1 1 0])