1) lets say I have an algorithm that involves finding my keys. If my algorithm is to put my keys in the same spot every single time I came home, then finding my keys would run in O(1), because I know exactly where to look for my keys whenever I need to find them.

lets say instead that everytime I needed to find my keys, I instead threw them out of my house into a swamp with a swamp monster. Everytime I found my keys, the swamp monster double the amount of keys in the swamp that I had to search through. That would be like an algorithm with an efficieny of O(2^n)


2) The best case scenario for a binary search is constant time, because you _might_ find it the first time you split the array in half.

3) The worst case scenario for a binary search is in logarithmic time.

4) The bounded case scenario for a binary search is in logarithmic time, because we could multiply our logarithmic time by some constant c1 thats less than one to get it below the worst case. But then for complexity we don't care about constants, so it is still just logarithmic time.

5) ![graph image](https://i.imgur.com/2yvrfun.png)


6) the function approaches infinity as n approaches infinity

7) The big O would be O(2^n)

8) The function is included in this folder as linear_search.rb

9) The chart I made is postsed on imgur at ![Chart with linear complexity](https://i.imgur.com/zUZfzrY.png)

10) The Big-O of binary search of a sorted list is O(n log(n))

11) The Big Omega of binary search is O(1)

12) So I'm a little confused because the Khan Academy seemed to suggest that the Big-Theta only existed if it was bounded by the same worst and best case scenario (like selection sort which always runs in O(n^2)). But given what I have seen in the checkpoint I think that the best bounded case for binary search is still O(n log(n)), due to the same logic that was true in number 4 of this assignment.