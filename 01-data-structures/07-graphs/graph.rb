require_relative 'node'
require 'pry'

class Graph
	attr_reader :node_array
	attr_reader :root_node

	def initialize(root_node)
		@node_array = [root_node]
		@root_node = root_node
	end

	def add_node(node)
		@node_array.push(node)
	end

	def remove_node(node)
		@node_array.delete(node)
	end

	def get_array_length
		@node_array.size
	end

	def clear_distance_predecessor
		@node_array.each do |node|
			node.predecessor = nil
			node.distance = nil
		end
	end

	def change_root(new_root_node)
		@root_node = new_root_node
		clear_distance_predecessor
	end

	
	def find_root_node(node)
		current_node = node
		film_array = []
		while current_node != @root_node && film_array.length <= 6
			if !current_node.predecessor
				return "You didn't run the determine distances function"
			end
			found_a_node = false
			pred_node = current_node.predecessor
			current_node.film_actor_hash.each_pair do |key, value|
				if found_a_node == true
					break
				end
				value.each do |node|
					if node == pred_node
						if !found_a_node
							film_array.push(key)
							found_a_node = true
							break
						end
					end
				end	
			end
			current_node = pred_node
		end
		if film_array.length == 7 
			return "I couldn't find kevin bacon"
		else
			return film_array
		end
	end	

	def determine_distances_from_root
		current_root = @root_node

		current_root.distance_from_root = 0
		current_root.predecessor = @root_node

		queue = [current_root]

		while queue != []
			current_node = queue.shift
			current_node_distance = current_node.distance_from_root
			current_node.film_actor_hash.each_value do |node_array|
				node_array.each do |node|
					if !node.predecessor
						node.predecessor = current_node
						node.distance_from_root = current_node_distance+1
						queue.push(node)
					end
				end
			end
		end
	end


	private

	def clear_distance_predecessor
		@node_array.each do |node|
			node.predecessor = nil
			node.distance_from_root = nil
		end
	end

end

=begin
kevin_bacon = Node.new("Kevin Bacon")
tom_cruise = Node.new("Tom Cruise")
jack_nicholson = Node.new("Jack Nicholson")
kelly_mcgillis = Node.new("Kelly McGillis")
val_kilmer = Node.new("Val Kilmer")
leonardo_dicaprio = Node.new("Leonardo DiCaprio")
matt_damon = Node.new("Matt Damon")
harrison_ford = Node.new("Harrison Ford")
danny_glover = Node.new("Danny Glover") 
al_pacino = Node.new("Al Pacino")
robert_deniro = Node.new("Rober De Niro")
ellen_page = Node.new("Ellen Page")
tom_hardy = Node.new("Tom Hardy")
tom_hanks = Node.new("Tom Hanks")
edward_burns = Node.new("Edward Burns")

bacon_graph = Graph.new(kevin_bacon)


kevin_bacon.film_actor_hash["A Few Good Men"] = [jack_nicholson, tom_cruise]


tom_cruise.film_actor_hash["Top Gun"] = [kelly_mcgillis, val_kilmer]
tom_cruise.film_actor_hash["A Few Good Men"] = [kevin_bacon, jack_nicholson]

jack_nicholson.film_actor_hash["The Departed"] = [leonardo_dicaprio, matt_damon]
jack_nicholson.film_actor_hash["A Few Good Men"] = [kevin_bacon, tom_cruise]

kelly_mcgillis.film_actor_hash["Top Gun"] = [tom_cruise, val_kilmer]
kelly_mcgillis.film_actor_hash["Witness"] = [harrison_ford, danny_glover]

val_kilmer.film_actor_hash["Top Gun"] = [tom_cruise, kelly_mcgillis]
val_kilmer.film_actor_hash["Heat"] = [al_pacino, robert_deniro]


leonardo_dicaprio.film_actor_hash["The Departed"] = [jack_nicholson, matt_damon]
leonardo_dicaprio.film_actor_hash["Inception"] = [ellen_page, tom_hardy]

matt_damon.film_actor_hash["The Departed"] = [jack_nicholson, leonardo_dicaprio]
matt_damon.film_actor_hash["Saving Private Ryan"] = [tom_hanks, edward_burns]

harrison_ford.film_actor_hash["Witness"] = [kelly_mcgillis, danny_glover]

danny_glover.film_actor_hash["Witness"] = [kelly_mcgillis, harrison_ford]

al_pacino.film_actor_hash["Heat"] = [val_kilmer, robert_deniro]

robert_deniro.film_actor_hash["Heat"] = [val_kilmer, robert_deniro]

ellen_page.film_actor_hash["Inception"] = [leonardo_dicaprio, tom_hardy]

tom_hardy.film_actor_hash["Inception"] = [leonardo_dicaprio, ellen_page]

tom_hanks.film_actor_hash["Saving Private Ryan"] = [matt_damon, edward_burns]

edward_burns.film_actor_hash["Saving Private Ryan"] = [matt_damon, edward_burns]		

bacon_graph.add_node(tom_cruise)
bacon_graph.add_node(jack_nicholson)
bacon_graph.add_node(kelly_mcgillis)
bacon_graph.add_node(val_kilmer)
bacon_graph.add_node(leonardo_dicaprio)
bacon_graph.add_node(matt_damon)
bacon_graph.add_node(harrison_ford)
bacon_graph.add_node(danny_glover)
bacon_graph.add_node(al_pacino)
bacon_graph.add_node(robert_deniro)
bacon_graph.add_node(ellen_page)
bacon_graph.add_node(tom_hardy)
bacon_graph.add_node(tom_hanks)
bacon_graph.add_node(edward_burns)

bacon_graph.determine_distances_from_root



puts bacon_graph.find_root_node(matt_damon)
puts 
puts bacon_graph.find_root_node(tom_hanks)
puts
puts bacon_graph.find_root_node(harrison_ford)
puts 
puts bacon_graph.find_root_node(kelly_mcgillis)

=end