'''
static methods within a class \
create a class triangle and validate if the provided segment can consist a triangle before assigning to an object
'''
from math import sqrt

class Triangle(object):
    __slots__ = ('_a','_b','_c')
    
    def __init__(self,a,b,c):
        self._a = a
        self._b = b
        self._c = c
    
    #the static method does not refer to self, since the self object is not generated before validation
    @staticmethod
    def is_valid(a,b,c):
        return a+b>c and b+c>a and c+a>b
    
    def perimeter(self):
        return self._a +self._b +self._c
    
    def area(self):
        half = self.perimeter()/2
        return sqrt(half*(half-self._a)*(half-self._b)*(half-self._c))
    
    
def main(a=3,b=4,c=5):
    if Triangle.is_valid(a,b,c):
        t = Triangle(a,b,c)
        print(t.perimeter()) # or written as print(Triangle.perimeter(t))
        print(t.area())
    else:
        print('invalid shape')
        
if __name__ == '__main__':
    main(5,5,5)
    
 

'''
class method
create class within a class and use it as an attribute of the class
'''

from time import time, localtime, sleep


class Clock(object):
    def __init__(self, hour=0,minute=0, second=0):
        self._hour = hour
        self._minute = minute
        self._second = second
    
    @classmethod
    def now(cls):
        ctime = localtime(time())
        return cls(ctime.tm_hour, ctime.tm_min, ctime.tm_sec)
    
    def run(self):
        self._second +=1
        if self._second == 60:
            self._second = 0
            self._minute+=1
            if self._minute == 60:
                self._minute = 0
                self._hour = 1
                if self._hour == 24:
                    self.hour = 0
    
    def show(self):
        return '%02d:%02d:%02d'%(self._hour,self._minute,self._second)

def main():
    clock = Clock.now() # instead of clock = Clock(hour,minute,second)
    while True:
        print(clock.show())
        sleep(1)
        clock.run()

if __name__ =="__main__":
    main()
    
