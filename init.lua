_G.newmoon = require("fileloading")
function newmoon.texture.new(name) return name end
function newmoon.loadmod(modname) require("mods."..modname) end
require("mods")
for modid,mod in newmoon.mod.mods do
    for id,tile in mod.tiles do
        tile.init.voxel()
        minetest.register_node(id,{tiles=tile.texture})
    end
end