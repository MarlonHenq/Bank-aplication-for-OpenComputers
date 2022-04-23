-- json = require "dependences/json"


function addAccount(id, name, balance, password, pin)
    file = io.open(localAccountsDBFile, "r")
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

    file = io.open(localAccountsDBFile, "w")
    file:write(json.encode(data))
    file:close()
    
    return true
end


function getAccount(id)
    file = io.open(localAccountsDBFile, "r")
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
    file = io.open(localAccountsDBFile, "r")
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
    file = io.open(localAccountsDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return nil
    else
        data = json.decode(data)
    end
    file:close()

    data.accounts[id].balance = balance

    file = io.open(localAccountsDBFile, "w")
    file:write(json.encode(data))
    file:close()

    return true
end

function numberAccounts()
    file = io.open(localAccountsDBFile, "r")
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
    file = io.open(localAccountsDBFile, "r")
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

--- transactions ---

function getTransactions()
    file = io.open(localTransactionsDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return nil
    else
        data = json.decode(data)
    end
    file:close()

    return data.transactions
end

function getTransaction(id)
    file = io.open(localTransactionsDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return nil
    else
        data = json.decode(data)
    end
    file:close()

    return data.transactions[id]
end

function transactionIds()
    file = io.open(localTransactionsDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        return 0
    else
        data = json.decode(data)
    end
    file:close()

    return #data.transactions

end

function addTransaction(idSender, idReceiver, amount, massage, idTransaction)
    file = io.open(localTransactionsDBFile, "r")
    data = file:read("*all")
    if (data == "") then
        data = "{\"transactions\":[{\"idSender\":\"" .. idSender .. "\",\"idReceiver\":\"" .. idReceiver .. "\",\"amount\":\"" .. amount .. "\",\"massage\":\"" .. massage .. "\",\"idTransaction\":\"" .. idTransaction .. "\"}]}"
        data = json.decode(data)
    else
        data = json.decode(data)
    end
    file:close()

    data.transactions[idTransaction] = {
        idSender = idSender,
        idReceiver = idReceiver,
        amount = amount,
        massage = massage,
        idTransaction = idTransaction
    }

    file = io.open(localTransactionsDBFile, "w")
    file:write(json.encode(data))
    file:close()

    return true
end




--- END ---
crud = { _version = "1.0.2" }

return crud