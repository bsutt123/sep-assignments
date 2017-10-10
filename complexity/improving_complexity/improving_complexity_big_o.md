first off this is from my benchmark...


                                  user     system      total        real
time to create collection    0.000000   0.000000   0.000000 (  0.000927)
time to flatten              0.010000   0.000000   0.010000 (  0.001582)
sort array poorly            1.150000   0.000000   1.150000 (  1.152409)
code optimized               1.110000   0.000000   1.110000 (  1.108938)
time complexity optimized    0.020000   0.000000   0.020000 (  0.020904)
space complexity optimized   2.280000   0.000000   2.280000 (  2.278906)




1) for improving_complexity version 1, I wasn't supposed to modify the original complexity, so it is still O(n^2) that you would expect from insertion sort as the worst case. for insertion sort, the worst case is that you are always given a smaller value, thus you have to swap across n values every time. This particular version is a little different because instead of swapping the smallest position down, it builds a new sorted array, which lets you do some fun stuff like checking if it is larger than the largest value or smaller than the smallest. Still, lets consider the upper bounded case where we just get super unlucky, and each as we iterate from array of length 1 to length n, we have to swap the number all the way into the bottom position across every element k we have inserted so far. We can express the iterations for the sorting in terms of n then as

n + n-1 + n-2 + ... + 0 = n^2 + 1/2.

So this is what it will take to _sort_ the combined algorithm of size n worst case using insertion sort.

we also need to consider out `flatten` call. While I am not 100% sure how it is implemented, I think that the best and fastest way to implement it would be by going through each value and pushing it onto a single array, which would run in worst case linear time.

Thus for this particular case we have O(n^2/2+n+1/2), but as we know we ignore the pesky lower order terms and just say it runs in worst case O(n^2). The insertion sort dominates the runtime for this function, which is easily apparent once you improve the time complexity.

2) So not surprisingly, my quicksort algorithm significantly improves the time complexity of the problem. However, quicksort _technically_ has the same worst case runtime O(n^2) as insertion sort. Logically this is because if we pick a the worst pivot ever, then we will only sort one value at a time, and the rest of the array will need to be sorted in the same manner. If we assume we pick the worst pivot every time, then that means we get the same arithmetic series for our iterations...

n + n-1 + n-2 + ... + 0 = n^2+1/2

The big difference here is that even with a rudimentary pivot like the far right node of a shuffled array, we are exceedingly unlikely to get it to split that poorly, and in reality it runs much faster than insertion sort. This is evident by the amount of times it takes to run  the quicksort algorithm versus the insertion sort algorithm


3) So I don't think that I will need to justify that insertion sort is still O(n^2), because it is the exact same logic as the first question.

In terms of space, I'm pretty sure that this algorithm uses less because instead of making 2 arrays of size n, it only makes one array of size n, and then modifies that array until it is sorted. This means that there is going to be fewer arrays stored in memory, which is going to decrease the amount of space used by the algorithm. I still think that it is going to have a spacial complexity of O(n) rather than O(log n) or O(1), but I am confident that I reduced the unseen constant factor.