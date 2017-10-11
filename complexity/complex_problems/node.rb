class Node
	attr_accessor :next
	attr_accessor :previous
	attr_accessor :position
	attr_reader :name

	def initialize(name, position)
		if position.length != 2 || !position[0].is_a?(Integer) || !position[1].is_a?(Integer)
			puts "that isn't a valid position"
			return
		else
			@name = name
			@position = position	
		end
	end
end