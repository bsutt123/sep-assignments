So in terms of line...

1) So right now, I allow the users to look at the members in the line directly with a call of `line.members` but, I do not allow them to directly _change_ anything about the structure of the line. The makes sense, as if I allow direct assignment, well you open yourself up to all sorts of trouble. Not only tampering from the outside, but you could get past a lot of the safegaurds I put in place to make sure you didn't do something silly.

I don't allow people to put the same "person" on the line twice (the same person being someone with the exact same string name as someone else). While it would be possible to do that, it would require creating a lot of strange and usually unnecessary outside structure to track if there was more than one person in line of a particular name, then specifying which one you want to delete or get the index of, etc. Overall, it didn't make the line more functional (and if anything, it made it less functional as you would need to be tracking and including all the extra information which you usually don't need.)

2) If they want to find a particular element in my data structure, they can use the `search` command. Ironically enough, search will search the line for a string, and then when it finds the string, it will return that string. It does return nil if it can't find it though, which is useful information. If we started to expand this data structure (to include an array for each person or perhaps even a hash) then it would be possible to do an array association or search, or a particular name and then return the array or hash of information associated with that person. But as it stands, while searching is possible it is really functionally more a "Is this person in my array or not" question.

3) There are tons of lines in the real world, from bank queues to amusement park lines. Not surprisingly my line class is mostly applicable to lines, and I can't really think of a lot of other good examples that don't essentially boil down to "there are people in a line"

The only other example I can think of would be a factory assembly line, where you could track where each part was on the assembly line and add stuff to the back, but I think thats a bit of a stretch because I don't have any kind of "transform" that would change one element to a different one, which is what you really need on a factory assembly line. But if you were maybe tracking all the things in one area that aren't transforming on their way to another area, thats a possibility.

And for the Screen/Pixel

1) So you can create a new pixel, which will change your values to reasonable ones if you put in an input outside of the allowable range. I think if I were implementing this myself, it makes more sense to throw out an error and not allow the pixel to be made, because if there _is_ some kind of mistake on an input, it probably means the designer isn't thinking through everything in their code. By transmuting data, we may introduce bugs that they don't expect and are difficult to find. See Coersion in javascript.

So I again make it so that you can read a pixels attribute, but to set it you have to use my methods. This is so that they can't make a valid pixel and then change it so that it becomes not a valid input. I added little set_<color> functions that set the color while still using my functions to properly transmute the color to an acceptable range

I got rid of x and y on the Pixel attribute. To me, the pixel doesn't care where it lives. Its a pixel. It lives its happy little life knowing its colors and nothing more, and it isn't useful to know where a pixel is without the context of a screen. You can update and change pixel colors, and make new pixels without the burden of where it goes in the grand scheme of your screen.

A screen is a collection of pixels with a given height and width. I left in pixel insertion because they specifically wanted me to leave in insertion according to the instructions, but if it were me, then you would only be able to update a pixel at a given index, not insert a new pixel at a given index. It makes more sense to me to change a value in memory than point at a new one (which is what I think would happen but if I am wrong then let me know).

You can ask for what the pixel is at a particular index, and it only lets you ask for or insert pixels are an index that makes sense.

2) If they want to know what pixel is at a particular point, all they need to do is use the `at(x,y)` method and it will return whatever pixel is at that point.

3) So I have really zoomed in on this and it is pretty much only applicable to screens. This is because I specifically check to make sure you are only inserting pixels into my screen, which makes sense to me because I don't want you to start inserting integers, which would really throw of my screens ability to display information.

If I were to take a step back from screen, I would probably make a data structure that is a Plot, which is ultimately composed of an array of arrays all of a particular element. Then my screen would inherit from Plot, and the specifics of what I am trying to make with a screen can be implemented. Plots are a useful structure, and you can do a lot of fun things with mapping plots. Blueprints for houses, farming plots of land, or houses on a street are just the start of what we could store with plots.


