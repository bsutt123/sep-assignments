def bin_search_recursive(array, value)
	
	middle_index = (array.length/2).to_i
	if array.length <= 1
		return array[0]
	elsif array[middle_index] ==  value
		return array[middle_index]
	else
		if value > array[middle_index]
			new_min = middle_index+1
			return bin_search_recursive(array[new_min..-1], value)
		else
			new_max = middle_index-1
			return bin_search_recursive(array[0..new_max], value)
		end
	end
end



array = (1..1000000).to_a

p bin_search_recursive(array, 45753)