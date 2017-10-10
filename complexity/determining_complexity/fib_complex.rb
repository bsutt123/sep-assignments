def numbers(n)
 if (n == 0)
   return 0
 elsif (n == 1)
   return 1
 else
   return numbers(n-1) + numbers(n-2)
 end
end


def numbers_iterations(n)
	if n == 0
		return 1
	elsif n == 1
		return 1
	else 
		return 1 + numbers_iterations(n-1) + numbers_iterations(n-2)
	end
end


array = (1..10)

array.each do |index|
	puts numbers_iterations(index)
end