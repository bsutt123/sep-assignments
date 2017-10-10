require 'benchmark'
require_relative 'quick_sort'
require_relative 'heap_sort'
require_relative 'bucket_sort'

num_elements = 1000

array = (1..num_elements).to_a


Benchmark.bmbm do |bm|
	bm.report("quick sort") { quick_sort(array.shuffle) }
	bm.report("heap sort") { heap_sort(array.shuffle) }
	bm.report("bucket sort") { bucket_sort(array.shuffle) } 
end