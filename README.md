Your server is full of trolls, griefers and slurpers!? They did bad then disappeared so quick you did not catch them? Well, no more! With this, you can always see who logged into your server when with what Steam id (`KU` id), so you can, if you want, punish them by blacklisting, banning etc.

This program does the following: 

Extract player login/logout information from a Don't Starve Together
 server debug logs (the *complicated* text that show up on the Console/Terminal screen when you run a Dedicated Server, which will also be saved as `server_log.txt` files), then parse them into two `.csv` spreadsheet files. One of those contain all those who ever joined your server, along with their `KU` id, and one that contains Player Visit Logs (PVL). 

 This file is created to help maintain Strictly Professional servers, but should work without modification on any Don't Starve servers.

 To use this file, navigate to the server logs directory using
 the `cd` command from the Terminal/Console. Use `ls` to check if this directory contains
 two folders: `Master` and `Caves`. Put this file there, and run it
 by command `./getPlayerVisitLog.sh`. You need to enable executable
 permissions when you first run it, by using the following command:

```BASH
chmod +x ./getPlayerVisitLog.sh
```

 Alternatively, you can place it anywhere you like in your system,
 then give it the directory mentioned above, like this:

```BASH
 ./getPlayerVisitLog.sh "/home/hyiltiz/path/to/DST/server/logs/PRIV1/" output.csv
```


### Copyright 2017, hyiltiz <hyiltiz@gmail.com>
Licensed under GNU GPLv3 or later. It basically means that you are free to do whatever you want with this program, as long as you pass along the same freedom to anyone who get it as well.
