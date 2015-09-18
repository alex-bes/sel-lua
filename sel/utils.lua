return {
    stringSplit = function(inputstr, sep)
        sep = sep or "%s"
        local t, i = {}, 1
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            t[i] = str
            i = i + 1
        end
        return t
    end,
    stringTrim = function(s)
        return s:match '^()%s*$' and '' or s:match '^%s*(.*%S)'
    end
}