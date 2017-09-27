Answers for Hashes Part 1!

 So its usually not a good idea to double somethings size indefinitely. The exponential growth you will see in the size of your array (or hash) is just not funcationally that you want to be including unless you have to do it that way. Whats worse about our approach is that because we don't have a lot of
 sophistication with our hashing algorithm, when we double the size of something we might very well be leaving tons of nil values in our HashClass.

I'll be honest, I'm not exactly sure what they want me to do with the LOTR runtimes hash. The only really important part is that if you do it the way mentors seem to recommend (using the sum of the ascii keys for the hash_code) then the "return of the King" and the "Fellowship of the Ring" will have the same index for both the 6 _and_ the 12 sized hash (because we just double each time). So in order to store _3_ hash values, we make a array 24 units long. That just doesn't seem efficient if you ask me. 

This just highlights a problem that is inherit to hashes where unless you include a decent bit of sophistication in your algorithm and the way that you resize hashes, then you are going to possible run into some issues with memory allocation and benchmark speeds.

I can't tell if they want me to benchmark a hash. I don't think so but if they secretly did, then let me know and I'll whip up a benchmark.