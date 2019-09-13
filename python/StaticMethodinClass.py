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
    
