require_relative "linked_list"
require_relative "node"
require "benchmark"


n = 10000

array = []
(1..n).each do |index|
	array.push(index)
end

linked_list = LinkedList.new
(1..n).each do |index|
	linked_list.add_to_tail(Node.new("#{index}"))
end

current_node = linked_list.head
5000.times do
	current_node = current_node.next
end



Benchmark.bmbm do |x|

	x.report("Create Array from base array") { array_quick = Array.new(n) }

	x.report("Create Array from each") do 
		array = []
		(1..n).each do |index|
			array.push(index)
		end
	end

	x.report("Create Linked List") do
		linked_list = LinkedList.new
		(1..n).each do |index|
			linked_list.add_to_tail(Node.new("#{index}"))
		end
	end

	x.report("access 5000th node") { array[5000] }

	x.report("access 500th node in linked_list") do 
		current_node = linked_list.head
		5000.times do
			current_node = current_node.next
		end
		current_node
	end

	x.report("delete 5000th element in Array") { array.delete_at(5000)}

	x.report("delete 5000th node in linked_list") {linked_list.delete(current_node)}





end