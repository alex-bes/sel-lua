local Parser = require "../sel/parser";
local Context = require "../sel/context";

------------------------------------------------
local Evaluator = {}

local RECURSION_LIMIT = 15

function Evaluator:new(o)
    o = o or {} -- create object if user does not provide one
    o.parser = Parser:new();
    o.globalContext = Context:new();
    setmetatable(o, self)
    self.__index = self
    return o
end

function Evaluator:evaluate(expression, context)
    if not context then
        context = self.globalContext
    else
        context:inherit(self.globalContext)
    end
    return self:_evaluate(expression, context, 0)
end

function Evaluator:_evaluate(expression, context, rLevel)
    if not type(expression) == 'string' then
        return expression
    end

    assert(rLevel < RECURSION_LIMIT, "SEL: Recursion limit reached")

    local occurrence = self.parser:parseOccurrence(expression);
    while occurrence do
        local argument
        if occurrence.isFunc then
            argument = self:evaluate(occurrence.arg, context, rLevel + 1)
        end
        local handler = context:getHandlerByName(occurrence.name)
        local subValue = handler(argument)
        if (type(subValue) ~= "string")
                or (type(subValue) == "string" and expression:len() == occurrence.fullMatch:len()) then
            expression = subValue;
            break
        else
            expression = expression:gsub(occurrence.fullMatch, tostring(subValue), 1)
            occurrence = self.parser:parseOccurrence(expression);
        end
    end
    return expression
end

return Evaluator




