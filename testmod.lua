local mod = newmoon.mod.create("testmod")
--noinspection UnusedDef
local testblock = newmoon.object.create({name="testBlock"})
function testblock.init:voxel()
    self.texture = newmoon.texture.new("testblock")
end
function testblock.init:side()
    self.sprite = newmoon.texture.new("testblock_side")
end
function testblock.init:top()
    self.sprite = newmoon.texture.new("testblock_top")
end
function testblock.callback:onUse()
    print("clicked!")
    local inventoryLeft = self.world:getAPI("left", newmoon.api.inventory)[1]
    local inventoryRight = self.world:getAPI("right", newmoon.api.inventory)[1]
    inventoryRight:insertItem(inventoryLeft:extractItem())
end
local testchest = newmoon.object.create({name="testChest"})
function testchest.init:voxel()
    self.texture = newmoon.texture.newTexture("testblock")
end
function testchest.init:side()
    self.sprite = newmoon.texture.newTexture("testblock_side")
end
function testchest.init:top()
    self.sprite = newmoon.texture.newTexture("testblock_top")
end
newmoon.api.inventory.install(testchest)
return mod