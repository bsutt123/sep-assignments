class GreedyGraph
	def initialize
		@node_array = []
		@root = []
		@updated = false
	end

	def add_node(node)
		if @node_array == []
			@node_array.push(node)
			@root = node
		elsif @node_array.includes?(node)
			puts "That nodes already in the array"
		else
			@node_array.push(node)
			clear_graph
		end
	end	

	def delete_node(node)
		if @node_array.includes?(node)
			@node_array.delete(node)
			clear_graph
		else
			puts "That node isn't included"
		end
	end

	def create_graph
		clear_graph
		first_node = @root_node

		current_node = @root_node

		nodes_left = @node_array.dup.delete(current_node)

		while nodes_left != []
			next_node = nil
			closest_distance = nil
			nodes_left.each do |node|
				temp_distance = determine_distance(current_node, node)
				if !next_node || temp_distance > closest_distance
					next_node = node
					closest_distance = temp_distance
				end
			end
			current_node.next = next_node
			current_node = next_node
			nodes_left.delete(current_node)
		end
		current_node.next = first_node
		@updated = true
	end

	def print_graph
		if !@updated
			puts "The graph isn't up to date"
		else
			current_node = @root_node
			while current_node.next != @root_node
				puts current_node.name
				current_node = current_node.next
			end
			puts current_node.name
		end
	end
	

	private

	def clear_graph
		@node_array.each do |node|
			node.previous = nil
			node.next = nil
		end
		@update = false
	end

	def determine_distance(position_one, position_two)
		x_one = position_one[0]
		x_two = position_two[0]

		y_one = position_one[1]
		y_two = position_two[1]

		(x_one - x_two)^2 + (y_one - y_two)^2
	end

end
