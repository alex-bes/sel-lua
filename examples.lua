local sel = require "sel.init"

local evaluator = sel.createDefaultEvaluator();
local context = sel.createContext();

context:registerValue('world', "LUA");
context:registerHandler('pipesWrap', function(arg)
    arg = arg or ""
    return "|" .. arg .. "|"
end);


--base tests
local firstTest = "Hello $world";
print(firstTest, " =>", evaluator:evaluate(firstTest, context))

local secondTest = "$pipesWrap(Hello $world)";
print(secondTest, " =>", evaluator:evaluate(secondTest, context))


local notHandlerTest = "$not($not($not(false)))";
print(notHandlerTest, " =>", evaluator:evaluate(notHandlerTest, context))

