def heapSort(array)
  puts "#{array} ** Original Array"

  # define variable for length of array
  heapSize = array.length - 1
  # Call buildHeap and pass the array
  buildHeap(array, heapSize)
  puts "array after build heap #{array}"
  
  # loop i from length of array down to 2
  for i in heapSize.downto(0) do
    puts "i is #{i}"
    puts "array is #{array}"
    # swap values in array location 1 & location i
    array[0], array[i] = array[i], array[0]
    # Reduce heapSize by 1
    heapSize -= 1
    # Call heapify with value of array & 1
    heapify(array, 1, heapSize)
  end
end

def buildHeap(array, heapSize)

  # Loop from variable length downto 1
  for i in (heapSize / 2).downto(1) do
    # Call heapify with value of array & i
    heapify(array, i, heapSize)
  end
end

def heapify(array, i, heapSize)
  left = i * 2
  right = (i * 2) + 1

  # Check values of array[left] & array[right]
  if left <= heapSize && array[left] >= array[i]
    # Define largest to dictate swap
    largest = left
  else
    largest = i
  end

  if right <= heapSize && array[right] >= array[largest]
    # Define largest to dictate swap
    largest = right
  end

  if largest != i
    array[i], array[largest] = array[largest], array[i]
    heapify(array, largest, heapSize)
  end
end

array = [0, 5, 1, 4, 3, 6, 9, 8, 2, 7]
sorted_array = heapSort(array)

p "final array #{array}"
p "sorted_array #{sorted_array}"