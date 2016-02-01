local newmoon = require("fileloading")
local testmod = require("testmod")
local testBlock = newmoon.helper.copytable(testmod.objects.testBlock)
local leftChest = newmoon.helper.copytable(testmod.objects.testChest)
local leftChestInv = newmoon.api.inventory.get(leftChest)
local rightChest = newmoon.helper.copytable(testmod.objects.testChest)
local rightChestInv = newmoon.api.inventory.get(rightChest)
leftChestInv:insertItem("item")
leftChestInv:insertItem("item2")
testBlock.world = {}
testBlock.world.positions = {left=leftChest, right=rightChest}
function testBlock.world:getAPI(pos, api)return {api.get(self.positions[pos])} end
for k,v in ipairs(leftChestInv.inv) do print("left: "..k..":"..v) end
for k,v in ipairs(rightChestInv.inv) do print("right: "..k..":"..v) end
testBlock.callback.onUse(testBlock)
for k,v in ipairs(leftChestInv.inv) do print("left: "..k..":"..v) end
for k,v in ipairs(rightChestInv.inv) do print("right: "..k..":"..v) end
testBlock.callback.onUse(testBlock)
for k,v in ipairs(leftChestInv.inv) do print("left: "..k..":"..v) end
for k,v in ipairs(rightChestInv.inv) do print("right: "..k..":"..v) end