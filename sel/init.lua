local Context = require "../sel/context"
local library = require "../sel/handlersLibrary"
local Evaluator = require "../sel/evaluator" --TODO: what's wrong with relative requiring like "./evaluator"?

return {
    createEvaluator = function()
        return Evaluator:new()
    end,
    createDefaultEvaluator = function()
        local evaluator = Evaluator:new();
        evaluator.globalContext = library.populateContextByDefaultHandlers(evaluator.globalContext)
        return evaluator
    end,
    createContext = function()
        return Context:new()
    end,
    createDefaultContext = function()
        return library.populateContextByDefaultHandlers(Context:new())
    end
}

