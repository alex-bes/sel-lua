local Parser = {}

function Parser:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Parser:parseOccurrence(expression)
    local hendlerPattern = "$%a+"
    local argsPattern = "%b()"
    local occurrence = {};

    local starts, ends = expression:find(hendlerPattern)

    if not starts then return nil end

    occurrence.name = expression:sub(starts + 1, ends);

    local argsStarts, argsEnds = expression:find(argsPattern, ends);

    if argsStarts then
        occurrence.isFunc = true;
        occurrence.arg = expression:sub(argsStarts + 1, argsEnds - 1)
    end

    occurrence.fullMatch = expression:sub(starts, argsEnds or ends)
    return occurrence
end

return Parser




