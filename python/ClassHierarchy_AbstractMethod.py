'''
the class employee is an abstract class, the other classes inherit the its attributes and methods.
The get_salary method is an abstract method which is defined in the subordinate classes
'''
from abc import ABCMeta, abstractmethod

class Employee(object, metaclass = ABCMeta):
    def __init__(self,name):
        self._name = name
    @property
    def name(self):
        return self._name
    @abstractmethod
    def get_salary(self):
        pass

class manager(Employee):
    def get_salary(self):
        return 15000.00

class developer(Employee):
    def __init__(self,name, working_hour = 0):
        super().__init__(name)
        self._working_hour = working_hour
    @property
    def working_hour(self):
        return self._working_hour
    @working_hour.setter
    def working_hour(self,working_hour):
        self._working_hour = working_hour if working_hour >0 else 0
        
    def get_salary(self):
        return 150.00 *self._working_hour

class sales(Employee):
    def __init__(self,name,sales=0):
        super().__init__(name)
        self._sales = sales
        
    @property
    def sales(self):
        return self._sales
    @sales.setter
    def sales(self,sales):
        self._sales = sales if sales>0 else 0
        
    def get_salary(self):
        return 1200.00+self._sales*0.05
        
-------------------------------------------------        
def main():
    emps = [manager('AA'), developer('BB'),
        manager('CC'), sales('DD'),
        sales('EE'), developer('FF'),
        developer('GG')]
    for emp in emps:
        if isinstance(emp, developer):
            emp.working_hour = int(input('working hour of %s'%emp.name))
        elif isinstance(emp,sales):
            emp.sales = float(input('sales of %s'%emp.name))
        print('salary of %s: $%s'%(emp.name, emp.get_salary()))
        
if __name__ == '__main__':
    main()
