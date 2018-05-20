# Chat Commands

CD supports certain global chat incantations that will make it display or modify aspects of its configuration on the fly.

These commands all start with the string **"!cd"**.

#### How Chat Commands Work

Chat commands may be issued at any time CD is loaded: in the warmup session before a game starts, during a wave, during trader time, or after a game has ended.

Every chat command belongs to exactly one of two categories: `CDAUTH_READ` or `CDAUTH_WRITE`.  An example of a `CDAUTH_READ` command is **"!cdmaxmonsters"**, which prints the current MaxMonsters setting.  An example of a `CDAUTH_WRITE` command is **"!cdmaxmonsters 36"**, which sets MaxMonsters to 36.

`CDAUTH_WRITE` commands apply immediately when issued outside a wave (i.e. in pregame warmup, trader time, or after a game has ended).  However, when a `CDAUTH_WRITE` command is issued mid-wave, it delays application via a mechanism called "staging".  This means the command writes your modification to temporary storage without applying it to the live game configuration.  It immediately responds with a string like "Staged: MaxMonsters=36".  As soon as the wave ends -- either due to the trader opening, the team winning, or the team dying -- your changes are applied, and CD displays a reminder notification displaying the option name and the new value that it has just copied from temporary storage to the live game configuration.

`CDAUTH_READ` commands always respond immediately.  `CDAUTH_READ` commands are aware of the staging mechanism.  If a `CDAUTH_READ` command is issued mid-wave after relevant configuration writes have been staged, it will report both the actual and staged values.

#### Configuring Chat Command Access on Servers

In server mode, the INI option `DefaultAuthLevel` controls what anonymous users may do by default using chat commands.

If `DefaultAuthLevel` is set to `CDAUTH_WRITE`, then any user may run any command.  This is intended for private servers where all users are trusted.

If `DefaultAuthLevel` is set to `CDAUTH_READ` (the default), then anonymous users may only run commands that read the configuration.  They cannot run chat commands that modify the configuration.
However, a user whose SteamID is listed in any of one or more optional `AuthorizedUsers` lines may run any command, including those that modify the configuration.

Here's a config snippet illustrating how `DefaultAuthLevel=CDAUTH_READ` works with `AuthorizedUsers`.  This snippet authorizes two users to run any chat command.  Anyone besides the two listed users can run chat commands that read the configuration, but not those that would modify it.

```
[ControlledDifficulty.CD_Survival]
DefaultAuthLevel=CDAUTH_READ
AuthorizedUsers=(SteamID="STEAM_0:0:3691909",Comment="blackout")
AuthorizedUsers=(SteamID="STEAM_0:1:3472411",Comment="Tiger")
```

The AuthorizedUsers line may appear as many times as needed. Each line specifies one SteamID (which can be found with a tool like http://steamidfinder.com/) https://steamid.io and an arbitrary comment. The comment field can be any text you want. It's just there so that you know who each steam id belongs to should you ever want to remove someone or see if they are already on the list.

#### Chat Commands are Always Accessible in Solo

Playing CD solo automatically and unconditionally enables all chat commands, both `CDAUTH_READ` and `CDAUTH_WRITE`.  There's no need to edit your KFGame.ini to configure `DefaultAuthLevel` or `AuthorizedUsers` if you just want to use chat commands in solo mode.

Most chat commands will display their respective option's current value if you do not specify an argument with them. For example: !cdmm will list the current maxmonsters value. If you want to set the max monsters, you will have to put a space after the command followed by an appropriate value. EG: "!cdmm 48" will set max monsters option to 48. Anyone with CDAUTH_READ (Basically everyone) can see the value of an option by typing it without an argument. However, most options can only be changed by players with CDAUTH_WRITE permissions.

### !cdalbinoalphas <true|false>

*Description:*
Controls whether albino alphas can spawn.

Setting this to true allows albino alphas to spawn normally. The meaning of "normally" depends on the SpawnCycle. If SpawnCycle=unmodded, the albino alphas spawn by pure chance, the way TWI does it in vanilla KF2. If SpawnCycle is not unmodded, then albino alphas will spawn according to the SpawnCycle.

If the configured SpawnCycle has no albino alphas, then none will spawn even if this option is set to true. false prevents albino alphas from spawning at all. Even if the SpawnCycle mandates albino alphas, they will not spawn when this is false.

### !cdalbinocrawlers <true|false>

*Description:*
If set to true albino crawlers(Gas Crawlers) will be permitted to spawn if set in the cycle, and if set to false they will be replaced with another zed should they exist in the spawncycle. The general function of this option is similar to the way albino alpha setting works.

### !cdalbinogorefasts <true|false>
*Description:*
If set to true Gorefiends will be permitted to spawn if set in the cycle, and if set to false they will be replaced with another zed should they exist in the spawncycle. The general function of this option is similar to the way albino alpha setting works.

### !cdallhpfakes <int>
*Shorthand:* !cdahpf

*Description:*
This sets HP fakes for Trash, Scrakes, Quarterpounds, Fleshpounds, and Boss at once to the same value with one command. 

### !cdautopause <true|false>
*Shorthand:* !cdap

*Description:*
If set to true either in config or via chatcommand, and the end of a wave, CD will autopause the trader and set the remaining trader time to 5 seconds. Once unpaused, countdown will resume from 5 seconds and cannot be halted.

If set to false, normal countdown will occur and trader time's length will be dependant upon it's configured setting.

### !cdboss <volter|patriarch|kingfp|abom|random|unmodded>
*Description:*
Optionally controls which boss spawns, if and when the boss wave arrives.

* "hans" or "volter": forces the hans boss to spawn if/when the boss wave comes
* "pat", "patty", or "patriarch": forces the patriarch boss to spawn if/when the boss wave comes
* "KingFP" or "KFP": forces the King Fleshound boss to spawn if/when the boss wave comes
* "Abom" or "KingBloat" forces the Abomination boss to spawn if/when the boss wave comes
* "random" or "unmodded": choose a random boss when the time comes (unmodded game behavior)

### !cdbosshpfakes <ini|bilinear;|int>
*Shorthand:* !cdbhpf

*Description:*
Sets HP Fakes for Boss. Health increase is exponential up to 6 and linear after 6. If used without an argument, this command will display the current value. Accepted value range is 0-32.

### !cdcohortsize <ini|bilinear;|int>
*Shorthand:* !cdcs

*Description:*
This sets the maximum number of zeds that CD's SpawnManager may spawn simultaneously (i.e. on one invocation of the SpawnManager's update function).

