local vector = {}
local vectormeta = {}
vectormeta.__index = vectormeta
function vectormeta:__add(v)
    local nv = {}
    for k,val in ipairs(self) do
        nv[k] = v[k]+val
    end
    return nv
end
function vectormeta:__unm()
    local nv = {}
    for k,val in ipairs(self) do
        nv[k] = -val
    end
    return nv
end
function vectormeta:__eq(t)
    for k,val in ipairs(self) do
        if t[k] ~= val then return false end
    end
    return true
end
function vectormeta:__mul(s)
    local nv = {}
    for k,val in ipairs(self) do
        nv[k] = val*s
    end
    return nv
end
function vectormeta:__div(s)
    local nv = {}
    for k,val in ipairs(self) do
        nv[k] = val/s
    end
    return nv
end
vector.metatable = vectormeta
local function vectornew(_,v)
    setmetatable(v,newmoon.vector.metatable)
    return v
end
newmoon.vector = vector
setmetatable(vector,{__call=vectornew})
local world = {}
---Context specific world objects.
world.sides = {}
world.tilesize = vector({16,16}) --- The size of a world tile, in pixels, for the game.
function world:init(texture) --- called when a thing texture is available.
    if newmoon.const.worldtype == "voxel" then
        self.sides.y_pos = newmoon.vector({0,1,0})
        self.sides.y_neg = newmoon.vector({0,-1,0})
        self.sides.x_pos = newmoon.vector({1,0,0})
        self.sides.x_neg = newmoon.vector({-1,0,0})
        self.sides.z_pos = newmoon.vector({0,0,1})
        self.sides.z_neg = newmoon.vector({0,0,-1})
    elseif newmoon.const.worldtype == "side" or newmoon.const.worldtype then
        self.numtiles = newmoon.vector(texture.size)/self.tilesize
    end
end
---Required implementation here:
---world.get(v) -- gets object at a v relative to the current object.
---world.set(v,thing) -- sets thing at a v relative to the current object.
---world.pos -- 3d(in 2d space) or 4d(in 3d space) vector, absolute position then a world identifier.
newmoon.world = world
return world