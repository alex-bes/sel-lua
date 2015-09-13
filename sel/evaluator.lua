local Parser = require "../sel/parser";

------------------------------------------------
local Evaluator = {}

function Evaluator:new(o)
    o = o or {} -- create object if user does not provide one
    o.parser = Parser:new();
    setmetatable(o, self)
    self.__index = self
    return o
end

function Evaluator:evaluate(expression, context)
    local result = expression;
    local occurrence = self.parser:parseOccurrence(expression);
    while occurrence do
        local argument
        if occurrence.isFunc then
            argument = self:evaluate(occurrence.arg, context)
        end

        local handler = context:getHandlerByName(occurrence.name)
        local expressionValue = handler(argument)
        if type(result) == "string" and result:len() == occurrence.fullMatch:len() then
            result = expressionValue;
            break
        elseif type(result) == "string" then
            result = result:gsub(occurrence.fullMatch, expressionValue or "", 1)
            occurrence = self.parser:parseOccurrence(result);
        else
            result = expressionValue;
            break
        end
    end

    return result
end

return Evaluator




