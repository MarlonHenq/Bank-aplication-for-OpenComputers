function fileExists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
 end
 

function createDB(name)
    f = io.open(name, "w")
end

function verifyAndCreateDB()
    --verify if the database exists and if not, create it
    if (fileExists(localTransactionsDBFile) == false) then
        createDB(localTransactionsDBFile)
    end
    if (fileExists(localAccountsDBFile) == false) then
        createDB(localAccountsDBFile)
    end
end