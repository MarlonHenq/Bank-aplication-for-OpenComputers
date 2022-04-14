json = require "dependences/json"

file = io.open("accounts.db.json", "w")

function addAccount(id, name, balance, password, pin)
    add = {
        id = id,
        name = name,
        balance = balance,
        password = password,
        pin = pin
    }

    file:write(json.encode(add) .. ",\n")
end


addAccount(1, "John", 100, "123", "1234")
addAccount(2, "Daja", 500, "123", "1234")