require_relative 'node'
require 'pry'

class GreedyGraph
	#we want to be able to allow them to read the root or the array from outside the class
	attr_reader :root
	attr_reader :node_array

	#initialize an empty array to store the cities in, set root to be nil and updated to be nil
	#updated holds whether the graphs connections are "up to date" and is false if you delete or add a node without
	#recreating graph
	def initialize
		@node_array = []
		@root = nil
		@updated = false
	end

	#simple function to add node to the array
	def add_node(node)
		# if the node array is empty, its the first node and then push it onto array and make it root
		if @node_array == []
			@node_array.push(node)
			@root = node

		#if the node is already in the array, you shouldn't readd it, it will make connections strange
		elsif @node_array.include?(node)
			puts "That nodes already in the array"

		#if its not in the array, push it on and clear out the graph
		else
			@node_array.push(node)
			clear_graph
		end
	end	

	#if the node is in the arrya, then delete it and clear the graph
	def delete_node(node)
		if @node_array.include?(node)
			@node_array.delete(node)
			if node == @root
				@root = @node_array[0]
			end
			clear_graph
		else
			puts "That node isn't included"
		end
	end

	#sets a new root node as the starting position and then clears the graph
	def set_root(node)
		@root = node
		clear_graph
	end

	#just a simple function to let someone search for a node based on a name
	def find_node_by_name(name)
		@node_array.each do |node|
			if node.name == name
				return node
			end
		end
		return
	end

	#This function will actually draw the connections to the nearest neighbors
	def create_graph
		
		#clear all the nodes in the graph so that there isn't any leftover data the gets inherited
		clear_graph
		
		#the first node will be the root node
		first_node = @root

		#set the current node to be the root
		current_node = @root

		#duplicate the @node_array in nodes left and remove the current node
		nodes_left = @node_array.dup
		nodes_left.delete(current_node)

		#while there is still nodes left to place
		while nodes_left != []
			
			#set the next node and the next distance to be nil
			next_node = nil
			closest_distance = nil

			#iterate over all the nodes we haven't placed in graph yet
			nodes_left.each do |node|
				# determine the distance between the node and the current_node that is in the graph
				temp_distance = determine_distance(current_node, node)
				
				#if the next node doesn't exist or if the distance is less than the closest distance so far
				if !next_node || temp_distance < closest_distance
					next_node = node
					closest_distance = temp_distance
				end
			end

			#set the next node of the current node to be next node
			current_node.next = next_node

			#make the node we are going to place be next_node
			current_node = next_node

			#remove next_node from the array of nodes that still need to be placed
			nodes_left.delete(current_node)
		end

		#once we have placed all the nodes, draw the final connection between the first node and the last node
		current_node.next = first_node

		#set updated to be true (because the graph is now current)
		@updated = true
	end

	def print_graph
		#if the graph isn't current or up to date, let the know that you shouldn't print it
		if !@updated
			puts "The graph isn't up to date"
		else
			#start at the root
			current_node = @root


			#while we haven't gotten back to the root yet
			while current_node.next != @root

				#print out the node name
				puts current_node.name

				#make current node the next node
				current_node = current_node.next
			end

			#print out the last node so that we finish the circle
			puts current_node.name

			return
		end
	end


	private

	def clear_graph
		#for each node in the array, set the previous and next to be nil
		@node_array.each do |node|
			node.previous = nil
			node.next = nil
		end
		#graph isn't updated
		@update = false
	end

	#this actually determines distance squared in order to avoid an unnecessary math call, because if a >  b then a ** 2 > b ** 2 assume a and b are both real and
	#non-negative, which is garanteed from the distance formumla
	def determine_distance(node_one, node_two)
		#x distances
		x_one = node_one.position[0]
		x_two = node_two.position[0]

		#y_distances
		y_one = node_one.position[1]
		y_two = node_two.position[1]

		#the ole a^2 + b^2 = c^2 formula
		(x_one - x_two) ** 2 + (y_one - y_two) ** 2
	end

end

=begin

node_one = Node.new("one", [2,1])
node_two = Node.new("two", [2,-1])
node_three = Node.new("three", [-2,-1] )
node_four = Node.new("four", [-2,1] )

greed_graph = GreedyGraph.new


[node_one, node_two, node_three, node_four].each do |node|
	greed_graph.add_node(node)
end

greed_graph.create_graph


greed_graph.print_graph

=end