local Context = require "../sel/context"
local Evaluator = require "../sel/evaluator" --TODO: what's wrong with relative requiring like "./evaluator"?

return {
    createEvaluator = function()
        return Evaluator:new()
    end,
    createContext = function()
        return Context:new()
    end
}

