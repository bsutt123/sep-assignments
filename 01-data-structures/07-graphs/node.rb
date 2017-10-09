class Node
	attr_accessor :actor_name
	attr_accessor :film_actor_hash
	attr_accessor :distance_from_root
	attr_accessor :predecessor

	def initialize(actor_name)
		@actor_name = actor_name
		@film_actor_hash = {}
	end

end


