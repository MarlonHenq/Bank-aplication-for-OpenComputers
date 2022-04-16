function split(string) -- Split the string
    i = 0
    a = {}
    for w in string.gmatch(string, "|") do
        a[i] = w
        i = i + 1
    end
    return a
end