# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

# check_return_with_proc

# returning from a proc amounts to returning from the method invocation that called the proc (?)

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

# check_return_with_proc_2(my_proc)

# cannot return here (???)

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

# check_return_with_lambda

# returning from a lambda means returning to the place where the lambda was *called*

# # Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

#  check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# ??

# blocks and procs behave similarly w.r.t. return?
