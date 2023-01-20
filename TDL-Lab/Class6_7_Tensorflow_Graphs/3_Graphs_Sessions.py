# -*- coding: utf-8 -*-
"""
Created on Tue Jan  7 20:27:07 2020

@author: Srinivas
"""

# Lets first import tensorflow and numpy
# use import tensorflow as tf if you are using version==1.14 or you could used
from __future__ import absolute_import, division, print_function, unicode_literals
import tensorflow.compat.v1 as tf
tf.disable_v2_behavior()
# Dont worry if you see deprecated warnings all over the place. Its ok for now
#Lets also import numpy as np
import numpy as np
# Ok so lets try a few things in numpy just as a recap
a = np.zeros((2,2)) 
 # Lets get the shape , for us ordinary mortals that is dimensions
a.shape # 2,2 array
b = np.zeros((3,1)) # 3,1 array
b.shape
#Lets convert this into a 4 rows and 1 column
#a.reshape(4,1)
print(a)
print(b)

#Now lets us repeat the same in tensorflow
ta = tf.zeros((2,2)); tb = tf.ones((2,2))
print(ta)
print(a)
#oops, it looks like that ta does not seem to have its values initialzed
#This is an exteremely important concept of tensorflow. 
#Tensorflow operates in 2 stages - build stage and the 2nd is the eval or run phase
#Thats the reason why you dont see ta getting initialized .
#In put values into into ta and tb we need to first build which we did
#we would now need to eval it and that can be run only thru a session
sess = tf.Session()
print(sess.run(ta))
# You could offcourse do this thru an interactive session
# which brings us to a very important concept that we will talk now
# computational graphs 
#import tensorflow
#import tensorflow as tf
#declare constants
a=tf.constant(2,name="a")
b=tf.constant(3,name="b")
c=tf.add(a,b,name="c")
print(c)

# we added 2 constants and then added an add operation saying c = a+ b
#looks like c is printed 
#the only way we can actually have the value of c avail is when we have 
#the execute phase on
sess = tf.Session()
print(sess.run(c))
# so the moral of the story is that we have to execute run
# this by default creates a default computational graph 
# it is not necessary to use the default graph. You could create your own graph
# the syntax is not to important; but you would need to know that
# you can execute parts of a graph as a well
# for example lets say we define 
d=c+5
sess = tf.Session()
print(sess.run(c))
sess = tf.Session()
print(sess.run(d))


 

 