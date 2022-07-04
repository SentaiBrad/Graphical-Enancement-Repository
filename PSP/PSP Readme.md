PPSSPP uses internal cheats so it's a bit more complicated than usual:

    Start the game.
    Go to Quick Menu > Options and at the bottom turn ON "Internal Cheats Support".
    Quick Menu > Close Content, launch the game again so it creates the cheats file then close the game again.
    It should've created retroarch/saves/PSP/Cheats/ULUS10297.ini (empty for now). Filename might be different, that's for the USA version.
    Go to the FFT:TWOTL cheats thread: https://forums.ppsspp.org/showthread.php?tid=9347
    Select and copy the whole "Code:" block.
    Open ULUS10297.ini with a text editor then paste the cheats.
    All the cheats are disabled by default, to enable them change _C0 at the beginning of the line to _C1 and save.

So for example if you want to enable "Infinite MP", in the .ini file replace

    _C0 Infinite MP

with

    _C1 Infinite MP

save the changes and launch the game, and you should have unlimited MP.
