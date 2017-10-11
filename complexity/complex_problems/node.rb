class Node
	attr_accessor :next_node
	attr_accessor :previous_node
	attr_accessor :position

	def initialize(name, position)
		if position.length != 2 || !position[0].is_a?(Integer) || position[1].is_a?(Integer)
			puts "That isn't a valid position"
			return
		else
			@name = name
			@position = position	
		end
	end
end