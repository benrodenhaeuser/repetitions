=begin

What is the method lookup path and how is it important?

If a method is invoked on an object, Ruby has to find the class or module in which the method is defined (if any). Ruby starts by looking in the class to which our object belongs. It then continues to look in the module included in the class (in reverse order of inclusion). It then proceeds to the superclass of the object, and continues the same process (inspecting the class itself, inspecting the modules included in reverse order, continuing to the super-class, and so on). Once the method is found, the method lookup terminates, and the method is executed. (if the method is nowhere to be found, the method lookup stops in the BasicObject class and Ruby throws a NoMethodError).

The sequence of (class and module) objects considered by Ruby in this manner is called the method lookup path.

The method lookup path is important because it allows us to predict which code will get executed when a method is invoked on an object. There might be several methods with the same name defined in the class hierarchy of our current object, and knowing the method lookup path means knowing which of them will get executed.



=end
