def bin_search_iterative(array, value)
	#searching an array for a value given
	min_index = 0

	max_index = array.length-1

	middle_index = ((min_index+max_index)/2).to_i
	current_value = array[middle_index]

	while min_index != max_index && current_value != value
		if value > current_value
			min_index = middle_index + 1
		else
			max_index = middle_index - 1
		end
		middle_index = ((min_index+max_index)/2).to_i
		current_value = array[middle_index]
	end
	return current_value
end

array = (1..1000000).to_a

p bin_search_iterative(array, 21875)

