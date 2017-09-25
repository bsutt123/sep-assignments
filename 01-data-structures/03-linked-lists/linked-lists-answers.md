1) Spatial Locality is basically when we know all the information associated with some data structure is all stored sequentially in memory. This means that if I know I am dealing with a particular structure that enforces Spatial Locality (like Arrays) then I know that every element in the array will be stored sequentially in memory. Instead of getting only one element that I want, it is going to put everything in the array into the cache from RAM (or got forbid, the hard drive). This lets met easily index an array (see stuff like length) _and_ easily access any _particular_ index of the array in constant time. That sounds pretty awesome.

But with great power comes great costs. Spatial locality requires that we have everything stored next to all other elements in the array sequentially in memory. This means that if we have to add or subtract elements from the array, we likely need to make a whole new array that uses the right amount of memory. I always wondered why my professors told me to not resize arrays in Matlab, and now I know. Resizing an array comes at a great cost, but becuase we are constantly resizing arrays (at least I am in my code) this could lead to some problems. Especially when you have really big arrays.

2) So I ran my benchmark file  thats included in this folder and this is what was output...

|test                               | user    |  system  | total   | really     |
|-----------------------------------|---------|----------|---------|------------|
|Create Array from base array       |0.000000 | 0.000000 | 0.000000|(  0.000008)|
|Create Array from each             |0.000000 | 0.000000 | 0.000000|(  0.000529)|
|Create Linked List                 |0.000000 | 0.000000 | 0.000000|(  0.003540)|
|access 5000th node                 |0.000000 | 0.000000 | 0.000000|(  0.000001)|
|access 500th node in linked_list   |0.000000 | 0.000000 | 0.000000|(  0.000208)|
|delete 5000th element in Array     |0.000000 | 0.000000 | 0.000000|(  0.000002)|
|delete 5000th node in linked_list  |0.000000 | 0.000000 | 0.000000|(  0.000239)|

Holy smokes! Arrays are fast as all get out!

But this is exactly what we expected. Creating an array that is 10000 unites big using `Array.new(10000)` is blindingly fast (likely because it just grabs a chunk of memory thats the right size). Using each to construct the array 1 element at a time is quite a bit slower (100x slower), which is exactly what we would expect because it means that it can't just grab the right chunk one time and instead has to dynamically allocate the amount each time.

By comparison, linked list is slow. _Suuuuuuper_ slow. But thats what you would expect. Linked Lists are awesome because they don't enforce spatial locality at the cost of lower performance. They are different structures that will be useful in different scenarios.

accessing and deleting nodes and indices is also as you would expect. For arrays, it can go directly to the 5000th element, and then delete that element. It doesn't need to tranverse across all the elements, which is the advantage of Spatial Locality. 

Alternatively, the Linked List takes awhile. It has to go from the first all the way to the 5000th element, and that takes time. Deleting, it is similarly timed because getting rid of the node is actually fairly quick, the hard part is getting to the node itself in the first place (or maybe not the hard but at least the time consuming part)

Ultimately the right choice is going to depend on what you are going to be using the data structure for, as with everything. An array isn't "better" than a linked list, they are just different structures with different strengths and weaknesses.