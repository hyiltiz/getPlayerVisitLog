#! /bin/bash
# Extract player login/logout information from a Don't Starve Together
# server debug logs, then parse it into a .csv spreadsheet file.
# This file is created to help maintain Strictly Professional servers.
# To use this file, nevigate to the server logs directory from using
# the terminal `cd` command. Use `ls` to check this directory contains
# two folders: "Master" and "Caves". Put this file there, and run it
# by command `./getPlayerVisitLog.sh`. You need to enable executable
# permissions when you first run it, by using the following command:
# chmod +x ./getPlayerVisitLog.sh
#
# Alternatively, you can place it anywhere you like in your system,
# then give it the directory mentioned above, like this:
# ./getPlayerVisitLog.sh "/home/artemiy/path/to/DST/server/logs/PRIV1/" output.csv


# Copyright 2017, hyiltiz <hyiltiz@gmail.com>
# Licensed under GNU GPLv3 or later.
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# set -x

# Use current direcoty, or the path specified
sedCMD="sed -E" # if necessary change this into `sed -r` in GNU/Linux systems and Git Bash (in Windows)
currentTime=$(date +%Y%m%d%H%M%S)

serverLogDirectory=${1:-`pwd`}
outFile0=$serverLogDirectory/"PVL"_${currentTime}.csv
outFile=${2:-$outFile0}

mapFile=$serverLogDirectory/User2KU_ID.csv

touch -f $outFile

# OSX BSD sed cannot match its own line ending \r
# So trying to match the following will each away
# characters from the beginning
# echo -en 'xxx abc\r\nxxx aa bb cc\r\n' | sed -E 's/xxx (.*)/\1->/g'
# abc->
# aa bb cc->
#
# This can be fixed by the following:
# echo -en 'xxx abc\r\nxxx aa bb cc\r\n' | tr -d '\r' | sed -E 's/xxx (.*)/\1->/g'
# abc->
# aa bb cc->


# raw PVL
find . -name 'server_log_*.txt' -exec cat '{}' \;| egrep '(\) disconnected from)|(Client authenticated)' | tr -d '\r' | $sedCMD 's/Client authenticated/JOIN/g; s/disconnected from/LEAVE/g; s/ \[Shard\]//g; s/\[(.{8})\]: JOIN: \((KU_.{8})\) (.*)/\1, Join, \2, \3/g; s/^\[(.{8})\]: \((KU_.{8})\) LEAVE (.*$)/\1, Leave, \2, USERNAME, \3/g' > $outFile


# Player ID <=> KU_ID
cat $outFile | grep -v 'Leave, KU_' | sed -E 's/.{8}, Join, (KU_.{8}), (.*)/\1, \2/g' | sort -u > $mapFile

# Fill in the Player ID into the server log
while read p; do
  KU_ID=$(echo $p | awk -F"," '{print $1}')
  userID=$(echo $p | awk -F"," '{print $2}')
  # echo $p
  # echo "+++" $KU_ID $userID "+++"
  $sedCMD -i .bak "s/(.{8}, Leave, $KU_ID,) USERNAME/\1 $userID/g" $outFile
done < $mapFile

sed -i .bak 's///g' $outFile
rm $outFile.bak

echo -e "PVL extraction successful! Check files:\n" $mapFile "\n" $outFile
