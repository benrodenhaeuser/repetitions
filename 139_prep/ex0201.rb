def step(start_val, end_val, step_val)
  current_val = start_val
  until current_val > end_val
    yield(counter)
    current_val += step_val
  end
  current_val
end

step(1, 10, 3) { |value| puts "value = #{value}" }
