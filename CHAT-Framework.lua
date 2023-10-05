--FROM https://shz.al/~Framework

local cache = {}
local Framework = {}

Framework.Services = setmetatable({}, {
    __index = function(self, index)
        if cache[index] then
            return cache[index]
        end

        if cloneref or clonereference then
            local service = cloneref(game:GetService(index)) or clonereference(game:GetService(index))
            if service then
                return service
            end
        end
    end
})

setmetatable(_G, {__index = getgenv(), __newindex = function(self, key, value) getgenv()[key] = value end})

function Framework:FireServer(Remote, ...)
    assert(Remote and Remote.IsA and Remote:IsA("RemoteEvent"), "Invalid RemoteEvent")
    Remote:FireServer(unpack({...}))
end

function Framework:Fire(Remote, ...)
    assert(Remote and Remote.IsA and Remote:IsA("BindableEvent"), "Invalid BindableEvent")
    Remote:Fire(unpack({...}))
end

function Framework:InvokeServer(Remote, ...)
    Remote:InvokeServer(unpack({...}))
end

function Framework:GenerateString(length)
    local chars = {}
    for i = 1, length do
        local randChar = string.char(math.random(97, 122)) 
        table.insert(chars, randChar)
    end
    return table.concat(chars)
end

local originalValues = {}
local originalNewIndex = hookmetamethod(game, '__newindex', function(...)
     return originalNewIndex(...)
end)


function Framework:Spoof(obj, prop, value)
    originalValues[obj] = originalValues[obj] or {} -- Create a sub-table for each object if it doesn't exist
    originalValues[obj][prop] = originalValues[obj][prop] or obj[prop] -- Store the original value

    return originalNewIndex(obj, prop, value)
end

hookmetamethod(game, '__newindex', function(...)
    return Framework:Spoof(...)
end)

function Framework:Unspoof(obj, prop)
   if originalValues[obj] and originalValues[obj][prop] then
       return originalNewIndex(obj, prop, originalValues[obj][prop])
   end
end


return Framework
