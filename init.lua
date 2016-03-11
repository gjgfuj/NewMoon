local oldpackagepath = package.path
local modpath = minetest.get_modpath("newmoon")
package.path = modpath.."/?.lua;"..modpath.."/?/init.lua;"..oldpackagepath
_G.newmoon = require("fileloading")
newmoon.texture = newmoon.helper.optionaltable("newmoon.texture")
function newmoon.texture.anew(name) return newmoon.mod.currentmod.id.."_"..string.gsub(name,"/","_")..".png" end
function newmoon.texture.new(name)local a = newmoon.texture.anew(name) print(a) return a end
function newmoon.loadmod(modname) require("mods."..modname) end
require("mods")
for modid,mod in pairs(newmoon.mod.mods) do
    for id,tile in pairs(mod.tiles) do
        tile.init.voxel(tile)
        print(tile.texture)
        minetest.register_node(":"..modid..":"..id,{tiles=tile.texture})
    end
end