require 'benchmark'
require_relative 'greedy_graph'
number_nodes =  1000

def create_empty_graph(num_nodes)
	x_range = ((-num_nodes*2)..(2*num_nodes)).to_a
	y_range = ((-num_nodes*2)..(2*num_nodes)).to_a

	x_samples = x_range.sample(num_nodes)
	y_samples = y_range.sample(num_nodes)
	node_array = []

	(0...num_nodes).each do |index|
		node_array << Node.new("#{index+1}",[x_samples[index], y_samples[index]])
	end

	graph = GreedyGraph.new

	node_array.each do |node|

		graph.add_node(node)
	end

	graph
end

Benchmark.bm do |bm|
	bm.report("time to create the empty graph") {create_empty_graph(number_nodes)}

	bm.report("time to fill out the graph") do
		greedy_graph = create_empty_graph(number_nodes)
		greedy_graph.create_graph
	end
end