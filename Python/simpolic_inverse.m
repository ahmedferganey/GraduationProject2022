syms      theta1 theta2 theta3  theta4 theta5        
        T0_1= [ cos(theta1)    -sin(theta1)*cos(pi/2)    sin(theta1)*sin(pi/2)     40*cos(theta1);
                       sin(theta1)     cos(theta1)*cos(pi/2)     -cos(theta1)*sin(pi/2)     40*sin(theta1);
                       0                        sin(pi/2)                         cos(pi/2)                            0                 ;
                       0                                0                                           0                                      1                   ];
          T1_2= [ cos(theta2)    -sin(theta2)*cos(0)    sin(theta2)*sin(0)     262*cos(theta2);
                       sin(theta2)     cos(theta2)*cos(0)     -cos(theta2)*sin(0)     262*sin(theta2);
                       0                        sin(0)                         cos(0)                             82                 ;
                       0                                0                                           0                                       1                   ];         
             T2_3= [ cos(theta3)    -sin(theta3)*cos(pi/2)    sin(theta3)*sin(pi/2)     323.5*cos(theta3);
                       sin(theta3)     cos(theta3)*cos(pi/2)     -cos(theta3)*sin(pi/2)     323.5*sin(theta3);
                       0                        sin(pi/2)                         cos(pi/2)                             0                 ;
                       0                                0                                           0                                       1                   ];
              T3_4= [ cos(theta4)    -sin(theta4)*cos(-pi/2)    sin(theta4)*sin(-pi/2)     0*cos(theta4);
                       sin(theta4)     cos(theta4)*cos(-pi/2)     -cos(theta4)*sin(-pi/2)     0*sin(theta4);
                       0                        sin(-pi/2)                         cos(-pi/2)                             0                 ;
                       0                                0                                           0                                       1                   ];
                 T4_5= [ cos(theta5)    -sin(theta5)*cos(0)    sin(theta5)*sin(0)     70.5*cos(theta5);
                              sin(theta5)     cos(theta5)*cos(0)     -cos(theta5)*sin(0)     70.5*sin(theta5);
                                     0                        sin(0)                         cos(0)                            0                 ;
                                  0                                0                                           0                                       1                   ];
                   
               x =200;
               y= 100;
               z= 300;
           T0_5 = simplify(T0_1   *   T1_2     *   T2_3     *   T3_4     *   T4_5);
           T1_5 = simplify(T1_2     *   T2_3     *   T3_4     *   T4_5 );
           T2_5 = simplify(T2_3     *   T3_4     *   T4_5);
           T3_5 = simplify(T3_4     *   T4_5);
           Te = T0_5;
           Te = [1  0   0   x;
                     0   1  0   y;
                     0    0  1   z;
                     0     0  0  1];
             Te1_5 = simplify(T0_1 \ Te);
             Te2_5 = simplify(T1_2 \ Te1_5);
             Te3_5 = simplify(T2_3 \ Te2_5);
             Te4_5 = simplify(T3_4 \ Te3_5);
             I = simplify(T4_5\Te4_5);
          %I= simplify(inv(T4_5) *inv(T3_4) * inv(T2_3) * inv(T1_2)* inv(T0_1)* T0_5);
           eq(1) =  x==T0_5(1,4);
           eq(2) =  y==T0_5(2,4);
           eq(3) =  z==T0_5(3,4);
           eq(4) = Te1_5(1,4) - T1_5(1,4)== 0;
           eq(5) = Te1_5(2,4) - T1_5(2,4)== 0;
           eq(6) = Te1_5(3,4) - T1_5(3,4)==0;
           eq(7) = Te2_5(1,4) - T2_5(1,4)==0;
           eq(8) = Te2_5(2,4) - T2_5(2,4)==0;
           eq(9) = Te2_5(3,4) - T2_5(3,4)==0;
           eq(10) = Te3_5(1,4) - T3_5(1,4)==0;
           eq(11) = Te3_5(2,4) - T3_5(2,4)==0;
           eq(12) = Te3_5(3,4) - T3_5(3,4)==0;
           eq(13) = Te4_5(1,4) - T4_5(1,4)==0;
           eq(14) = Te4_5(2,4) - T4_5(2,4)==0;
           eq(15) = Te4_5(3,4) - T4_5(3,4)==0;
           eq(16) = I(1,4) ==0;
           eq(17) = I(2,4) ==0;
           eq(18) = I(3,4) ==0;
           sol = solve(eq);
           q(1:5,1) = double(sol.theta1);
           q(1:5,2) = double(sol.theta2);
           q(1:5,3) = double(sol.theta3);
           q(1:5,4) = double(sol.theta4);
           q(1:5,5) = double(sol.theta5);
           