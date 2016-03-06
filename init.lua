local oldpackagepath = package.path
local modpath = minetest.get_modpath("newmoon")
package.path = modpath.."/?.lua;"..modpath.."/?/init.lua;"..oldpackagepath
_G.newmoon = require("fileloading")
newmoon.texture = newmoon.helper.optionaltable("newmoon.texture")
function newmoon.texture.new(name) return string.gsub(name,"/","_"):gsub(":","_")..".png" end
function newmoon.loadmod(modname) require("mods."..modname) end
require("mods")
for modid,mod in pairs(newmoon.mod.mods) do
    for id,tile in pairs(mod.tiles) do
        tile.init.voxel(tile)
        print(tile.texture)
        minetest.register_node(":"..modid..":"..id,{tiles=tile.texture})
    end
end