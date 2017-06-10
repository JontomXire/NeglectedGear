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

This is a test/debug command that will show the UI for a specific item by numerical ID.

## Known issues:

* Sometimes addon errors occur. Last seen when a mage was enchanting a shield in the trade window.
* When evaluating rings, (NE) was reported for the second ring even though one was actually equipped.

## TODO:
* Investigate and fix known bugs.
* Differentiate between Feral DPS and Feral Tank.
* Differentiate between Blood DPS and Blood Tank.
* Make it so clicking on a player's name in the UI gives the item to that player.
* Modify gear scoring to calculate actual and potential gemming:
  * Optimise across all sockets rather than evaluating item by item.
* Modify gear scoring to calculate actual and potential enchants.

## Optional extra features:
* In dialogue for raid, filter out players who cannot/should not use item.
    Note that the API for this seems to be broken.
* Implement full character gear scoring.
* Implement UI modification to display full character gear score
* When inspecting someone, make the scores relevant for their class and spec (if possible).
* Raid/party check to ensure
  * Everyone has the addon and it is up to date.
  * No-one has PvP gear.
  * Everyone has full enchants.
  * Everyone has full gemming.
* Suggest gemming and enchants.
* Sort entries in raid dialogue by upgrade value.
* Allow off-spec scoring - very hard unless player equips offspec gear.

