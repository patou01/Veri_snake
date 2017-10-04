# Veri_snake
Verilog code to run a basic snake game on a terasic DE0-nano using the FPGA4u shield.
It can be seen in test on [Youtube][yt].

## Introduction
I wrote this when learning HDL out of curiosity. In 2nd year we were given an assignment for which we had to make a snake game using logic gates on Simulink, so I thought it'd be fun to do it in Verilog now.
It is made to run on a [Terasic DE0-Nano][Terasic] with an [FPGA4u][FPGA4u] shield.

You can find the required source files in this repo.
This is a very basic version, I might have butchered the logic here and there, and it is far from perfect code. It was learnt and done in less than 2 weeks.

## Modules

### Top level
The top level, with inputs/outputs and blocks has been defined with a block diagram. It doesn't require much presentation.


### Screen driver
The screen works with 8 rows and 12 columns (96 leds). All LEDs are RGB. They are all driven in red out of laziness.
It is a basic multiplex screen, therefore it is pulsed at high frequency.

### Controls
The joystick is used as control. It provides with 5 buttons, but only 4 are used (the central button is ignored).
The direction module converts these 4 inputs to a 2 bit coded direction. 

### Snake
This module is in charge of moving the snake, checking for collisions, and signalling when the snake is dead.
The snake is coded on an array of 16x7 bits. This allows a maximum size of 16 parts. This is inherent to the fact I only had 4 bits of display for the points.
Each part of the snake is coded as [on/off,x,y]. x and y are on 3 bits, limiting the size of the map to 8x8, instead of the 8x12 the matrix provides.

### Reset
The button 0 is tied to a reset. It puts the snake back in the middle and resets the score.

### Food generator
The food generator generates a coordinate for the food everytime the head of the snake reaches the existing food. 
It generates a pseudo-random coordinate using the clock. 
A counter increments at 50MHz, and the last 6 bits are used as [x,y]. Since it is unlikely that a player repeats exactly his input sequences, this is, in fact, a random generator.

### Point counter
When the head of the snake reaches the food, this increments a counter.


## Issues
### Input bouncing
Maybe the joystick should be debounced, sometimes the snake doesn't seem to go in the right direction.

### Sudden death
It's hard to tell with the colors, but it feels like the snake sometimes dies when it shouldn't have had issues.

## Future tasks
### Colors
It's a bit hard to see where the food is compared to the snake as everything is red. Maybe make it blue. This requires editing the screen driver to feature all colors.


## Thanks
I'd like to thank the [LAP][LAP] for lending those boards to [Robopoly][Robopoly], allowing me to have access to this hardware.


## Licences
I don't care too much, but some say you should, so I just typed in "which licence should I use" on Google which said MIT. So here goes.

MIT License

Copyright (c) 2017 Patrick Bobbink

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 


[yt]: https://youtu.be/IqZj8MK-kns "Youtube"
[FPGA4u]: https://fpga4u.epfl.ch "fpga4u"
[LAP]: https//lap.epfl.ch "LAP"
[Terasic]: https://www.terasic.com.tw/cgi-bin/page/archive.pl?CategoryNo=139&No=593 "Terasic"
[Robopoly]: https://robopoly.epfl.ch "Robopoly"
