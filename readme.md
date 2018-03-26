# Ruby 201: Object-Oriented Programming and Classes

## Learning Objectives
* Explain the principles of OOP
* Differentiate a class and instance
* Write and instantiate a Ruby class

## What do classes do for us?

They keep our code nice and tight, and keep related methods contained in nice little box that we call a class. It's exactly like the classes that we saw in Javascript, and they function exactly the same way. They take a declaration, have methods, and said methods can be accessed using dot notation like so: 

`class.method_name`

To be super technical and explicit, this is a concept we call Encapsulation.

To add to that, since objects are all wrapped up in this nice little bow, we can also trade them out and mess around with how we organize them without breaking them. As long as we keep all of our methods contained within our class definitions, we can define them in whatever order we want. This is known as Modularity.

Finally, just like we saw mainly in React, we can have objects inherit properties from other objects. Every time we saw the word `extends` when we defined components, we were inheriting methods like `componentDidMount` and `render` in addition to all of the methods that we defined ourselves. This is called Inheritance.


## Differences between JS and RB classes
One of the key differences between Javascript and Ruby classes is that you can't actually access properties outside of the class itself. That is to say that you look at object properties that we set in ruby's version of our `constructor`, which we'll call `initialize`. 

We'll be using keyword `initialize` to start up our class, and here, we'll define all of our properties and variables that are available to our class. These are called instance variables and will be available to other methods in our class. These behave exactly as variables that we'd define in our `constructor` method in javascript using `this.variableName = 'some variable`. Before we start testing stuff in our terminal, we're going to define a quick and dirty method that will just return a string. And in Ruby, the last line of every method between `def ... end` is always returned, meaning we don't have to actually say anything about returning anything.

```ruby
class Person 
	def initialize(name, nickname, catchphrase)
		@name = name
		@nickname = nickname
		@catchphrase = catchphrase
	end
	def introduce
		"hi there"
	end
end
```

Spinning up new instances of this class is exactly the same as how we'd do it in javascript. So if we want a new person, it's as easy as...

```ruby
jason = Person.new("Jason", "Jase", "same")
```
...and we can just use this pattern to spin up (or _instantiate_) new examples of this class over and over again, and they'd all have the same methods but different names, nicknames, and catchphrases. This is our way of implementing **_Modularity_** in our code. Every class is the same in structure, but different in content.

## Reading and Writing Properties

The thing about ruby classes, though, is that we can't actually read out the properties that we define in the initializer. Ruby doesn't let us do that. So we have to explicitly define methods that allow us to call on those properties. Here in ruby land we have to distinguish between properties and methods. This is because everything in ruby is a method, except for properties, which are variables. So if we were to brute force everything, we'd do something like...

```
def name= new_name
	@name = new_name
end
def name
	"hi there, my name is #{@name}"
end
```

...which allows us to leverage ruby's tendency to treat anything after a dot as a method. So now, since ruby's lack of parenthesis makes it super unclear where methods end, now we have an explicit declaration of `object.name = new_name`, which ruby reads as a method inside `object` called `name=`. This lets us rewrite our `name` property.

The second method we wrote will turn out just like how we are used to seeing in javascript, where we just write `object.method` and a variable or property pops out. But the way we get there is a little bit more involved than how javascript does it.

Instead of just accessing the property name directly, ruby calls a method that writes that property into the console. This is where that concept of **_Encapsulation_** comes into play. That is precisely why ruby classes are so reliable. Properties are not accessible from the outside world unless we allow it, which means that unless we know we want to change something, it won't ever change, even by accident. It's finicky, and it's weird, it's roundabout, but that's just how ruby works...

## attr\_reader, attr\_writer, and attr_accessor

Ruby gives us a workaround that allows us to circumvent all of this `name=` and `.name` nonsense. We have access to little ruby helpers called `attr_reader` and `attr_writer` that will do the work of `name` and `name=`, respectively.

It's also convention to throw our helpers right underneath our class declaration, so now our class is going to look something like so: 

```ruby
class Person 
	attr_reader :name 
	attr_writer :name
	def initialize(name, nickname, catchphrase)
		@name = name
		@nickname = nickname
		@catchphrase = catchphrase
	end
	def introduce
		"hi there"
	end
end
```

So now instead of defining two separate methods that take up three lines of code each, we now have only two lines of code that do exactly the same thing. Keeps our code nice and clean, which is what we strive for. 