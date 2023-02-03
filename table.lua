local imports = {
    type = type,
    unpack = unpack,
    toJSON = toJSON,
    fromJSON = fromJSON,
}


--local table = class:create("table", table)

function table.length(tbl)
    if (imports.type(tbl) ~= "table") then return false end
    return #tbl;
end

function table.unpack(tbl)
    if (imports.type(tbl) ~= "table") then return false end
    return imports.unpack(tbl, 1, table.length(tbl))
end

function table.toJSON(tbl, compact, prettyType)
    if (imports.type(tbl) ~= "table") then return false end
    if (compact == nil) then compact = false; end
    if (prettyType == nil) then prettyType = "none"; end
    return imports.toJSON(tbl, compact, prettyType)
end

function table.fromJSON(value)
    return imports.fromJSON(value) or false;
end


