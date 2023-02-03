local imports = {
    fileOpen = fileOpen,
    fileRead = fileRead,
    fileGetSize = fileGetSize,
    type = type,
};

local importer = {}

--[[
    NOTICE: Some modules may have dependency on other modules, be sure to load dependencies before!
]]
importer.modules = {
    ["async"] = { path = "async.lua" },
    ["class"] = { path = "class.lua" },
    ["table"] = { path = "table.lua" },
    ["lume"] = { path = "lumeUtils.lua" },
    ["check"] = { path = "check.lua" },
    ["overriden_functions"] = { path = "overriden_functions.lua"},
    ["useful_functions"] = { path = "useful_functions.lua"},
};

local contentsCache = {};

function readScriptFile(module)
    if (not module) or (imports.type(module) ~= "string") or (not importer.modules[module]) then
        return false;
    end
    local path = importer.modules[module].path
    local content
    if (not contentsCache[module]) then
        local file = imports.fileOpen(path, true)
        content = imports.fileRead(file, imports.fileGetSize(file))
        contentsCache[module] = content
        fileClose(file)
    else
        content = contentsCache[module]
    end
    return content
end

function import(whichPart)
    if (not whichPart) or (imports.type(whichPart) ~= "string") then return false; end
    return readScriptFile(whichPart)
end



