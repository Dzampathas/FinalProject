# FinalProject

# Analog Synthesia
## Summery
Creating a way to process image sequences or videos into a format that an arduino can understand and output as analogue sound produced by a homemade speaker.

## Component Requirements

- Neodymium magnet
- Copper wire
- Wifi enabled microcontroler
- Wires
- Mosfets
- Resistors

## Challenges
- Making the speakers sound *good*
- Making the code work with videos
- Sending the data live (Or at least displaying the video as it plays)
- Figuring out the micros function

## Timeline

 - **Week 1:** Write Up
 - **Week 2:** Processing Refinement
 - **Week 3:** Arduino Refinement
 - **Week 4:** Expanding the speakers
 - **Week 5:** Final Project
 
 ## Resources
 
- https://www.electronicshub.org/homemade-speaker/

## Final Outcome

- EVERYTHING WORKS... Kinda.\
\
Well, I mean everything doe work, but there are some issues here and there with long term usage of the device, and how loud the speakers are over time, but all of the Client Server protocol works between the NodeMCUs and Processing, and when any device crashes, or disconnects, the server handles it appropriately.\
\
-- How it works\
\
Processing divides an image into quadrants and figures out what color is in the quadrant and then sends a value based on that in which the NodeMCU uses that data in a Blink without Delay- like code to change the frequency of the speaker sound.
\
-- The image division algorithm (Just because this is probably going to be useful for someone)\
\
This algorithem divdes a screen appropriately for whatever value you input into it-- IT TOOK A LOT OF FIDDLING TO GET IT hahahaha\
\
--Note, this is formatted for processing\
--(vertical divisions)\
VD = floor(sqrt(INPUT));\
--(horizontal divisions)\
HD = ceil(float(numOfClients)/float(vertDiv));\
--(Quadrant Hight)\
h = imageHeight/VD\
--(Quadrant Width)\
if(index > (INPUT-1) - (INPUT - (VD-1)*HD) && (Math.pow(sqrt(INPUT), 2) != INPUT))\
                                           -- This is just checking if it can be divided properly\
__Only if its not the last row and when the rows can't be divided evenly__\
w = imageWidth/HD\
y = ((index)/horzDiv)* h;\
x = ((index)%horzDiv)* w;\
__When it is the last row and when the rows can't be divided evenly__\
w = width/tmp;\
y = (vertDiv-1)* h;\
x = ((index)%tmp)* w;\

##Images
--Here's a public link to the images

https://drive.google.com/open?id=1_Mve0WLCncdUbX0UKpXfA79t_zzXzVSZ





