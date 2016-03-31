local material = {}
material.prototype = {type="none",tool="mining",breakstrength=1,explosionstrength=1}
function material.new(matbase)
    local mbase = matbase or material.prototype
    local newmat = {__base=mbase}
    newmat.setmetatable({
        __index=function(table,key) return table.__base[key] end
    })
    return newmat
end

---All info described here allows for base info upon wrapping.

material.wood = material.new()
material.wood.type = "wood"
material.wood.tool = "cutting"

material.stone = material.new()
material.stone.type = "stone"
material.stone.tool = "mining"

material.metal = material.new()
material.metal.type = "metal"
material.metal.tool = "mining"
material.metal.breakstrength=2

material.hard = material.new()
material.hard.type = "hard"
material.hard.tool = "mining"
material.metal.breakstrength=3

material.dirt = material.new()
material.dirt.type = "dirt"
material.dirt.tool = "digging"

newmoon.material = material
return material