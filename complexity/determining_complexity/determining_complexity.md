1. This function runs in constant time, or O(1). This is becuase no matter how large n gets, it still will call a constant number of interations.

2. This will run in linear time or O(n). The key element to examine here is the `collection.length.times` call. Fairly obviously, for every additional element in collection, we will have the function make one additionaly iteration. To grow at the same rate is to be linear or O(n) time.

3. So collection in this case is an array of arrays, or so I assume. This trick here is that first we loop over all the arrays inside the larger array, then we loop over every element in each array and check to see if it is the largest. While it is tempting to think that this might be a loop inside a loop (which is usually O(n^2)). But if you add a single element to one of the inner arrays (and assuming they aren't connected for some like they refer to the same object), then it will still only increase the number of iterations by one. Thus I would posit that this function will still run in linear time O(n) relative to the total number of elements in each array.

4. So I love logic, and it is great to be able to use it when things are straightforward, but often testing and seeing for yourself is believeing. Logically, this should grow based on n^2, because each additional number squares the number of calls we make (because we have to add everything we did for the last one _and_ do a whole nothing series). If we were crafty we could do some memoization and significantly reduce our runtime, but since we don't I think that its worst case is O(n^2). 

But I also wanted to prove it, so I made a function called `numbers_iterations` which basically counted the number of iterations we made for the numbers function, and then summed them all up. Lo and behold, this was the output of that function (included in fib_complex.rb)

1
3
5
9
15
25
41
67
109
177

Looking at these numbers, it definiely isn't linear, which throws out O(n) and below. From there it could either be quadratic, exponential, or factorial. While it does grow quickly, it doesn't see to grow fast enough for factorial or exponential (which would be in the thousands by the 10th term). If I'm being honest, it looks like it grows O((n-1)^2) = O(n^2 -2n +1), but then we would ignore all the lower factor terms to get O(n^2)

5. So the iterative solution for the fibonacci sequence is much better. It runs in O(n) time because the while loop is going to make n iterations as it counts up from 0 to n one at a time. The biggest difference and the reason this one is so much faster is because for the recursive solution, we are going top down and we don't "remember" the work we did before. Thus it calculates numbers(6) as a part of calculating numbers(7) but it doesn't _remember_ the value that is returned form numbers(6) so when it runs into it again it calculates it all over again. 

the iterative solution doesn't have to do this because it builds the sequence from the ground up, so it simply adding and storing the last 2 values together.

6. So I thankfully, I can recognize quicksort by this point, which means I know that the worst case is going to be O(n^2). But now for the logic to prove it.

Quick sorts worst case is when it keeps picking just the worst pivot. The goal of the pivot is to split the array into equal parts as much as possible. If the pivot is the largest (or the smallest) value, then it won't properly bisect the array and will run slower than if it did. Since the comments were kind to us and explained that the pivot in this case is the far left value, lets assume we start with an array that is perfect reverse sorted (so the highest value is on the left).

First the sort will pick a pivot, then it will run through n-1 iterations to try and find values larger than the pivot. It finds none, so it moves the pivot to the end (as the largest value) and then will try again, picking the far left value as its pivot. But it has chosen poorly! It again will find no values larger than the pivot, and it will make another n-2 iterations on the array. This continues will n-3, n-4, n-5... 0

so the total number of iterationns we are going to make is going to be n + n-1 + n-2 + n-3 + ... + 0. We should recognize this as an arthimetic series. If we pair up in a reasonable way (sequencially putting the first and the last sum next to each other) then you can recognize each pair will sum up to (n+1), and there will be n/2 pairs, so we have (n+1) * (n/2) = (n^2+1/2) which means when we ignore the constant factor it will run in O(n^2) time at worst.


