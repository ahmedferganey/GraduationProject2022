TITLE = "InMoov"
print( TITLE.center(100))

from numpy import * 
import math as m

import math
def getOption():
    print('Select an option:\n')
    print('\t1) Forward Kinematics\n')
    print('\t2) Inverse Kinematics\n')
    option = input()
    try:
        option = int(option)
        if option == 1:
            fowardKinematics()
        elif option == 2:
            inverseKinematics()
        else:
            print('Not an option')
            return
    except ValueError:
        print('Not an integer/Point cannot be reached')
        return
def fowardKinematics():
    '''
    Ask user for input and computing points of end-effector 
    '''
    length1 = input('Enter length of joint 1 (a1):\n')  # Getting input from keyboard
    angle1 = input('Enter angle of joint 1 (theta1):\n')
    offset1 =  input('Enter offset of joint 1 (d1):\n')
    length2 = input('Enter length of joint 2 (a2):\n')
    angle2 = input("Enter angle of join 2 (theta2)\n")
    offset2 = input('Enter offset of joint 2 (d2):\n')
    length3 = input('Enter length of joint 3 (a3):\n')
    angle3 = input("Enter angle of join 3 (theta3)\n")
    offset3 = input('Enter offset of joint 3 (d3):\n')
    length4 = input('Enter length of joint 4 (a4):\n')
    angle4 = input("Enter angle of join 4 (theta4)\n")
    offset4 = input('Enter offset of joint 4 (d4):\n')
    length5 = input('Enter length of joint 5 (a5):\n')
    angle5 = input("Enter angle of join 5 (theta5)\n")
    offset5 = input('Enter offset of joint 5 (d5):\n')

    try:
        length1 = float(length1)  # Testing to see if user entered a number
        length2 = float(length2)  
        length3 = float(length3)
        length4 = float(length4)
        length5 = float(length5)
        angle1 = float(angle1)  # Testing to see if user entered a number
        angle2 = float(angle2)  
        angle3 = float(angle3)
        angle4 = float(angle4)
        angle5 = float(angle5)
        offset1 = float(offset1)   # Testing to see if user entered a number
        offset2 = float(offset2)
        offset3 = float(offset3)
        offset4 = float(offset4)
        offset5 = float(offset5)
        
        t01 = array( [[m.cos(m.radians(angle1)),0,m.sin(m.radians(angle1)),40*cos(m.radians(angle1))],[m.sin(m.radians(angle1)),0, -cos(m.radians(angle1)),40*m.sin(m.radians(angle1))],[0,1,0,0],[0,0,0,1]])               
        t12 = array ([[m.cos(m.radians(angle2)),-m.sin(m.radians(angle2)),0,262*m.cos(m.radians(angle2))],[m.sin(m.radians(angle2)),m.cos(m.radians(angle2)),0,262*m.sin(m.radians(angle2))],[0,0,1,82],[0,0,0,1]])
        t23 = array([[m.cos(m.radians(angle3)),0,m.sin(m.radians(angle3)),323.5*m.cos(m.radians(angle3))],[m.sin(m.radians(angle3)),0,-m.cos(m.radians(angle3)),323.5*m.sin(m.radians(angle3))],[0,1,0,0],[0,0,0,1]])
        t34 = array([[m.cos(m.radians(angle4)),0,-m.sin(m.radians(angle4)),0],[m.sin(m.radians(angle4)),m.cos(m.radians(angle4)),m.cos(m.radians(angle4)),0],[0,-1,0,0],[0,0,0,1]])
        t45 = array([[m.cos(m.radians(angle5)),-m.sin(m.radians(angle5)),0,70.5*m.cos(m.radians(angle5))],[m.sin(m.radians(angle5)),m.cos(m.radians(angle5)),0,70.5*m.sin(m.radians(angle5))],[0,0,1,0],[0,0,0,1]])
            
        t02 = dot(t01,t12)
        t03 = dot(t02,t23)
        t04 = dot(t03,t34)
        t05 = dot(t04,t45)
        x = t05 [0][3]
        y = t05 [1][3]
        z = t05 [2][3]
                  
        print('The position of the end-effector P(x,y,z) is:\n')
        print('X: ' + str(x))  # Convert x to string
        print('Y: ' + str(y))  # Convert y to string
        print('z: ' + str(z))  # Convert z to string
            
    except ValueError:
        print('Invalid input, check your input again')
        return
    

    
def inverseKinematics():
    length1 = input('Enter length of joint 1 (a1):\n')
    length2 = input('Enter length of joint 2 (a2):\n')
    length3 = input('Enter length of joint 3 (a3):\n')
    length4 = input('Enter length of joint 4 (a4):\n')
    length5 = input('Enter length of joint 5 (a5):\n')
    x = input('Enter position of X:\n')
    y = input('Enter position of Y:\n')
    z = input('Enter position of z:\n')
    try:
        length1 = float(length1)
        length2 = float(length2)
        length3 = float(length3)
        length4 = float(length4)
        length5 = float(length5)
        x = float(x)
        y = float(y)
        z = float(z)
    except ValueError:
        print('Invalid input, check your input again')
        return
    # Computing angle 2 Elbow up/down
    numerator = ((length1 + length2)**2) - ((x**2) + (y**2))
    denominator = ((x**2) + (y**2)) - ((length1 - length2)**2)
    angle2UP = math.degrees(math.atan(math.sqrt(numerator/denominator)))
    angle2DOWN = angle2UP * -1

    # Angle 1 Elbow up
    numerator = (length2 * math.sin(math.radians(angle2UP)))
    denominator = ((length1 + length2) * math.cos(math.radians(angle2UP)))
    angle1UP = math.degrees(math.atan2(numerator, denominator))
    # Angle 1 Elbow down
    numerator = (length2 * math.sin(math.radians(angle2DOWN)))
    denominator = ((length1 + length2) * math.cos(math.radians(angle2DOWN)))
    angle1DOWN = math.degrees(math.atan2(numerator, denominator))
    print("Angle 1 Elbow up: " + str(angle1UP))
    print("Angle 1 Elbow down: " + str(angle1DOWN))
    print("Angle 2 Elbow up: " + str(angle2UP))
    print("Angle 2 Elbow down: " + str(angle2DOWN))
if __name__ == '__main__':
    getOption()
    pass

