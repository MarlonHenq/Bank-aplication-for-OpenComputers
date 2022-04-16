-- curd = require "database/crud"

function ui(message, id, display)
    if (display == 1) then
        os.execute("clear")
        print("====================================")
        print("1 - Create account, 2 - Login")
        print("------------------------------------")
        print("|" .. message .. "|")
        print("------------------------------------")
        print("====================================")
        print("")
    elseif (display == 0) then
        os.execute("clear")
        print("====================================")
        print("0 - Exit")
        print("------------------------------------")
        print("|" .. message .. "|")
        print("------------------------------------")
        print("====================================")
        print("")
    elseif (display == 2) then
        os.execute("clear")
        print("====================================")
        print("1 - Pix (transfer), 0 - Exit")
        print("------------------------------------")
        print(crud.getAccount(id).name .. " | " .. crud.getAccount(id).id)
        print("Balance: " .. crud.getAccount(id).balance)
        print("------------------------------------")
        print("|" .. message .. "|")
        print("------------------------------------")
        print("====================================")
        print("")
    elseif (display == 3) then
        os.execute("clear")
        print("====================================")
        print("1 - Return, 0 - Exit")
        print("------------------------------------")
        print(crud.getAccount(id).name .. " | " .. crud.getAccount(id).id)
        print("Balance: " .. crud.getAccount(id).balance)
        print("------------------------------------")
        print("|" .. message .. "|")
        print("------------------------------------")
        print("====================================")
        print("")
    end
    return true
end

front = { _version = "1.0.0" }

return front