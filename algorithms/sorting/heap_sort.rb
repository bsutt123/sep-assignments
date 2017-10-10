def heap_sort(array)
	if array.length <= 1
		return array
	end
	heapified_array = heapify(array)
	largest_value = heapified_array[0]
	heapified_array[0] = heapified_array[-1]
	return heap_sort(heapified_array[0...-1])+[largest_value]

end

def heapify(array)
	num_elements = array.length
	if num_elements % 2 == 0
		num_leaves = (num_elements/2)
	else
		num_leaves = (num_elements/2)+1
	end

	leaf_start = num_elements-num_leaves

	indices_to_heap = (0...leaf_start).to_a.reverse
	indices_to_heap.each do |index|
		swap_index = false
		if !array[2*index+1]
			if array[2*index] > array[index]
				index_to_swap = 2*index
				swap_index = true
			end
		else
			if array[2*index] > array[2*index+1]
				if array[2*index] > array[index]
					index_to_swap = 2*index
					swap_index = true
				end
			else
				if array[2*index+1] > array[index]
					index_to_swap = 2*index+1
					swap_index = true
				end
			end
		end
		if swap_index
			temp = array[index_to_swap]
			array[index_to_swap] = array[index]
			array[index] = temp
		end
	end 

	array
end


array = (1..10).to_a.shuffle
p array

sorted_array = heap_sort(array)

p sorted_array