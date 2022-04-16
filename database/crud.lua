-- json = require "dependences/json"


function addAccount(id, name, balance, password, pin)
    file = io.open(localDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        data = "{\"accounts\":[{\"id\":\"" .. id .. "\",\"name\":\"" .. name .. "\",\"balance\":\"" .. balance .. "\",\"password\":\"" .. password .. "\",\"pin\":\"" .. pin .. "\"}]}"
        data = json.decode(data)
    else
        data = json.decode(data)
    end
    file:close()

    data.accounts[id] = {
        name = name,
        balance = balance,
        password = password,
        pin = pin,
        id = id
    }

    file = io.open(localDBFile, "w")
    file:write(json.encode(data))
    file:close()
    
    return true
end


function getAccount(id)
    file = io.open(localDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return nil
    else
        data = json.decode(data)
    end
    file:close()

    return data.accounts[id]
end

function getAccounts()
    file = io.open(localDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return nil
    else
        data = json.decode(data)
    end
    file:close()

    return data.accounts
end

function updateBalance(id, balance)
    file = io.open(localDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return nil
    else
        data = json.decode(data)
    end
    file:close()

    data.accounts[id].balance = balance

    file = io.open(localDBFile, "w")
    file:write(json.encode(data))
    file:close()

    return true
end

function numberAccounts()
    file = io.open(localDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return 0
    else
        data = json.decode(data)
    end
    file:close()

    return #data.accounts
end

function nameExists(name)
    file = io.open(localDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return false
    else
        data = json.decode(data)
    end
    file:close()

    for i, v in pairs(data.accounts) do
        if (v.name == name) then
            return i
        end
    end

    return false
end

crud = { _version = "1.0.1" }

return crud