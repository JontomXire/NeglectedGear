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

Syntax: `/bg test <item ID>`

This is a test/debug command that will give the value of an item without needing to have the item link available.

Not currently implemented.

## TODO:
* Import stat weightings.
* Implement individual gear scoring.
* Implement item test scoring.
* Implement UI modification to display item scores.
* Implement item scoring across raid.
* Implement dialogue to list item scores across raid, filtering out players who cannot/should not use item.
* Implement full character gear scoring.
* Implement UI modification to display full character gear score
* Modify individual gear score to account for existing gear.
* Modify raid scoring and display.
* Modify gear scoring to calculate actual and potential gemming:
  * Optimise across all sockets rather than evaluating item by item.
* Modify gear scoring to calculate actual and potential enchants.

## Optional extra features:
* Raid/party check to ensure
  * Everyone has the addon and it is up to date.
  * No-one has PvP gear.
  * Everyone has full enchants.
  * Everyone has full gemming.
* Suggest gemming and enchants.
* Allow off-spec scoring - very hard unless player equips offspec gear.

