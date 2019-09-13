from math import sqrt

'''
allow access and updates when the attributes are protected
'''

class Point(object):
    
    __slots__ = ('_x','_y')
    
    def __init__(self, x=0, y=0):
        self._x = x
        self._y = y
    
    @property
    def x(self):
        return self._x
    @property
    def y(self):
        return self._y
    @x.setter
    def x(self,x):
        self._x = x
    
    
    def move_to(self,x,y):
        self._x = x
        self._y = y
        
    def move_by(self, dx,dy):
        self._x += dx
        self._y += dy
    
    def distance_to(self, other):
        dx = self._x - other._x
        dy = self._y - other._y
        return sqrt(dx**2 + dy**2)
    
    def __str__(self):
        return '(%s, %s)' % (str(self._x), str(self._y))

def main(x,y):
    p1 = Point(x,y)
    p2 = Point()
    print(p1.x)
    p1.x += 1
    print(p2)
    print(p1)
    p2.move_by(-1,2)
    print(p2)
    print(p1.distance_to(p2))
    p1._is_point = True
    print(p1._is_point)
    
if __name__ == '__main__':
    main(3,5)
    
