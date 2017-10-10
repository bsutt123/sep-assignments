
require_relative "quick_sort"
require 'pry'

def bucket_sort(array)
	num_buckets = array.size/10+1


	buckets = Array.new(num_buckets) { [] }

	array.each do |num|
		bucket_number = num/num_buckets

		buckets[bucket_number].push(num)
	end

	sorted_array = buckets.map {|x| insertion_sort(x) }.flatten

	sorted_array
end


def insertion_sort(array)
	indices = (1...array.length).to_a
	indices.each do |index|
		current_index = index
		while array[current_index-1] && array[current_index] < array[current_index-1]
			temp = array[current_index]
			array[current_index] = array[current_index-1]
			array[current_index-1] = temp
			current_index -= 1
		end
	end
	array
end
