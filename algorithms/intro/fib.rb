def fib(n)
	if n == 0
		return 0
	elsif n == 1
		return 1
	else
		value_one = 0
		value_two = 1
		current_n = 1

		while current_n < n
			temp_value = value_one+value_two
			value_one = value_two
			value_two = temp_value
			current_n += 1
		end
	end
	return value_two
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
puts fib(10)
