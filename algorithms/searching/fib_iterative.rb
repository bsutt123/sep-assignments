def fib_iterative(n)
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