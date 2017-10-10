require 'benchmark'
require_relative 'poorly_written_ruby'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'
final_number = 10000
collections = 100

array = (1..final_number).to_a

def create_shuffled_collection(array,num_collections)
	shuffled_array = array.shuffle
	output_array = Array.new(num_collections) { [] }
	
	current_array = 0
	shuffled_array.each do |num|
		output_array[current_array] << num
		if current_array == (output_array.length-1)
			current_array = 0
		else
			current_array += 1
		end
	end
	output_array

end


Benchmark.bmbm do |bm|
	bm.report("time to create collection") { create_shuffled_collection(array, collections) }
	bm.report("time to flatten") { create_shuffled_collection(array, collections).flatten }
	bm.report("sort array poorly") do 
		shuffled_arrays = create_shuffled_collection(array, collections)
		sorted_array = poorly_written_ruby(*shuffled_arrays)
	end
	bm.report("code optimized") do 
		shuffled_arrays = create_shuffled_collection(array, collections)
		sorted_array = code_optimized(*shuffled_arrays)
	end

	bm.report("time complexity optimized") do 
		shuffled_arrays = create_shuffled_collection(array, collections)
		sorted_array = time_complexity_optimized(*shuffled_arrays)
	end

	bm.report("space complexity optimized") do 
		shuffled_arrays = create_shuffled_collection(array, collections)
		sorted_array = space_complexity_optimized(*shuffled_arrays)
	end
end
