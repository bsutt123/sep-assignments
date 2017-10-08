|          test                            |    user   |  system  |   total   |    real     |
|------------------------------------------|-----------|----------|-----------|-------------|
| inserting shuffled nodes into tree       | 0.220000  | 0.000000 |  0.220000 | (  0.222367)|
| inserting shuffled nodes into a heap     | 0.630000  | 0.000000 |  0.630000 | (  0.635769)|
| insert 100 random values into the tree   | 0.000000  | 0.000000 |  0.000000 | (  0.000399)|
| insert 100 random values into a heap     | 0.000000  | 0.000000 |  0.000000 | (  0.000412)|
| find 100 random titles in a tree         | 1.760000  | 0.000000 |  1.760000 | (  1.758901)|
| find 100 random titles in a heap         | 1.400000  | 0.000000 |  1.400000 | (  1.401428)|
| find 100 random ratings in a tree        | 0.000000  | 0.000000 |  0.000000 | (  0.000644)|
| delete 100 random nodes from a tree      | 0.060000  | 0.000000 |  0.060000 | (  0.064075)|
| delete 100 random nodes from a heap      | 3.150000  | 0.000000 |  3.150000 | (  3.153697)|


So thats my benchmark table

Also small side note. I actually implemented a _Max_ Binary Heap rather than a _Min_ Binary Heap. Since they are essentially the same thing except for the fact that a you swap with different criteria and to my mind they are equally difficult to make, I didn't change mine to a min heap. If you really want me to I'll modify it so that its a min heap.

On to questions!

1) So for insertion, they are actually pretty similar. I mean, yes, the heap takes longer, but in the grand scheme of things 3x longer isn't that bad. I feel like its only when you get into the orders of magnitude slower of faster that there is a noticable difference.

And I took the easy route out on a couple different parts of the Heap so I bet I could get it a little faster with some more work (particularly with my finding the next node to insert nodes into finding)

2) So I didn't like finding a single element because who wants a sample size of 1? thats just crazy talk. Instead I sampled 100 random elements and had them each find those, and each time the heap performed faster. But not that much faster. But if you were searching a lot (with depth first search because you aren't searching based on rating) The the heap was slightly better. But again not that much faster.

But if you are searching based on rating (or whatever you are organizing the tree by) then the tree is _much_ faster. But thats what you would expect, because you organized it that way. While I didn't implement it, the heap would also be _much_ faster if I was searching to elements that were high up on the heap (so like the highest element in a max heap or the minimum element in a min heap). If you know you are going to want the largest or smallest value a lot, then a heap can be super fast at searching (possible even in constant time depending on if you want the *blank* largest elements)


3) Deleting a node from a heap takes a lot longer. This makes sense, because with the tree, I just move the node down to a leaf position, then get rid of it. But with deleting a node from a heap, with the way that I program my heap I have to make sure that I find the correct position to insert the next node _and_ find the last node inserted (this is because I need to make sure it stays a binary heap, and thats what I use for deleting). I think this could be an artifact of how I delete nodes, and might not exist in another implementation of a heap.

I would use a Binary Search tree if I am storing nodes and I want to search by the _number_ you organize the heap by. If you do that then binary search tree finds things blindingly fast. You should always use a Heap if you always want to find the numbers in the way you organize the heap. For example, if you want to often search for the top 10 values, then you _know_ exactly where the top 10 values are in a Max Heap, and you can very easily search for them in constant time. 

If you are searching with a Depth First Search, it looks like the Binary Heap is a little better, likely because it stays balanced and doesn't have any unnecessary levels of the tree because it is filled out systematically. But again, it looks to me like those 2 are so close that they might as well be the same.