local Context = {};

function Context:new(o)
    o = o or {} -- create object if user does not provide one
    o.handlers = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Context:registerHandler(name, handler)
    self.handlers[name] = handler
end

function Context:registerValue(name, value)
    local handler = function()
        return value
    end
    self.handlers[name] = handler
end

function Context:getHandlerByName(name)
    return self.handlers[name]
end


return Context
