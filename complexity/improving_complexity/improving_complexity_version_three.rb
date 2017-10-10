def space_complexity_optimized(*arrays)

  combined_array = arrays.flatten

  arrays = nil


  current_index = 0

  combined_array[1..-1].each_with_index do |num, index|
    current_index = index
    while current_index != 0 && combined_array[current_index-1] > combined_array[current_index]
      temp = combined_array[current_index]
      combined_array[current_index] =  combined_array[current_index-1]
      combined_array[current_index-1] =  temp
      current_index -= 1
    end
  end

  combined_array
end