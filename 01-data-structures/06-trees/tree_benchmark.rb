require_relative 'binary_heap/binary_heap.rb'
require_relative 'binary_tree/binary_search_tree.rb'
require_relative 'binary_tree/node.rb'
require 'benchmark'
require 'pry'

target_size = 100000
num_random_elements = 100
def create_new_tree(array)

	node_array = array.map do |num|
		Node.new(num.to_s, num)
	end

	tree = BinarySearchTree.new(node_array[0])

	node_array =node_array[1...node_array.length]

	node_array.each do |node|
		tree.insert(tree.root, node)
	end

	return tree
end


def create_new_heap(array)

	node_array = array.map do |num|
		Node.new(num.to_s, num)
	end

	heap = BinaryHeap.new(node_array[0])

	node_array = node_array[1...node_array.length]

	node_array.each do |node|
		heap.insert(node)
	end

	return heap

end
	base_array = (1..target_size).to_a
	base_array = base_array.shuffle

	numbers_to_find = base_array.sample(num_random_elements)

	numbers_to_delete = base_array.sample(num_random_elements)

	random_elements = base_array.sample(num_random_elements)
	base_array = base_array - random_elements

	p base_array.include?(random_elements)


	tree = create_new_tree(base_array)
	heap = create_new_heap(base_array)

	random_tree_nodes = random_elements.map do |num|
		Node.new(num.to_s, num)
	end


	random_heap_nodes = random_elements.map do |num|
		Node.new(num.to_s, num)
	end


	random_array = (1..target_size).to_a.shuffle



Benchmark.bm do |bm|


	random_array = (1..target_size).to_a.shuffle
	
	bm.report('inserting shuffled nodes into tree') {new_tree = create_new_tree(random_array)}

	bm.report('inserting shuffled nodes into a heap') {new_heap = create_new_heap(random_array)}

	bm.report('insert 100 random values into the tree') do 
		random_tree_nodes.each do |node|
			tree.insert(tree.root, node)
		end
	end

	bm.report('insert 100 random values into a heap') do
		random_heap_nodes.each do |node|
			heap.insert(node)
		end
	end

	bm.report('find 100 random titles in a tree') do 
		numbers_to_find.each do |number|
			found_node = tree.find(tree.root, number.to_s)
		end
	end

	bm.report('find 100 random titles in a heap') do
		numbers_to_find.each do |number|
			found_node = heap.find(heap.root, number.to_s)
		end	
	end

	bm.report('find 100 random ratings in a tree') do 
		numbers_to_find.each do |number|
			found_node = tree.find_by_rating(tree.root, number)
			if found_node.rating != number
				puts "it didn't actually find the node"
			end
		end
	end

	bm.report('delete 100 random nodes from a tree') do
		numbers_to_delete.each do |number|
			tree.delete(tree.root, number.to_s)
		end		
	end

	bm.report('delete 100 random nodes from a heap') do
		numbers_to_delete.each do |number|
			heap.delete(heap.root, number.to_s)
		end	
	end


end


def clear_node(node)
	node.right = nil
	node.left = nil
	node.parent = nil
end