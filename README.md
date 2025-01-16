# zackAPI
An API for figura to play sounds while you type

Here is a link to a website with sounds from the game
https://www.digminecraft.com/lists/sound_list_pc.php

if you want a custom sound just put the name of the file 

There are three differnet typing functions:
-> The first is regular typing, which includes numbers, letters and symbols in when chat is open
-> The second is playing a seperate sound when you press enter
-> The third is playing a seperate sound when you press backspace

Below is what you need in your script:
```
local zackapi = require("zackAPI")

zackapi.typing(
    "", --sound played when you type
    nil, --the volume of the sound
    nil, --the pitch of the sound
    nil --delays the sounds, for example plays every 5 ticks, 10 ticks, etc. must be in ticks
)

zackapi.enter(
    "", --sound played when you type
    nil, --the volume of the sound
    nil, --the pitch of the sound
)

zackapi.backspace(
    "", --sound played when you type
    nil, --the volume of the sound
    nil, --the pitch of the sound
)
```
