json = require "database/dependences/json"
require ("database/crud")
require ("front")

localDBFile = "database/accounts.db.json"

balanceDefault = 500


function createAccount()
    ui("Digite o seu nick", null, 0)
    op = io.read()

    if (op ~= "0") then
        if (nameExists(op) == false) then
            nome = op

            ui("Digite a sua senha", null, 0)
            op = io.read()

            if (op == "0") then
                home()
            end

            senha = op

            ui("Digite o seu pin", null, 0)
            op = io.read()

            if (op == "0") then
                home()
            end

            pin = op

            numberAccounts = numberAccounts()

            id = numberAccounts + 1

            value = balanceDefault

            addAccount(id, nome, value, senha, pin)

        else
            ui("Name already exits! Enter or 0 to exit", null, 0)
            op = io.read()
            createAccount()
        end
    else
        home()
    end

end

function home()
    while true do
        ui("Select your operation", null, 1)
        op = io.read()

        if (op == "1") then
            createAccount()

        elseif (op == "2") then
            login()

        else
            ui("Erro: Unrecognized operation", null, 1)
        end
    end
end

home()