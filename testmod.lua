newmoon.mod.create("testmod")
local testblock = newmoon.block.new({name="testblock",onclick=function () print("hi!") end})
function testblock:voxel()
    self.texture = newmoon.texture.new("testblock")
end
function testblock:side()
    self.sprite = newmoon.texture.new("testblock_side")
end
function testblock:top()
    self.sprite = newmoon.texture.new("testblock_top")
end