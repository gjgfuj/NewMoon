local oldpackagepath = package.path
package.path = minetest.get_modpath("newmoon").."/?.lua;"..minetest.get_modpath("newmoon").."/?/init.lua"..oldpackagepath
_G.newmoon = require("fileloading")
newmoon.texture = newmoon.helper.optionaltable("newmoon.texture")
function newmoon.texture.new(name) return name..".png" end
function newmoon.loadmod(modname) require("mods."..modname) end
require("mods")
for modid,mod in pairs(newmoon.mod.mods) do
    for id,tile in pairs(mod.tiles) do
        tile.init.voxel(tile)
        print(tile.texture)
        minetest.register_node(":"..modid..":"..id,{tiles=tile.texture})
    end
end