When CohortSize is positive, CD's spawnmanager spawns as many squads as necessary until either CohortSize zeds have spawned on that attempt, the MaxMonsters limit is reached, or the map's available spawnvolumes have been filled. CD will use as many of the map's spawnvolumes as necessary to spawn the cohort, iterating from most to least preferred by spawnvolume-preference-score. On larger maps (e.g. Outpost), this makes it possible to spawn something like 64 zeds instantaneously.

For example, let's say CohortSize=12. Let's also say that no zeds are currently alive, that MaxMonsters=20, and that the SpawnCycle dictates squads with alternating sizes 4, 5, 4, 5, etc. When the spawnmanager next wakes up, it will spawn the first squad of 4 zeds at the most-preferred spawnvolume, the next squad of 5 zeds at the second-most-preferred spawnvolume, and the first 3 of 4 zeds in the third squad at the third-most-preferred spawnvolume. The 1 zed leftover from the final squad goes into LeftoverSpawnSquad and becomes a new singleton squad that attempts to spawn on the following spawnmanager wakeup, just like in vanilla KF2. All three squads just described appear to spawn simultaneously from the player point of view; a "spawnmanager wakeup" is effectively instantaneous to us.

If this is set to 0, then the cohort spawn logic is inactive, and the game instead spawns one squad per invocation of the update function. That behavior (i.e. when set to 0) is how unmodded KF2 works: the spawn manager creates one squad per attempt, no matter how much headroom might exist under the MaxMonsters limit, or how many eligible spawnvolumes might be available to accomodate more squads

### !cdCountHeadshotsPerPellet <True|False>
*Shorthand:* !cdchspp

*Description:*
This option changes the way headshots are counted for cdmystats and cdstats output. If true every single pellet from multi-pellet weapons like the af2011a1's, shotsguns, and hx25 are counted individually. This behavior is how GameConductor typically counts them. If set to false, they're counted on a per-shot basis- like the end of match awards screen shows.

### !cdEnableReadySystem <true|false>
*Shorthand:* !cders

*Description:*
If set to true, the ready system and ready/unready commands will be Enabled. If set to false, they will be disabled. Please note that autopause has a separate setting to turn on and off.

### !cdFakesMode <add_with_humans|ignore_humans>
*Shorthand:* !cdfm

*Description:*
This controls how the values of the WaveSizeFakes, BossHPFakes, FleshpoundHPFakes, ScrakeHPFakes, and TrashHPFakes settings interact with the human player count. If set to "add_with_humans", then the values of various fake options are added to the human player count value. For example, playing solo long with WaveSizeFakes=1 results in the first wave having 85 zeds. If set to "ignore_humans", then only the value of a specific fakes option is considered in its context, and the human player count value is ignored. For example, setting "ignore_humans" and WaveSizeFakes=2 is equivalent to setting "add_with_humans" and playing solo with WaveSizeFakes=1. If this is set to "ignore_humans" and any fake option is set to zero, then that option is treated as though it had been set to one instead.

