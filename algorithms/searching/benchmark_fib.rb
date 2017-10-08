require 'benchmark'
require_relative 'fib_recursive'
require_relative 'fib_iterative'


Benchmark.bmbm do |bm|

	bm.report("fib iterative for 20") { fib_iterative(20) }
	bm.report("fib recrusive for 20") { fib_recursive(20) }

end