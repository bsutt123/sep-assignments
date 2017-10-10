 def code_optimized(*arrays)

  #this doesn't help or hurt the array, but it makes it so much prettier so I think I'm going to keep it.
  combined_array = arrays.flatten

   sorted_array = [combined_array[-1]]

   for val in combined_array[0...-1]
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif val > sorted_array[-1]
         sorted_array << val
         break
       end
       i+=1
     end
   end

   # Return the sorted array
   sorted_array
 end