### !cdFleshpoundHpFakes <ini|bilinear;|int>
*Shorthand:* !cdfphpf

*Description:*
Sets the number of faked players used for determining fleshpound health.

### !cdfleshpoundragespawns <true|false>
*Shorthand:* !cdfprs

*Description:*
if set to true, fleshpounds can spawn raged. If set to false, spawnraged fleshpounds do not occur.

### !cdinfo <full|abbrev>
*Description:*
Displays abbreviated CD settings info in chat, or full info in command prompt. If used without an argument this command will display the abbreviated info in chat.

### !cdmaxmonsters <ini|bilinear;|int>
*Shorthand:* !cdmm

*Description:*
Sets the maximum monsters allowed on the map at one time. In the vanilla game, this is 12 when in NM_StandAlone(solo) and GetLivingPlayerCount() == 1. The vanilla game's default is 32 in any other case (such as when playing alone on a dedicated server).
If this is set to a nonpositive value, then the vanilla behavior prevails.
If this is set to a positive value, then it is the number of maximum monsters allowed on the map at one time.

### !cdmystats
*Shorthand:* !cdms

*Description:*
Displays your stats for the current match. Listed stats include:

* Dosh Earned
* Large Kills
* Heals given
* Heals Received
* Damage Dealt
* Damage Taken
* Shots Fired
* Shots Hit
* Accuracy (Calculated at % of shots hit)
* Headshots
* Headshot Accuracy (Calculated as % of hits that were headshots)

### !cdpausetrader
*Shorthand:* !cdpt

*Description:*
Pauses TraderTime countdown. If used at exactly 30 seconds or exactly 10 seconds the game may play trader voicelines constantly until unpaused. Trader-time countdown timer is client-side so you may wish to avoid pausing within 1-2 seconds of these two numbers.

### !cdready
*Shorthand:* !cdr

*Description:*
Readies up for the next wave. CD will automatically unpause the trader once all players are readied up.

### !cdscrakehpfakes <ini|bilinear;|int>
*Shorthand:* !cdschpf

*Description:*
Sets the HP fakes for Scrakes.

### !cdspawncycle <ini|name_of_spawn_cycle|unmodded>
*Description:*
Sets the SpawnCycle to be used for determining zed spawns. If used without an argument, this command will display the current value. unmodded will use the vanilla KF2 spawncycle.

The list of available SpawnCycle Presets included with this version of CD is as follows:
* albino_heavy
* asl_v1
* basic_heavy
* basic_light
* basic_moderate
* dtf_v1
* gso_v1
* nam_poundemonium
* nam_pro_v1
* nam_pro_v2
* nam_pro_v3
* nam_pro_v4
* nam_pro_v5
* nam_pro_v5_plus
* nam_semi_pro
* nam_semi_pro_v2
* rd_kta
* rd_odt
* rd_sam

### !cdspawnmod <ini|bilinear;|float>
*Shorthand:* !cdsm
*Default:* 1.0

*Description:*
The forced spawn modifier, expressed as a float between 0 and 1. 1.0 is KFGameConductor's player-friendliest state. 0.75 is KFGameConductor's player-hostile state. Below 0.75 is spawn intensity unseen in the vanilla game.

Setting zero means the SpawnManager will try to spawn zeds every single time it is awoken (SpawnPoll controls how often it is awoken). It will only fail to spawn zeds if either the MaxMonsters limit is reached, if the entire wave's worth of zeds has already spawned, or if the map's spawn volumes are so congested that new zeds physically cannot be spawned without failing a collision check (zeds inside other zeds).

Setting zero nullifies any spawn interval multiplier built into the map. It also nullifies the sine-wave delay system TWI built into vanilla KF2, and any early wave or difficulty-related delays. When this is zero, the only timing variables that matter are SpawnMod, and, to a limited extent during zed time, ZTSpawnSlowdown.

