json = require "database/dependences/json"
require ("database/crud")
require ("lottery/lottery")
require ("front")

localAccountsDBFile = "database/accounts.db.json"
localTransactionsDBFile = "database/transactions.db.json"

balanceDefault = 500

function transfer(idSender)
    ui("Digite o Nickname do destinatário", idSender, 4)
    NameReceiver = io.read()
    
    accountReciver = nameExists(NameReceiver)

    if (accountReciver == false) then
        ui("Nickname não encontrado", idSender, 3)
        op = io.read()
        if (op == "1") then
            transfer(idSender)
        else
            accountLoggedIn(idSender)
        end
    end

    idReceiver = accountReciver
    accountReciver = getAccount(id)
    
    ui("Digite o valor da transferência", idSender, 4)
    value = io.read()

    if (tonumber(getAccount(idSender).balance) < tonumber(value)) then
        ui("Saldo insuficiente", idSender, 3)
        op = io.read()
        if (op == "0") then
            home()
        end
        if (op == "1") then
            accountLoggedIn(idSender)
        end
    end

    print(idReceiver)
    updateBalance(idSender, tonumber(getAccount(idSender).balance) - tonumber(value))
    updateBalance(idReceiver, tonumber(getAccount(idReceiver).balance) + tonumber(value))
    
    idTransaction = transactionIds() + 1
    addTransaction(idSender, idReceiver, value, "Transferência", idTransaction)
    
    ui("Transferência realizada com sucesso", idSender, 4)
    op = io.read()

    accountLoggedIn(idSender)
    
end

function accountLoggedIn(id)
    ui("Welcome " .. account.name .." | 1 = Transfer, 2 = Lottery, 0 = Exit", id, 2)
    op = io.read()

    if (op == "1") then
        transfer(id)
    elseif (op == "2") then
        --lottery(id)
        accountLoggedIn(id)
    else
        home()
    end
end

function login()
    ui("Enter your nickname", null, 0)
    op = io.read()
    if (op == "0") then
        home()
    end
    if (nameExists(op) == false) then
        ui("Nickname not found | 0 = Exit, 1 = Create account", null, 0)
        op = io.read()
        if (op == "1") then
            createAccount()
        else
            home()
        end
    else
        id = nameExists(op)
        ui("Enter your password", null, 0)
        op = io.read()

        if (op == "0") then
            home()
        end

        account = getAccount(id)

        if (op == account.password) then
            accountLoggedIn(id)
        else
            ui("Wrong password | 0 = Exit, 1 = Try again", null, 0)
            op = io.read()
            if (op == "1") then
                login()
            else
                home()
            end
        end
    end
end

function createAccount()
    ui("Enter your nickname", null, 0)
    op = io.read()

    if (op ~= "0") then
        if (nameExists(op) == false) then
            nome = op

            ui("Enter your password", null, 0)
            op = io.read()

            if (op == "0") then
                home()
            end

            senha = op

            ui("Enter your pin", null, 0)
            op = io.read()

            if (op == "0") then
                home()
            end

            pin = op

            numberAccounts = numberAccounts()

            id = numberAccounts + 1

            value = balanceDefault

            addAccount(id, nome, value, senha, pin)

            ui("Account created | 0 = Exit, 1 = Login", null, 0)

            op = io.read()
            if (op == "1") then
                login()
            else
                home()
            end

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
        ui("Welcome to the bank!\nSelect your operation", null, 1)
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