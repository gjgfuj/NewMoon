local lfs = require("lfs")
local sep = "/"
local file = {}
-- ### file.read
--
-- Return the content of the file by reading the given `path` and `mode`.
--
-- - `path` is a string.
-- - `mode` is a string.
--
function file.read(path, mode)
    mode = mode or '*ab'
    local file, err = io.open(path, 'rb')
    if err then
        error(err)
    end
    local content = file:read(mode)
    file:close()
    return content
end

-- ### file.write
--
-- Write to the file with the given `path`, `content` and `mode`.
--
-- - `path`    is a string.
-- - `content` is a string.
-- - `mode`    is a string.
--
function file.write(path, content, mode)
    mode = mode or 'wb'
    local file, err = io.open(path, mode)
    if err then
        error(err)
    end
    file:write(content)
    file:close()
end

-- ### file.copy
--
-- Copy the file by reading the `src` and writing it to the `dest`.
--
-- - `src`  is a string.
-- - `dest` is a string.
--
function file.copy(src, dest)
    local content = file.read(src)
    file.write(dest, content)
end
function copy(prefix,name,ofolder,to)
    local folder = prefix..sep..ofolder
    print("copy folder "..folder)
    for fname in lfs.dir(folder) do
        if fname ~= "." and fname ~= ".." then
        if lfs.attributes(folder..sep..fname).mode == "directory" then copy(prefix,name,ofolder..sep..fname,to)
        else
            print("copy file "..fname)
            file.copy(folder..sep..fname, to..sep..name..string.gsub(ofolder,sep,"_").."_"..fname)
        end
        end
    end
end
lfs.mkdir("textures")
for fname in lfs.dir("mods") do
    if fname ~= "." and fname ~= ".." and fname ~= "init.lua" then
        copy("mods"..sep..fname..sep.."assets"..sep.."textures",fname,"","textures")
    end
end