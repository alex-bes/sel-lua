local stringSplit = require "../sel/utils".stringSplit

return {
    populateContextByDefaultHandlers = function(context)

        context:registerHandler('not', function(arg)
            print("arg:", arg)
            arg = tostring(arg)
            arg = arg:lower();
            print("arg:", arg)
            local args = stringSplit(arg, ",");
--            assert(table.getn(args) == 1, "SEL: not handler accepts only one argument")
            arg = args[1];
            --TODO: trim arg
            return not (arg == "true")
        end)

        return context
    end
}