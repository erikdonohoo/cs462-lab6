# Lab 6: KRL Fun

### Part 1

**ECI**
* A3243A36-D188-11E4-A27D-1109040ECC4C

**Rule Sets**  
echo
* https://github.com/erikdonohoo/cs462-lab6/blob/master/see_songs.krl
* b506845x1.prod

see_songs
* https://github.com/erikdonohoo/cs462-lab6/blob/master/echo.krl
* b506845x2.prod

**Questions**
1. I got a single directive back.  One rule ran.
2. I got two directives back, and two rules ran.  One in echo, and one in see_songs
3. The second time there was a second event listener and it responded to the event as well as the first listener so I got both responses back.

### Part 2

**Questions**
1. The second directive only shows up when msg_type is song
2. Yes it is.
3. The logs show my line that prints "match with god", which only prints when one of the lines has god in it.  You can follow the path of the events being fired as you look.

### Part 3

**ECI**
* A3243A36-D188-11E4-A27D-1109040ECC4C

![shot](shot.png)

**Rule Sets**  
song_store
* https://github.com/erikdonohoo/cs462-lab6/blob/master/song_store.krl
* b506845x3.prod

**Questions**
1. collect_songs responds to the event with a select query and stores that data.  The data is accessible through the songs function
2. The easiest way is to use the `difference` method between the two lists.
3. Then the songs function is unavailable.
4. If sharing is off, the functions are not available.
