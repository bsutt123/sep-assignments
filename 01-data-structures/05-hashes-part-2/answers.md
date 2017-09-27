So I am going to describe Double Hashing, because I think that even though they "mentioned" it, they didn't describe how to do it at all, and while it seems fun to go find some esoteric algorithms, I would much rather have a good fundamental understand of how to do all the common ones. It was also mentioned in my research as one of the most common strategies so I want to know what it is

Double Hashing:

Double Hashing is when you use if you get a collision, computer _another_ hash function and add it to the original value. Double Hashing is designed so that you can avoid the "clustering" problem that is inherit with linear probing. As you would expect, if a lot of values end in the same area of a linearlly probed hash array, then you are by nature going to be stuck doing a lot of searches, which will only increase as each additionaly element will make the cluster even larger.

Double Hashing attempts to get around this by adding not 1 but a hashed value to the index each time, which decrease the chance that we get clustering. But as the Load Factor of the Array gets larger, because we aren't incrementing by one each time, we might very well skip over lots of open indices, which could hurt out performance.

Robin Hood Hashing

So Robin Hood Hashing seems pretty cool. While it is pretty far over my head (to the tune of a whole thesis about it). It seems liek what you do it while you are doing a linear probe, once you find an open slot, instead of just dropping that bad boy in there, you can swap the open spot to an earlier point to make this linear probe better for the first element, then you can keep going with the _next_ element and find a better place for that. If the Algorithm decides that there isn't a better place for that element, it stops. 

Its called Robin Hood Hashing because you take from the rich "well positioned" elements and spread it around, thus avoiding longer lookup times. You are going to use more memory for this type of hash operation. However, you are also going to be able to tolerate much higher load factors because you are basically rebalancing the hash array to minimize the amount of time it will take to find an out of place element. According to articles I read you can have LF of .9 or even .95 while not losing too much performance.

Lazy Deletion

So I want to talk about lazy Deletion for a second because even though it isn't collision resolution, it is hashing algorithms and I have seen it enough that I think I want to talk about it. Lazy deletion is the idea that you don't actually "delete" and entry when it is removed from the hash, and instead you just mark it as deleted. Cells marked as deleted are treated as empty for the intents of a probe.

As with all CS things, there are advantages and disadvantages for lazy deletion. Because you aren't deleting everything each time, then you aren't having to shift the datastructure, which can make the deletion operation faster. Also you can insert on top of a deleted item, which would mean avoiding a shift on insert, and you could over-write the data rather than create new data, another quick operation.

But lazy deletion is a waste of space on space concious systems because you are keeping around all these unusable elements, and if you are searching the data structure for an element then you are going to have to search through all the elements marked for deleted that are polluting the sturucture. Fun stuff.

My Collision Resolution strategy.

So I am going to make a combo collision resolution! First, we index by our hashing function. If we detect a collision, then we go to the last element in the array, which is a special element that is the start of a linked list. we hook up our collided element to the end of the linked list. If we don't find out element in the array at the correct index, we search the special linked list element. We resize the hash when the LF reaches .5 becuase I am about 100% certain that this algorithm is not as good as the others.

also we will need to mod the hash code by one less than the size of the array to make sure we leave that last spot open for our linked list business. 