include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do

	let(:kevin_bacon) {Node.new("Kevin Bacon")}
	let(:tom_cruise) {Node.new("Tom Cruise")}
	let(:jack_nicholson) {Node.new("Jack Nicholson")}
	let(:kelly_mcgillis) {Node.new("Kelly McGillis")}
	let(:val_kilmer) {Node.new("Val Kilmer")}
	let(:leonardo_dicaprio) {Node.new("Leonardo DiCaprio")}
	let(:matt_damon) {Node.new("Matt Damon")}
	let(:harrison_ford) {Node.new("Harrison Ford")}
	let(:danny_glover) {Node.new("Danny Glover") }
	let(:al_pacino) { Node.new("Al Pacino")}
	let(:robert_deniro) {Node.new("Rober De Niro")}
	let(:ellen_page) {Node.new("Ellen Page")}
	let(:tom_hardy) {Node.new("Tom Hardy")}
	let(:tom_hanks) {Node.new("Tom Hanks")}
	let(:edward_burns) {Node.new("Edward Burns")}

	let(:bacon_graph) {Graph.new(kevin_bacon)}

	describe "get_array_length" do
		it "properly gets the length of base graph" do
			expect(bacon_graph.get_array_length).to eq(1)
		end
	end

	describe "add_node" do
		it "adds a node to the array" do
			bacon_graph.add_node(tom_cruise)
			expect(bacon_graph.node_array[-1]).to eq(tom_cruise)
		end

		it "increases length by one" do
			bacon_graph.add_node(tom_cruise)
			expect(bacon_graph.get_array_length).to eq(2)
		end
	end

	describe "remove_node" do 

		it "removes a node" do
			bacon_graph.add_node(tom_cruise)
			expect(bacon_graph.get_array_length).to eq(2)
			bacon_graph.remove_node(tom_cruise)
			expect(bacon_graph.get_array_length).to eq(1)
		end
	end	

	describe "change root" do
		it "changes the root node" do
			bacon_graph.add_node(tom_cruise)
			bacon_graph.change_root(tom_cruise)

			expect(bacon_graph.root_node).to eq(tom_cruise)
		end
	end

	describe "root_node" do

		before do

			kevin_bacon.film_actor_hash["A Few Good Men"] = [tom_cruise, jack_nicholson]

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
		end

		it "finds root node for matt_damon" do

			expect(bacon_graph.find_root_node(matt_damon)).to eq(['The Departed', 'A Few Good Men'])

		end
	
		it "finds root node for ellen page" do
			expect(bacon_graph.find_root_node(ellen_page)).to eq(['Inception','The Departed', 'A Few Good Men'])
		end

		it 'finds root node from val kilmer' do
			expect(bacon_graph.find_root_node(val_kilmer)).to eq(['Top Gun', 'A Few Good Men'])
		end


		it 'finds the root node from harrison_ford' do
			expect(bacon_graph.find_root_node(harrison_ford)).to eq(['Witness', 'Top Gun', 'A Few Good Men'])
		end
	end
end