local user = {
    ["KRIPSI"] = true,
    [""] = true,
}

local name = globals.get_username()
if user[name] == nil then
console.execute("quit")
else
