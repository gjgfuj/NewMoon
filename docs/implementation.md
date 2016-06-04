Newmoon Implementation Requirements
===================================

To implement the newmoon API:
* load fileloading.lua, modify with modules you require.
* implement texture API:
    `newmoon.texture.new(location,size)`, location is relative to modfolder/assets/textures
    -returns a table with `{loc=location, size=size}`, plus any other values needed to reference the texture.
* set newmoon.const.worldtype to voxel, side, or top.
* set newmoon.const.maxStackSize to the global maximum stack size of any inventory stack.
If side or top perspective:
* change newmoon.world.tilesize to reflect the size of the world tiles.

load all newmoon mods in mods folder - up to implementation where the mods folder is.
after loading of mods:
* iterate through list of mods in newmoon.mod.mods.
    * iterate through all tiles, objects, and items.
        * call thing.init.voxel/thing.init.side/thing.init.top depending on genre of game. Pass in thing as argument.
        * register thing in your game.
