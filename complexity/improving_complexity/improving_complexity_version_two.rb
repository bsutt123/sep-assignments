
def time_complexity_optimized(*arrays)

  combined_array = arrays.flatten

  sorted_array = quick_sort(combined_array)

  sorted_array
end


def quick_sort(array)
  if array.length <= 1
    return array
  end
  pivot = array[-1]
  current_pivot_index = 0
  (0...(array.length-1)).each_with_index do |index|
    if array[index] < pivot
      temp = array[index]
      array[index] = array[current_pivot_index]
      array[current_pivot_index] = temp
      current_pivot_index += 1
    end
  end
  temp = array[current_pivot_index]
  array[current_pivot_index] = pivot
  array[-1] = temp


  first_part = quick_sort(array[0...current_pivot_index])
  second_part = quick_sort(array[current_pivot_index+1..-1])

  return first_part + [pivot] + second_part

end
