SITU-SOL
========

SITU-SOL is a programming environment for 6502-based computers that was
written by hand during RetroChallenge 07/2015.

For more information, see the [Bootstrap Zero](http://bootstrap-zero.tumblr.com/)
blog (you might want to go to its [archive](http://bootstrap-zero.tumblr.com/archive)
and read the posts in chronological order.)

Supporting tools
----------------

This repository contains the following supporting tools, written in BASIC:

*   `binloader`, the first version of the simulated bit-entering facility,
    used in the warm-up
*   `frontpanel`, the improved version of the front-panel simulator,
    used to enter SITU-MON

BASIC sources for these are in `src`; the tokenized PRG files are in `bin`.

Note that these programs begin writing to memory at $8100, which is normally
inside the memory range that BASIC will also use — thus you are in danger of
BASIC overwriting what you enter with its own variable data.  So, to safely
run either of these programs, you should do something like this:

    POKE 56,128:NEW
    LOAD "FRONTPANEL",8
    RUN

Memory images
-------------

*   `situ-mon` is a PRG file containing a dump of what memory $8100-$81FF
    looked like just after SITU-MON was entered and fixed.  You can run
    it from BASIC immediate mode like so:

        LOAD "SITU-MON",8,1
        SYS 33024

*   `situ-sol` is a PRG file containing a dump of what memory $8100-$8520
    looked like just after SITU-SOL was entered and fixed.  It also includes
    SITU-MON — because SITU-SOL calls routines from it — and 256 bytes of
    almost-unused code between $8200 and $82FF.

    It can be started from BASIC immediate mode like so:

        LOAD "SITU-SOL",8,1
        POKE 2304,0:SYS 33830

    But!  There is no symbal table.  (The `POKE 2304,0` is to stop SITU-SOL
    from mistakenly behaving as if there's a symbal table at that address,
    in case that byte isn't zero.)  You may wish to load a symbal table
    first, but I haven't got one handy, yet.

Other things
------------

This repository might, at some point, also contain text files containing
disassembled machine code that was entered.
