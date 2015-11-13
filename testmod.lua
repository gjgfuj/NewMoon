local mod = newmoon.mod.create("testmod")
local testblock = newmoon.block.new({name="testblock"})
mod.testblock = testblock
function testblock.init:voxel()
    self.texture = newmoon.texture.new("testblock")
end
function testblock.init:side()
    self.sprite = newmoon.texture.new("testblock_side")
end
function testblock.init:top()
    self.sprite = newmoon.texture.new("testblock_top")
end
function testblock.callback:onClick()
    print("clicked!")
    local inventoryLeft = self.world:getAPI("left", newmoon.api.inventory)
    local inventoryRight = self.world:getAPI("right", newmoon.api.inventory)
    inventoryRight:insertItem(inventoryLeft:extractItem())
end
local testchest = newmoon.block.new({name="testChest"})
mod.testchest = testchest
function testchest.init:voxel()
    self.texture = newmoon.texture.new("testblock")
end
function testchest.init:side()
    self.sprite = newmoon.texture.new("testblock_side")
end
function testchest.init:top()
    self.sprite = newmoon.texture.new("testblock_top")
end
newmoon.api.inventory.install(testchest)
return mod