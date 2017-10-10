def linear_search_complexity(n)
	if n < 1
		puts 0
	else
		(1..n).to_a.each {|x| puts x}
	end
end

linear_search_complexity(10)