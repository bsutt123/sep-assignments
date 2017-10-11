require_relative 'node'
require 'pry'

class BinaryHeap
	attr_reader :next_open_node
	attr_reader :last_inserted_node
	attr_accessor :root

	def initialize(root)
		@root = root
		@current_number_nodes = 1
	end

	def insert(node)
		#if there is no root, the newly inserted node is now the root
		if @root == nil
			@root = node
		end
		@current_number_nodes += 1

		new_node_path = node_path(@current_number_nodes)

		current_node = @root

		new_node_path[0...-1].each do |num|
			if num % 2 == 1
				current_node = current_node.right
			else
				current_node = current_node.left
			end
		end

		if @current_number_nodes % 2 == 1
			current_node.right = node
			node.parent = current_node
		else
			current_node.left = node
			node.parent = current_node
		end

		current_parent = current_node.parent

		while current_parent && current_node.rating > current_parent.rating
			swap_node(current_parent, current_node)
			current_parent = current_node.parent
		end	


	end



	def find(root, data)
		#find uses a recursive depth first algorithm to find the appropriate node given the input data

		#if you don't give data, then don't find a node
		if data == nil
			return nil

		#if no starting position is given, return nil
		elsif root == nil
			return nil

		#if it is the root node, then return the root
		elsif root.title == data
			return root

		#otherwise
		else

			#recursively call find on the left side of the node
			left_find = find(root.left, data)
			
			#if the left find found a value that wasn't nil, return it, otherwise keep going
			#this is to avoid searching the right tree if you already found it
			if left_find
				return left_find
			end

			#recursively call find on the right side of the root
			right_find = find(root.right, data)
			
			#if right find returned something, then return the value
			if right_find 
				return right_find
			end
		end

		#return nil at the end so that if it doesn't find any node of that name it returns nil
		return
	end

	def delete(root, data)
		#if given no data, return nil
		if data == nil
			return nil

		#if given no root. return nil
		elsif root == nil
			return nil
		else
			#find the target node
			target_node = self.find(root, data)
			
			#delete that node
			delete_node(target_node)
		end
	end

	def delete_node(node)


		last_node_path = node_path(@current_number_nodes)
		last_node = find_node_by_path(last_node_path)

		if last_node.parent.left == last_node
			last_node.parent.left = nil
			last_node.parent = nil
		else
			last_node.parent.right = nil
			last_node.parent = nil
		end

		@current_number_nodes -= 1

		last_node.parent = node.parent

		last_node.left = node.left

		last_node.right = node.right

		node = nil 

		current_node = last_node
		target_rating = last_node.rating

		while (current_node.left && current_node.left.rating > target_rating ) || (current_node.right && current_node.right.rating > target_rating)
			if current_node.left && current_node.right
				if last_node.left > last_node.right
					swap_node(current_node, current_node.left)
				else
					swap_node(current_node, current_node.right)
				end
			elsif current_node.left
				swap_node(current_node, current_node.left)
			elsif current_node.right
				swap_node(current_node, current_node.left)
			end
		end


		
	end	

	def print_heap(children = nil, all_nodes = [], times_looped = 0)
		#if this is the first time we call print_heap
		if children == nil
			#root node is root
			root_node = @root

			#its children are its children
			children = [root_node.left, root_node.right]

			#all the nodes that might exist are pushed onto an array
			all_nodes.push(root_node, root_node.left, root_node.right)

			#if the root node isn't full
			if !root_node.left && !root_node.right

				#compact all the nodes to remove nil values
				all_nodes = all_nodes.compact

				#print all the nodes to standard out
				all_nodes.each do |node|
					$stdout.print("#{node.title}: #{node.rating}\n")
				end
			else

				#compact children to be doubly sure there isn't a nil value
				children = children.compact

				#recurse on the trees root children, passing in arrya with all the node values
				print_heap(children, all_nodes, times_looped)
			end
		else

			#set up an array to hold the next children
			next_children = []

			#pass in each child
			children.each do |child|

				#if a left child exists
				if child.left
					#push the child onto the array of children we still need to check for more children
					next_children.push(child.left)

					#push it onto the array of all nodes
					all_nodes.push(child.left)
				end

				#if a right child exists
				if child.right

					#push it onto the array of children we still need to check
					next_children.push(child.right)

					#push it onto all nodes array
					all_nodes.push(child.right)
				end
			end

			#if there are no more nodes to check for children
			if next_children == []

				#compact all the nodes to be 100% sure there is no nil values
				all_nodes = all_nodes.compact

				#print each node to standard out
				all_nodes.each do |node|
					$stdout.print("#{node.title}: #{node.rating}\n")
				end
			else
				#increment the number of times I had looped
				times_looped += 1

				#compact the children just to be sure there isn't any nil values
				next_children = next_children.compact

				#recurse across the next children we need to check and add to list
				print_heap(next_children, all_nodes, times_looped)
			end
		end

		#return nil at the end to make sure it doesn't return whole heap
		return
    end

    private

    def is_leaf?(node)
    	node.left == nil && node.right == nil
    end

    def is_full?(node)
    	node && node.left != nil && node.right != nil
    end

    def node_path(num)
    	path_array = []

    	while num > 1
    		path_array.push(num)
    		num = (num / 2).floor - num % 2
    	end

    	path_array.reverse
    end

    def find_node_by_path(array)
    	current_node = @root
    	array.each do |num|
    		if num % 2 == 1
    			current_node = current_node.right
    		else
    			current_node = current_node.left
    		end
    	end
    	return current_node
    end

	def swap_node(parent_node, child_node)
		#So for this function we are essentially swapping a parents position with one of its child nodes
		#The function will not work if you swap a node that isn't one of the children of the parent

		#store the bottom children to latter assign after
		child_left = child_node.left
		child_right = child_node.right

		#store the parent of the higher node to connect back togehter
		parent_parent = parent_node.parent

		# check if the child_node branches to the left or right of the parent_node
		if parent_node.left == child_node

			#store the other node attached to the parent if it exists
			other_node = parent_node.right

			#break all connections
			child_node.left = nil
			child_node.right = nil
			child_node.parent = nil

			parent_node.left = nil
			parent_node.right = nil
			parent_node.parent = nil

			#swap the parent and child node
			child_node.left = parent_node

			# if the other node exists, connect it back to the swaped child node
			if other_node
				child_node.right = other_node
				other_node.parent = child_node
			else
				child_node.right = nil
			end
		else
			#store the other node attached to the parent
			other_node = parent_node.left

			#break all connections
			child_node.left = nil
			child_node.right = nil
			child_node.parent = nil

			parent_node.left = nil
			parent_node.right = nil
			parent_node.parent = nil


			#swap the parent and the child nodes connection
			child_node.right = parent_node

			#if the other node exists, then attach it back to the child
			if other_node
				child_node.left = other_node
				other_node.parent = child_node
			else
				child_node.right = nil
			end
		end	

		#if the left child exists, attach it to parent
		if child_left
			parent_node.left = child_left
			child_left.parent = parent_node
		else
			parent_node.left = nil
		end
		
		#if the right child exists, attach it to parent
		if child_right 
			parent_node.right = child_right
			child_right.parent = parent_node
		else
			parent_node.right = nil
		end
		
		# form the double connction to the parent child relationship
		parent_node.parent = child_node


		# if the parents parent original exisisted
		if parent_parent
			#determine if the parent was on the left or right of its original parent
			if parent_parent.left.title == parent_node.title
				#set it up on the left if it originally connected there
				parent_parent.left = child_node
				child_node.parent = parent_parent
			else
				#set it up on the right otherwise
				parent_parent.right = child_node
				child_node.parent = parent_parent
			end
		else
			#if the parents parent doesn't exist, it was the root node, and now you need to change the root
			@root = child_node
		end
	end
	

end
