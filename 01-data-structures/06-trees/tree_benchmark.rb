require_relative 'binary_heap/binary_heap.rb'
require_relative 'binary_tree/binary_search_tree.rb'
require_relative 'binary_tree/node.rb'
require 'benchmark'
require 'pry'

target_size = 10000

def create_new_tree(size)
	array = (1..size).to_a
	shuffled_array = array.shuffle

	shuffled_node_array = shuffled_array.map do |num|
		Node.new(num.to_s, num)
	end

	tree = BinarySearchTree.new(shuffled_node_array[0])

	shuffled_node_array[1...shuffled_node_array.length].each do |node|
		tree.insert(tree.root, node)
	end

	return tree
end


def create_new_heap(size)

	array = (1..size).to_a

	shuffled_array = array.shuffle

	shuffled_node_array = shuffled_array.map do |num|
		Node.new(num.to_s, num)
	end

	heap = BinaryHeap.new(shuffled_node_array[0])

	shuffled_node_array = shuffled_node_array[1..shuffled_node_array.length]

	shuffled_node_array.each do |node|
		heap.insert(node)
	end

	return heap

end

tree = create_new_tree(target_size)

heap = create_new_heap(target_size)


Benchmark.bmbm do |bm|
	
	bm.report('inserting shuffled nodes into treee') {new_tree = create_new_tree(target_size)}

	bm.report('inserting shuffled nodes into a heap') {new_heap = create_new_heap(target_size)}

=begin
	bm.report('insert a value into the tree') do 
		tree.insert(tree.root, random_node)
	end

	bm.report('insert a random value into a heap') do
		heap.insert(random_node)
	end

	bm.report('find 100 random values in a tree') do 
		numbers_to_find.each do |number|
			found_node = tree.find(tree.root, number.to_s)
		end
	end

	bm.report('find 100 random value in a heap') do
		numbers_to_find.each do |number|
			found_node = heap.find(heap.root, number.to_s)
		end	
	end

	bm.report('delete 100 random nodes from a tree') do
		nodes_to_delete.each do |node|
			tree.delete(tree.root, node.title)
		end		
	end

	bm.report('delete 100 random nodes from a heap') do
		nodes_to_delete.each do |node|
			heap.delete(heap.root, node.title)
		end	
	end

=end
end


def clear_node(node)
	node.right = nil
	node.left = nil
	node.parent = nil
end