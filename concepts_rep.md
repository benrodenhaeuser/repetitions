# Repetitions of Central Concepts from 101

## Boolean values

### Conditionals

```ruby
if a
  b
else
  c
end
```

Which branch of the conditional (the one on the second line or the one on the fourth line) will get executed depends on the truthiness of the expression `a`. If `a` is truthy, then `b` (the first branch) will get executed. Otherwise, `c` (the second branc) will get executed. `a` is truthy if it evaluates to an object other than `false` or `nil`.

### Return values of conditionals

The return value of a conditional is the return value of the branch of the conditional that gets executed. If no branch of the conditional gets executed, the return value is `nil`.

The case where no branch of the conditional gets executed:

```ruby
>> if false then true end #=> nil
```

The case where the return value of a branch determines the return value of the conditional:

```ruby
>> a = 5 #=> 5
>> if a == 5 then b = 4 end #=> 4
```

The line `b = 4` evaluates to `4`. Since this is the branch of the conditional that gets executed (which is so because `a == 5` is truthy, as per the assignment in the preceding line which assigns `5` to `a`), the conditional as a whole returns `4`.

### Boolean values - Negation

The return value of negated expression `!a` depends on the truthiness of the expression `a`: if `a` is truthy, then `!a` returns `false`; otherwise, `!a` returns `true`.

```ruby
>> a = 7 #=> 7
>> !a #=> false
```

```ruby
>> a = 7
>> !(a == 6) #=> true
```

### Conjunction and Disjunction

The disjunction `a || b` (given Ruby expressions `a` and `b`) returns (the return value of) `a` if `a` is truthy, and (the return value of) `b` otherwise.

```ruby
>> 5 || 3 #=> 5
>> 5 != 5 || 3 #=> 3
```

The conjunction `a && b` (given Ruby expressions `a` and `b`) returns (the return value of) `a` if `a` is falsey, and (the return value of) `b` otherwise.

```ruby
>> 5 && 3 #=> 3
>> 5 != 5 || 3 #=> false
```

A general way of putting what is going on: These expressions return the first value that determines the truth or falsehood of the entire expression.

### `nil`

- `nil` and `false` are closely related, as they are the only objects that evaluate to *false* in a Boolean context (of course, `false` evaluates to false in all contexts!). So *on the level of truthiness*, they are equivalent. However, `nil` and `false` do not reference the same object! `nil` evaluates to an instance of the class `NilClass` (it is the single instance of that class), and `false` evaluates to an object of the class `FalseClass` (it is, again, the single instance of that class).

```ruby
>> nil.class #=> NilClass
>> false.class #=> FalseClass
```

`false` is the opposite of true, i.e., `!true` returns `false`. `nil` is a value that is often returned to indicate "the absence of a meaningful value".

For example, by default, indexing into an array at an invalid index returns `nil`:

```ruby
>> array = [0, 1, 2]
>> array[10] #=> nil  
```

## Variables

- A variable is a pointer to an object in memory.
- A variable references an object.
- A variable evaluates to an object.

### Variable assignment

The effect of a variable assignment is that a variable references (points to) a particular object in memory, namely the object that has been assigned to the variable:

```ruby
a = 5
```

This is an example of an assignment. The variable `a` is *bound to* the Integer object `5`.

### Variable initialization

Initialization is assignment to an initial value. That is, a variable is initialized if (1) it is assigned to a value, and (2) it has not been in use before.

### Reassignment

Reassignment is assignment of an object to a variable that has already been in use before.

```ruby
a = 5
a = 4
```

On the second line, the variable is reassigned (previous to the reassignment, the variable pointed to the `5` object, now it points to the `4` object)

## Scope

The fundamental observation here is: *The scope of a local variable depends on where it is initialized.*

The basic scope rules for local variables:

1. *Block scope extends enclosing scope:* a block has access to all local variables that are initialized in the scope enclosing the block scope.

```ruby
a = 4
[0, 1, 2].map { |elem| elem = a } # => [4, 4, 4]
```

2. *Block-scoped local variables are inaccessible from the scope enclosing the block:* the scope enclosing a block scope has no access to local variables initialized in the block scope.

```ruby
5.times { c = 5 }
c #=> "undefined local variable or method `c' for main:Object"
```

Note that the enclosing block may itself be a block scope.

3. *Method scope is entirely self-contained:* neither has the scope enclosing a method scope access to the local variables initialized in the method scope, nor does the method scope access to the local variables initialized in the enclosing scope.

```ruby
a = 5
def my_method
  puts a
end
my_method #=> "undefined local variable or method `a' "
```

and:

```ruby
def my_method
  a = 5
