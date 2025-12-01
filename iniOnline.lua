-- functioning functions
local function encrypt(stringtoencrypt)
	local dataTable = {}
	for i = 1,#stringtoencrypt do
		local byte = string.byte(stringtoencrypt,i)
		dataTable[i] = (byte^2)
	end
	local cleanedVar = table.concat(dataTable, "x")
	return cleanedVar
end

local function decrypt(stringtodecrypt)
	local dataTable = {}
	local splitString = string.split(stringtodecrypt, "x")
	for i, v in ipairs(splitString) do
		dataTable[i] = string.char(math.sqrt(v))
	end
	local cleanedVar = table.concat(dataTable)
	return cleanedVar
end

onNetworkEvent(function(data)
	print(decrypt(data))
end)

-- very beautiful input encryption
local userInput = nil
print("enter username NOW")
local username = input()
print("username: " .. username)
wait(1)
clear()
print("type *exit to exit. using lf3x1 encryption.")
while wait() do
	userInput = input()
	if userInput == "*exit" then
		break
	end
	sendNetworkPacket(encrypt("[" .. username .. "]: " .. userInput))
end
