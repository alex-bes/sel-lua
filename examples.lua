local sel = require "sel.init"

local evaluator = sel.createEvaluator();
local context = sel.createContext();
local anotherContext = sel.createContext();

context:registerValue('world', "LUA");
context:registerHandler('pipesWrap', function(arg)
    return "|" .. arg .. "|"
end);


--base tests
local firstTest = "Hello $world";
print(firstTest, " =>", evaluator:evaluate(firstTest, context))

local secondTest = "$pipesWrap(Hello $world)";
print(secondTest, " =>", evaluator:evaluate(secondTest, context))

