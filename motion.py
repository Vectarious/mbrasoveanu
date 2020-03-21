#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar 19 16:02:00 2020

@author: elfmaria
"""

# import necessary packages 
import numpy as np 
import math as m 
import matplotlib.pyplot as pyp

# define input arguments 
v0 = 10;
angle = 45;
h0 = 15;
g = 9.8;

# define projectile function 
def projectile(v0,angle,h0,g): 
# defined projectile function with input arguments of initial velocity (v0) 
# in meters per sec, launch angle (angle) in degrees,intial height (h0) in meters, 
# and gravitational acceleration (g) in meters per sec squared 

# convert from radians to degrees 
    
anglerad = m.radians(angle)

# determining the inital velocity 
v0x = v0*m.cos(anglerad);
v0y = v0*m.sin(anglerad);

# determining maximum height  
hmax = ((v0y)**2)/(2*g);

# determining time of flight 
tc = (m.sqrt(2*h0/g))+((v0y)**2/g**2);

# determining the range 
r = (v0x*tc); 

#define the trajectory of the projectile 
def trajectory(r,hmax):
    tf = np.arrange(0,tc,0.01)
    h = h0+v0y*t-(1/2)*(g)*(t**2);
    r = (v0x*tc);
    pyp(r,h)
    pyp.xlabel("Range (m)")
    pyp.ylabel("Height(m)")
    pyp.title("Trajectory of Projectile")
    
    return r,tf,hmax 

def freefall(h0,v0,g):
    #calculate time of flight 
    t = (2*v0*m.sin(anglerad))/g;
    #calculate final velocity 
    vf = m.sqrt((v0**2)+(2*g*h0));
    
    return vf,t 

#express the necessary unit conversions 
    def hconversion(height,unit):
        if unit == "m":
            h1 = height*3.281; 
            units = "ft"
#convert from ft to m 
        elif unit == "ft"
            h1 = height/3.281; 
            units = "m"
            
            return h1,units
        
#convert velocity with respective units 
        def vconversion(velocity,unit,nunit):
            if nunit == "ft/s": 
                if unit == "m/s" :
            vnew = velocity*3.281
        elif unit == "mph" :
            vnew = velocity*1.467
        else: 
            print('Input the new velocity along with its units and converted units')
        
    elif nunit == "m/s": 
        if unit == "ft/s": 
            vnew = velocity/3.281 
        elif unit == "mph": 
            vnew = velocity/2.237
        else: 
            print('Input the new velocity along with its units and converted units')
            
        elif nunit == "mph": 
            if unit == "m/s": 
                vnew = velocity*2.237 
            elif unit == "ft/s": 
                vnew = velocity/1.467 
            else: 
                print('Input the new velocity along with its units and converted units')
                
            else: 
                print('Input the new velocity along with its units and converted units') 
                
            return vnew,nunit 

#conversion of degrees and radians 
            def angleconversion(a,unit):
                if unit == "radians":
                    ang = m.degrees(a)
                elif unit == "degrees": 
                    ang = m.radians(a)
                else: 
                    print('convert angle measurement to proper units') 
                    return ang 
                
        
            
        
            
     
            
            
            