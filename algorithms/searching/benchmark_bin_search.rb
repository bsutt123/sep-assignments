require 'benchmark'
require_relative 'binary_search_iterative'
require_relative 'binary_search_recursive'
highest_number = 1000000

num_random_numbers = 100

array = (1..highest_number).to_a

random_numbers = array.sample(num_random_numbers)

Benchmark.bmbm do |bm|
	bm.report("iterative binary search for number") do
		random_numbers.each do |number|
			bin_search_iterative(array, number)
		end
	end

	bm.report("recursive binary search for numbers") do
		random_numbers.each do |number|
			bin_search_recursive(array, number)
		end
	end
end
