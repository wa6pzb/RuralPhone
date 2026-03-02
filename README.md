# RuralPhone
This project documents the construction of an adapter to convert a standard telephone to a rural "bridged" telephone.

## Why?
it can be used for:
* Small camp-out between friends
* Adhoc disaster emergency communication link
* Other out-door events wanting simple reliable communication (e.g. festivals, etc.)
* Amateur Radio field day setups
* Fun with telephones for young and old

## Background
Common telephones (made between 1950's to 2000's) that can still be found today needed a direct connection to a telephone office to work. 
This connection to a central office used what is called a Common Battery (CB).
This project attempts create a hardware adapter to connect these telephones together in a simple way that is portable and does not require a central office and no changes to the telephone.
Early telephones (cica 1900's) contained what was called a Local Battery (LB) and a hand cranked generator (used for ringing another telephones) [^1].
These early telephones where used in rural areas and were all connected to one line (with 2 to 12 or more) on a party line.
The party line system makes it easy since you just need one set of wires strung between all the locations.
The adapter needs to convert the telephones from CB to LB and provide a way to "ring".


## Basic Features
* Use of the Raspberry Pi Pico MCU
* Use of MMBasic as the development environment
* Battery operation

### Functions

#### References

[^1]: Page 64, Old-Time Telephones (Ralph O. Meyer), https://repository.lib.ncsu.edu/bitstreams/f2b7ec52-1d8a-4e4a-8e35-b7af1cdf8d62/download
