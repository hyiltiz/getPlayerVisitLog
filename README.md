Your server is (occasionally) full of trolls, griefers and slurpers!? They did bad then disappeared so quickly you weren't able to catch them? Well, no more! With this, you can always see who logged into your server when with what Steam id (`KU` id), so you can, if you want, punish them by blacklisting, banning etc. Did you know that, if you want, you can also login as others once you know their `KU` id? After all, the server is yours and you are the true master of your own World. Well, nah, it is still Charlie.

This program does the following: 

Extract player login/logout information from a Don't Starve Together
 server debug logs (the *complicated* text that show up on the Console/Terminal screen when you run a Dedicated Server, which will also be saved as `server_log.txt` files), then parse them into two `.csv` spreadsheet files. One of those contain all those who ever joined your server, along with their `KU` id, and one that contains Player Visit Logs (PVL). 

 This file is created to help maintain Strictly Professional servers, but should work without modification on any Don't Starve servers.

 # Usage

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

It will create two `.csv` files at the server directory (it will tell you how to find them).

Back to logging in as other users. Once you figure out what a player's `KU` id is (by running the line above), you can log in as any user using [this](http://forums.kleientertainment.com/topic/77880-admin-login-as-previous-visiting-user/) trick mentioned in the forums.

# Compatibility
This program relies on utilities that are already present in your system if you are using GNU/Linux or OSX (or whatever new name they come up with next time). For Windows, you should install Git for Windows from [here](https://git-scm.com/download/win) so you can use this.
