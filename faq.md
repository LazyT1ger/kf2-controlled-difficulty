# Frequently Asked Questions

### How does Tiger's Build of CD relate to Blackout's CD, Skell's Faked Suite and Project One mods?

Blackout made Controlled Difficulty after P1 went unmaintained, but before Skell returned to make his Faked Suite. There was significant feature overlap, though some things are unique on each side. While both mods were good for a time, Skell has since removed the Faked Suite from the workshop. With Project One not maintained, Skell's FakedSuite removed, and Blackout busy with real life, currently ControlledDifficulty - Tiger's Build is the most actively maintained mutator that offers FakedPlayers functionality. This may change at some point in the future.

### Does CD modify my vanilla KF2?

No.  CD does not alter any files in your KF2 installation.  CD does not affect solo games that you start through the ordinary KF2 graphical user interface, and CD does not affect vanilla multiplayer games that you join.

CD's code is contained entirely in one file, `ControlledDifficulty.u`.  This file is downloaded into `<My Documents>\My Games\KillingFloor2\KFGame\Cache` when you subscribe to CD on the workshop or join a CD-enabled dedicated server.  However, even when this file is present, it is normally inactive and its contents are not loaded.  CD can only be loaded deliberately, by either starting a solo game using the `open <mapname>?Game=ControlledDifficulty.CD_Survival` console command (as described in [getting_started.md](getting_started.md)), or by joining a dedicated server running CD.  CD is automatically unloaded when you leave a CD-enabled game.

CD will save some of its settings to pair of separate subsections in your KFGame.ini file.  These sections are:

* `[ControlledDifficulty.CD_Survival]`
* `[ControlledDifficulty.CD_PlayerController]`

By saving its settings to only these sections, CD actively avoids touching settings that affect the vanilla game.

### Where can I get KF-Hillside?

Skell has removed Hillside from the workshop, and while it can still be downloaded by other means, it doesn't seem appropriate to list those here.

CD works with any map, not just Hillside. If you're looking for a good single lane- aim practice map, Kore's SubTheWub and  FatCat's Corridor are good alternatives to hillside.

### Can I level up my perks in CD?

No. Tripwire decided to prevent perk progression when the server is running any non-whitelisted modifications.
CD is not on TWI's whitelist. While playing CD, your perks will not persistently gain or lose XP.

### Why doesn't this work with the "FP Legs + Backpack Weapons" mutator?

CD doesn't work with https://steamcommunity.com/sharedfiles/filedetails/?id=679113913. At a minimum, that mutator appears to break CD's chat commands. For all I know, it breaks other things too; I haven't checked.

That mutator's description says that it 'is not compatible with mods that replace the pawn or controller such as ServerExt,' and CD does indeed subclass the player controller. I can only speculate as to what's going on here, because that mutator's source is, as best I can tell, closed. CD is open source.

### Will Blackout add these features to his CD?
I've been asked this a few times now and the simple answer is, I have no idea. What I do know is that he's been quite busy with life, and I must assume that's a good thing.

Personally, I would actually be quite happy if he merged my changes into his build completely outmoding mine in the process and leaving me free of the responsibility of maintaining and supporting it.

### Will you be adding anything else ?
I have a few more features in mind but setting aside the time to add them and having the will to do so is another thing entirely.

### Why'd you make this custom version?
This custom build actually came about off the cuff when Kore was asking for help with his cdautopause mutator and after rewriting one small function for him we were talking about the different ways he could go with it. I decided the best way to implement it would be to just add it to CD. With some talk about the old cdready suggestion- i figured if i was doing autopause I might as well do cdready too. Things have sort of spiraled out from there. It's funny really, starting this i had no plans to even compile it myself, much less release it to workshop.

### Can I use this for x?

While I did not ask permission to make this variant as I'm sure Blackout would've preferred in keeping with the standards he's set I've made sure the source is open and freely available and ask only that whatever you do with it, you do not use it for monetary gain. It would also be really awesome if you credited Blackout for the tremendous amount of time and energy he's put into making CD in the first place. If you're using something I've added to this version like AutoPause or stats, or the ready system, etc. in another mod- You can credit me too if you really want, but I don't require credit.

### Will you try to get TWI to whitelist this build of CD?

Absolutely not. While it might be possible if it were rewritten to forbid users from altering the game in a way that could make it easier than the vanilla game mode, I am of the mind that not only is full control better, but the mere concept of a whitelisted version of Controlled Difficulty being used on Perk Training maps and tarnishing CD's name absolutely disgusts me. I don't want to see CD or any variant of it whitelisted.

### Are all bugs still Blackout's fault, or are they Tiger's now?

As far as I'm concerned, everything is Tripwire's fault until proven otherwise. 