This does not affect SpawnPoll. SP controls how often the SpawnManager wakes up. This setting influences whether the SpawnManager does or does not attempt to spawn zeds when it wakes up (along with some other factors, like early wave modifiers, the presence of a leftover spawn squad, the map's baked in spawn interval modifier, and a sinewave mod that Specifically, this goes into calculation of TimeUntilNextSpawn, which is a bit like SpawnManager marking its calendar with the soonest possible next spawntime.

### !cdspawnpoll <int>
*Shorthand:* !cdsp
*Default:* 1.0

*Description*
The timer interval, in seconds, for CD's SpawnManager's update function. The update function first checks several state variables to determine whether to attempt to spawn more zeds. If it determines that it should spawn zeds, the function then starts placing squads on spawner and/or spawnvolume entities. In the vanilla game, this is hardcoded to one second.

### !cdstats <stat name>

*Description:*
displays an ordered list specific stats for all connected players
accepted stat names:
* Accuracy
* DoshEarned
* DamageDealt
* DamageTaken
* HealsGiven
* HealsReceived
* Headshots
* HeadShotAccuracy
* LargeKills
* ShotsFired
* ShotsHit

### !cdtrashhpfakes <ini|bilinear;|int>
*Shorthand:* !cdthpf

*Description:*
Sets HP Fakes for trash zeds (Crawlers, Clots, Cysts, Sirens, Bloats, Gorefasts, Gorefiends, Husks, etc). If used without an argument, this command will display the current value.

### !cdunpausetrader
*Shorthand:* !cdupt

*Description:*
Unpauses TraderTime countdown.

### !cdunready
*Shorthand:* !cdur

*Description:*
Marks yourself as unready for next wave. This is done automatically for you at the end of each wave, however- if you've previously readied up during trader-time and decide you need a little longer- this will come in handy.

### !cdversion
*Description:*
Displays active version of the Controlled Difficulty mutator.

### !cdwaveendsummaries <true|false>
*Shorthand:* !cdwes

*Description:* if set to true, CD will display spawn summaries at the end of each wave. If set to false, CD will not show this information at the end of the wave.

### !cdwavesizefakes <ini|bilinear;|int>
*Shorthand:* !cdwsf

*Description:* Increases zed count (but not hp) as though this many additional players were present. The game normally increases dosh rewards for each zed at numplayers >= 3, and faking players this way does the same. You can always refrain from buying if you want an extra challenge, but if the mod denied you that bonus dosh, it could end up being gamebreaking for some more difficult settings. In short, WaveSizeFakes increases both your budget and the zed count in each wave.

### !cdweapontimeout <int seconds, "max", or "unmodded"/-1>
*Description:*
Sets weapon timeout in seconds. If used without an argument, this command will display the current value.

### !cdwho
*Description:*
Displays the names and states of connected players. Spectators will be listed with an S. Players that are Readied up will be listed with an R. Players that are not readied up will be listed as _. During a wave Players that are alive will be listed with an L and dead players will be listed with a D.

### !cdzedsteleportcloser <true|false>
*Shorthand:* !cdztc

*Description:* If true, zeds can teleport closer to humans, if false, zeds will only teleport closer if they're stuck. If used without an argument, this command will display the current value.

### !cdztspawnmode <clockwork|unmodded>
*Description:*
Controls how the spawn manager does (or doesn't) react to zed time. "unmodded" makes it run as it does in the vanilla game. This means that the spawn manager wakeup timer is destroyed every time zed time starts or is extended. This can result in extremely long spawn lulls after zed time if SpawnPoll is long (e.g. 20 seconds). "clockwork" prevents the spawn manager wakeup timer from being destroyed every time zed time starts. "clockwork" also applies ZTSpawnSlowdown to the spawn manager timer's dilation factor. "clockwork" effectively makes the spawn manager's timer run ZTSpawnSlowdown times slower than real time. If ZTSpawnSlowdown is 1, then the spawn manager's timer is immune to the effects of zed time. If ZTSpawnSlowdown is greater than 1, then the spawn manager runs that many times slower than a real-world clock when zed time is in effect.

### !cdztspawnslowdown <ini|bilinear;|float>
*Default:* 1.0
*Description:*
This option is only meaningful when ZTSpawnMode is set to clockwork. If ZTSpawnMode is not set to clockwork, then this option is effectively ignored.

If ZTSpawnSlowdown is 1, then the timer is not dilated, which means that the spawn manager continues to wakeup every SpawnPoll (in real
seconds). This means zed time does not slow down or speed up spawns in real terms at all.

When ZTSpawnSlowdown is greater than 1, the spawn manager wakeup timer is dilated to make it run that many times slower than a real-world clock.

It takes floating point values. For example, say ZTSpawnMode is set to clockwork, ZTSpawnSlowdown is set to 2, SpawnPoll is set to 5, and SpawnMod is set to 0. The spawn manager wakes up and spawns some zeds. Zed Time starts one millisecond later. Zed-Time lasts 4 real seconds. The spawn manager perceives these 4 real seconds as only 2 seconds due to ZTSpawnSlowdown=2. Zed time ends. An additional 3 seconds elapse in normal time, and the spawn manager wakes up again. In all, 7 seconds elapsed between spawn manager wakeups in this example. 
