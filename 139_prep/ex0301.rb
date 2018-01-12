assert(value_odd?, 'value is not odd!') # fails if value is not odd
assert_equal('xyz', value.downcase) # fails unless same value as determined by ==
assert_same(list, list.process) # fails unless same object as determined by equal?
assert_nil(value) # fails unless value is nil
assert_empty(list) # fails unless list is empty
assert_includes(list, 'xyz') # fails unless list includes `xyz`
assert_raises NoExperienceError do # fails unless employee.hire raises NoExpErr
  employee.hire
end
assert_instance_of(Numeric, value) # fails unless value is Numeric instance
assert_kind_of(Numeric, value)# fails unless value is Numeric instance or instance of one of its child classes
refute_includes(list, 'xyz') # fails if list includes xyz
