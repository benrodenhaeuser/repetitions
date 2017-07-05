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

This is an example of an assignment.

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
