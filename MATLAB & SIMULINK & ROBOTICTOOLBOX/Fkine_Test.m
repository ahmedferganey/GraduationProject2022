L(1)= Link('d', 0 , 'a', .04, 'alpha', pi/2);
L(2)= Link('d', .012 , 'a', .262, 'alpha', 0);
L(3)= Link('d', .07 , 'a', .124, 'alpha', -pi/2); %d(2) not equal to zero
L(4)= Link('d', 0 , 'a', .75, 'alpha', 0);
L(5)= Link('d', 0 , 'a', .53, 'alpha', pi/2);
L(6)= Link('d', 0 , 'a', 0, 'alpha', 0);
Inmoov= SerialLink(L, 'name', 'Inmoov');
Inmoov.teach

