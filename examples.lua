local sel = require "sel.init"

local evaluator = sel.createDefaultEvaluator();
local context = sel.createContext();

context:registerValue('world', "LUA");
context:registerHandler('pipesWrap', function(arg)
    arg = arg or ""
    return "|" .. arg .. "|"
end);


--base tests
local ex1 = "Hello $world";
print(ex1, " =>", evaluator:evaluate(ex1, context))

local ex2 = "$pipesWrap(Hello $world)";
print(ex2, " =>", evaluator:evaluate(ex2, context))

-- "not" handler
local ex3 = "$not($not($not(false)))";
print(ex3, " =>", evaluator:evaluate(ex3, context))

--"anyOf" handler
local ex4 = "$anyOf(true, true, false)";
print(ex4, " =>", evaluator:evaluate(ex4, context))

local ex5 = "$anyOf(false, false, false)";
print(ex5, " =>", evaluator:evaluate(ex5, context))

local ex6 = "$anyOf(true, true, true)";
print(ex6, " =>", evaluator:evaluate(ex6, context))

--"allOf" handler
local ex7 = "$allOf(true, true, false)";
print(ex7, " =>", evaluator:evaluate(ex7, context))

local ex8 = "$allOf(false, false, false)";
print(ex8, " =>", evaluator:evaluate(ex8, context))

local ex9 = "$allOf(true, true, true)";
print(ex9, " =>", evaluator:evaluate(ex9, context))

