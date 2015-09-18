local utils = require "../sel/utils"
local stringSplit = utils.stringSplit
local stringTrim = utils.stringTrim

return {
    populateContextByDefaultHandlers = function(context)

        context:registerHandler('not', function(arg)
            arg = tostring(arg)
            arg = arg:lower();
            local args = stringSplit(arg, ",");
            --assert(table.getn(args) == 1, "SEL: not handler accepts only one argument")
            arg = stringTrim(args[1]);
            return not (arg == "true")
        end)

        context:registerHandler('allOf', function(arg)
            arg = tostring(arg)
            local args = stringSplit(arg, ",");
            for k, v in pairs(args) do
                if stringTrim(v) ~= "true" then
                    return false;
                end
            end
            return true;
        end)

        context:registerHandler('anyOf', function(arg)
            arg = tostring(arg)
            local args = stringSplit(arg, ",");
            for k, v in pairs(args) do
                if stringTrim(v) == "true" then
                    return true;
                end
            end
            return false;
        end)

        return context
    end
}