end
puts a #=> "undefined local variable or method ..."
```

Some more notes on scope rules:

- *What looks like a block is not necessarily a block:* A `do ... end` pair that is not part of a method invocation does not constitute a block. As a consequence, the rules for block scope do not apply.

Example:

```ruby
counter = 10
while counter != 0 do
  a = 7
  counter = 0
end
a #=> 7
```

Here, there is no method invocation, so the `do ... end` pair does not actually enclose a block, so no block scope is created, so the local variable `a` is accessible on the last line.

- *Peer scopes do not conflict.* Block scopes that are not nested may extend the enclosing scope using the same variables. The scopes also cannot mutually access each other.

```ruby
5.times { a = 5 }
3.times { puts a } #=> "undefined local variable ..."
```

- *Variable shadowing*

Example:

```ruby
a = 5
[0, 1, 2].each { |a| puts a }
```

Variable shadowing occurs when a block parameter has the same "name" as a local variable initialized ahead of the block (as in the preceding example). If this occurs, the local variable is inaccessible in the block, even though the scoping rules for local variables would not prohihbit it from being accessed.


## Object Mutation

Some methods in Ruby mutate the object they are called on, others don't. Methods may also mutate arguments that are passed to them, even though that is less comon.

What will the last three lines print?

```ruby
a = 'hi'
english_greetings = ['hello', a, 'good morning']
greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

greetings[:english][1] = 'hey'
greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end

puts a
puts english_greetings[1]
puts greetings[:english][1]
```

*After the three assignments* that start off the above code snippe, the value of the variable `a` and the value of the second element (i.e., the object at index 1) of the `english_greetings` array is the same object. Also, the object in the `greetings` hash at key `:english` is the same object referenced by `english_greetings`. So at this point in the code, `a`, `english_greetings[1]`, and `greetings[:english][1]` all reference the same object:

```ruby
>> a.object_id  #=> 70229191409160
>> english_greetings[1].object_id #=> 70229191409160
>> greetings[:english][1].object_id #=> 70229191409160
```

However, as per the line `greetings[:english][1] = 'hey'`, the second element of the array is reassigned to a new object, the string 'hey'. `english_greetings[1]` and `greetings[:english][1]` now point to that new object (since `greetings[:english]` and `english_greetings` reference the same object, an array), while `a` still points to the "old" object (a string with value `hi`):

```ruby
>> a.object_id #=> 70229191409160
>> english_greetings[1].object_id #=> 70229195676560
>> greetings[:english][1].object_id #=> 70229195676560
```

Now, an invocation of the `Hash#each` method comes along, upcasing each entry of each of the arrays stored as hash values in the hash `greetings` using the method `String#upcase!`. This method is destructive, mutating the affected strings in place. It will affect the reference of `greetings[:english][1]` and `english_greetings[1]`. As a result, the final three lines will print the following:

```ruby
>> puts a #=> prints "hi", returns nil
>> puts english_greetings[1] #=> prints "HEY", returns nil
>> puts greetings[:english][1] #=> prints "HEY", returns nil
```

How about this:

```ruby
array = [0, 1, 2]
reference_to_array = array
array[2] = 4

other_array = [0, 1, 2]
other_reference = other_array
other_array = [0, 1, 4]
```

Line 3 mutates the array referenced by the local variable `array` that was initialized in line 1. `array` and `reference_to_array` both point to that (mutated) array after line 3.

Contrast this with what is happening in line 4 to line 6: line 4 does not mutate the array referenced by the local variable `other_array` that was initialized in line 3. It *reassigns* `other_array` to a new array. So `other_reference` still points to the array that `other_array` *used to point to*, while `other_array` now points to a new array.

That's the difference between mutating an object and reassigning a variable.

Some elaboration:

```ruby
array = [0, 1, 2]
reference_to_array = array
array[2] = 4
array.object_id #=> returns some number
reference_to_array.object_id #=> returns the same number!
```

versus:

```
other_array = [0, 1, 2]
other_reference = other_array
other_array = [0, 1, 4]
other_array.object_id #=> returns some number
other_reference.object_id #=> returns a different number!
```

## An extended example

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)

s # => ?
t # => ?

```

What is the return value of the local variables `s` and `t` in the last two lines of code? They both return the string `HELLO!`. Why is that?

Let's walk through the code. After the line `s = 'hello'`, the local variable `s` points to a string with value `hello`. In the line after, the method `#fix` is called, passing `s` as an argument. The return value of the method invocation is then bound to the local variable `t`.

