# NeglectedGear
WotLK addon for Neglect guild to help with gear and loot.

This addon scores gear according to a characters class and spec. The stat weightings are determined by the guild's officers. This allows raid leaders to determine who gets the most benefit from a loot drop and allocate it accordingly.

The gear scoring also allows players to evaluate their gear to help them decide how best to improve it.

## Slash commands

Syntax: `/ng <cmd> [options]`

### Send warning message

Syntax: `/ng warn <text>`

This is command will generate a warning message on your screen. It can be useful in macros.

### Test item scoring

Syntax: `/ng test <item ID>`

This is a test/debug command that will give the value of an item without needing to have the item link available.

## TODO:
* Modify dialogue to display: score delta, current item, username.
* Implement item scoring across raid.
* In dialogue for raid, filter out players who cannot/should not use item.
* Sort entries in raid dialogue by upgrade value.
* For rings and trinkets, have two comparison values.
  * Make valuation function return two parameters (value and difference) and calling function build string.
  * Detect ring and trinket socket by location value and run comparison twice. Can we avoid scoring the item twice? No. It will have two scores if it crosses a hit cap and the comparison objects have different amounts of the relevant stat. How do we display that neatly? Maybe just display best value and which slot it is compared to.
* Modify gear scoring to calculate actual and potential gemming:
  * Optimise across all sockets rather than evaluating item by item.
* Modify gear scoring to calculate actual and potential enchants.

## Optional extra features:
* Modify dialogue to display stat deltas.
* Implement full character gear scoring.
* Implement UI modification to display full character gear score
* When inspecting someone, make the scores relevant for their class and spec (if possible).
* Raid/party check to ensure
  * Everyone has the addon and it is up to date.
  * No-one has PvP gear.
  * Everyone has full enchants.
  * Everyone has full gemming.
* Suggest gemming and enchants.
* Allow off-spec scoring - very hard unless player equips offspec gear.

