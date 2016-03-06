local lfs = require("lfs")
local file = require("file")
local sep = "/"
function copy(folder,to)
    print("copy folder "..folder)
    for fname in lfs.dir(folder) do
        if lfs.attributes(folder..sep..fname).mode == "folder" then copy(folder..sep..fname)
        else
            print("copy file "..fname)
            file.copy(folder..sep..fname, to..sep..string.gsub(folder,sep,"_").."_"..fname)
        end
    end
end
for fname in lfs.dir("mods") do
    if fname ~= "." and fname ~= ".." and fname ~= "init.lua" then
        copy("mods"..sep..fname..sep.."assets"..sep.."textures","textures")
    end
end