Now what is the return value of the `#fix` method called with the argument `s`? As the method is called, the object referenced by `s` is bound to the method parameter `value`. So `value` now points to the string `hello`. Then, `value` is upcased and concatenated with `!`. So `value` now points to `HELLO!`, because both methods (`String#upcase!` and `String#concat`) are destructive. Finally, `value` is returned, i.e., the string `HELLO!` is returned.

This means that as per the last line of code, `t` now points to the string `HELLO!`.

What about `s`? As I have pointed out above, when `fix` is called with argument `s`, the local variable `value` is bound to the string referenced by `s`. And the two methods called on `value` within the method are destructive: they mutate the reference of `value`, which happens to be the same object also referenced by `s`. So `s` now also points to the string `HELLO!`. Hence after the last line of code, both `s` and `t` point to the string `HELLO!`.


## Collections

### Element reference

Strings, hashes and arrays allow us to retrieve collection elements by means of square brackets notation.

```ruby
string = 'ben'
string[1] #=> 'e'

array = [0, 1, 2]
array[2] #=> 2

hash = { :some_key => 'some value' }
hash[:some_key] #=> 'some_value'
```

As you can see, strings and arrays are integer-indexed collections, while hash values can be retrieved using the hash keys. In all cases, the square brackets notation is actually a method invocation in disguise. We can make this explicit by using the standard method call notation:

```ruby
string = 'ben'
string.[](1) #=> 'e'
```

So the String class, the Array class, and the Hash class gives us special methods that we can use to reference elements in the collection.

For strings and arrays, we can also retrieve slices of the collection:

```ruby
string = 'ben'
string[0, 2] #=> 'be'
string[1..2] #=> 'en'
```

The second line of the snippet passes in two integers: the first is for the beginning of the slice we want to reference, the second is for the length of the slice. The third line of the snippet passes in a range: the range of indices of collection elements we wish to reference. Notice that, in both cases, we get back a new string.

This is quite analogous to arrays:

```ruby
array = ['a', 'b', 'c']
array[0, 2] #=> ['a', 'b']
array[1..2] #=> ['b', 'c']
```

Again, notice that `Array#slice` returns a new array. Consider the following example, where we first retrieve a slice of collection elements from the array, and then use indexed assignment (see below) to assign a new value at a particular index:

```ruby
array = ['a', 'b', 'c']
array[0, 2][0] = 'z'
array #=> ['a', 'b', 'c']
```

The array `array` is not affected by the second line, because the call to `Array#[]` returns a *new* array!

There is a difference between `Array#slice` and `String#slice`, though, which has to do with the fact that arrays are collections of objects, while strings are not: the difference is that if you slice a single element from an array, you get back an existing object. However, slicing a single-character string from a string returns a new string.

Another point of note about `Array#slice` is that the portion of an array we retrieve may be shorter than specified if we run out of array elements:

```ruby
array = ['a', 'b', 'c']
array[2, 10] # ['c']
```

In the second line, we are specifying that we wish to retrieve a slice of length 10 starting at index 2 of the array. However, since the element at index 2 is already the last element of the array, we get a one-element array as the return value of the method call. Notice that no error is returned, nor are `nil`s returned or something of the kind.

If we index into an array at an invalid index, however, we do get a `nil`:

```ruby
array = ['a', 'b', 'c']
array[10] #=> nil
```

Remember that nil is often, by convention, used to indicate "the absence of a value" – this is the perfect use case!

However, consider:

```ruby
array = [nil]
array[0] #=> nil
```

Here, `nil` does not indicate the absence of a value, it's actually the value at index 0!

If you use `Array#fetch` instead, an exception is raise when you index into an array at an invalid index:

```ruby
array = ['a', 'b']
array.fetch(10) #=> IndexError: index 10 outside of array bounds
```  

### Element assignment

The situation w.r.t. element assignment is quite analogous.

```ruby
string = 'ben'
string[1] = 'o' #=> 'o'
string #=> 'bon'

array = [0, 1, 2]
array[2] = 3 #=> 3
array #=> [0, 1, 3]

hash = { :some_key => 'some value' }
hash[:some_key] = 'some other value' #=> 'some other value'
hash #=> { :some_key => 'some other value' }
```

Again, the square brackets notation is a method call in disguise. Here, the methods are `String#[]=`, `Array#[]=` and `Hash#[]=`. For arrays, and strings, this is called "indexed assignment" (not so for hashes – they have no indices!).

## Iterators (`each`, `select` and `map`)

### `each`

A collection that wants to include the `Enumerable` module that supplies the `select` and `map` methods has to implement `each`. This is the case for `Array` and `Hash`.

How does `Array#each` work? `Array#each` is invoked with a block, and iterates over the array on which it is called from the first (0-indexed) element to the last one. The block takes one block argument, which, on each iteration, is bound to the current array element. With this technique, the block can access the current array element.

Example:

```ruby
array = [0, 1, 2]
doubled = []
array.each do |elem|
  doubled << elem * 2
end
doubled == [1, 2, 4] #=> true
end
```

What is going on in this code? First (line 1), we initialize the local variable `array` to the array `[0, 1, 2]`. Next (line 2), we initialize the local variable `doubled` to the empty array. Next (on line 3), we invoke the `each` method. The method invocation spans the lines 3 to 5, and will return the object it is called on, i.e., `array`, in our case. The block is executed once for each element of `array`: the current element of the array `array` is bound to the block argument `elem` (still on line 3), and the value `elem * 2` is pushed to the array `doubled` (line 4). As a result, the array `doubled` consists of the elements `1`, `2` and `4` after the method call to `each` returns, as the final line of code shows.

### `select`

`select` is part of the Enumerable module. (Notice, however, that the `Array` class implements its own `select` method, presumably for efficiency reasons. The `Hash` class also implements its own `select` method. What's special about `Hash#select` is that it returns a hash, rather than an array (as `Enumerable#select` does)).

`select` uses the truthiness of the return value of the block to select elements from the collection on which it is called, and collects the selected elements in a new collection, the latter collection being the return value of the `select` invocation.

If the return value of the block is truthy (i.e., evaluates to an object other than `false` or `nil`), the current element will be selected. Otherwise, it will not be selected.

### `map`

`map` is also part of the Enumerable module. Its return value is an array. The `Array` class implements its own version of `map`, presumably for efficiency reasons. The `Hash` class uses `Enumerable#map` as is (i.e., does not reimplement it).

`Enumerable#map` uses the return values of the block for transforming the collection on which it is called. That is, the (new) array returned by `map` will be an array populated with the return values obtained by executing the block once for every element of the collection on which `map` was called (an array element in the case of an array, a key-value pair in the case of a hash). As a consequence, the array returned by a `map` invocation will have the same size as the collection on which `map` was called.

## More collection methods

### `each_with_index`

`Array#each_with_index` iterates over the array on which it is called, just like `each`. The difference is that the block that is passed along with the method invocation has two parameters: the value of the current array element, and its index (in this order).

### `each_with_object`

`each_with_object` is another variation on `each`. It has one variable parameter, an (arbitrary) object, which will be also constitute the return value of the `each_with_index` invocation.

### `first`

Returns the first `n` elements of `self` (where `n` is passed as an argument).

### `include?`

Returns `true` if `self` contains the value passed as an argument, `false` otherwise.

### `partition`

Returns an array containing two arrays. The first one contains the elements for which the block returns a truthy value, the second one contains the elements for which the block returns a falsey value (so `partition` is like `select` and `reject` rolled into one method).

## Sorting and Comparing

### Comparing with `<=>`

A class that wants to make use of the Enumerable methods has to implement the method `<=>` for comparing instances of the class. `<=>` (the "spaceship operator") is a three-way comparison. It returns 1, 0 or -1.

Given class instances `a` and `b`,

- if `a <=> b` evaluates to `-1`, then `a` is "less than" than `b`.  
- if `a <=> b` evaluates to `1`, then `b` is "greater than" than `a`.
- if `a <=> b` evaluates to `1`, then both elements are equivalent.

### Comparing Strings with `String#<=>`

- The numerical values of characters in the ASCII table is used for comparison.
- For multi-char strings, the strings are compared character-wise, resulting in the lexicographic order.
- Uppercase characters are "less than" (come before in ascending order) lowercase characters.
- Shorter strings come before longer strings, e.g. 'be' is less than 'ben'.

### Comparing arrays with `Array#<=>`

- Arrays are compared element-wise. This means that the comparison operators of the elements are used.

Consider a sorting example for illustration:

```ruby
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
```

Notice that in this example, not all array elements are comparable, e.g., a comparison between the string `'cat'` and the integer `2` returns `nil`. However, the proper sort order is already established before these two elements have to be compared.

### Methods that use comparison

Besides `sort` and `sort_by`, also `max` and `max_by` use the comparison operator, as do `min` and `min_by`. Also: `minmax` and `minmax_by`. The method `minmax` returns a two-element array, containing the `min` first, and the `max` second:

```ruby
['ab', 'xy', 'yz', 'cd'].minmax #=> ["ab", "yz"]
```
