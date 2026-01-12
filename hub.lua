pcall(function()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

repeat
    task.wait()
until game.Loaded

local MarketplaceService = game:GetService("MarketplaceService")

local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
end)

local supportedgames = {
    ["Prison Life"] = {
        getscript = "https://api.junkie-development.de/api/v1/luascripts/public/22d4214e484466ad8bdfa13b144f06071721e38d284dee95aef2d74488f7d07a/download"
    },
    ["Blind Shot"] = {
       getscript = "https://api.junkie-development.de/api/v1/luascripts/public/24e6f43a500392a7bfd6922b14da0d35b51a677954d33a6aaa37907f08bed9d4/download"
   },
    ["Cart Ride"] = {
       getscript = "https://api.junkie-development.de/api/v1/luascripts/public/6b99ff80d5ff2d44e542cbdeaf8e7e187363555fc318fe645a68884855cb8303/download"
   },
   ["Da Hood"] = {
       getscript = "https://api.junkie-development.de/api/v1/luascripts/public/c85c36dacb8bce4e1704e86d38734a80409eab3b6e4077ffe675752717493f30/download"
   },
   ["Flick"] = {
       getscript = "https://pastebin.com/raw/SBbNE9sG"
   }
}

local function isSupportedGame(gameName)
    for pattern, data in pairs(supportedgames) do
        if string.find(gameName, pattern) then
            Library:Notify("Game: "..gameName.." is supported running script!", 5)
            return loadstring(game:HttpGet(data.getscript))()
        end
    end
    Library:Notify("Game: "..gameName.." is not supported!", 5)

end

local function runScript()
    if success and info then
        local gameName = info.Name
        Library:Notify("Checking if: "..gameName.." is supported!", 5)
        isSupportedGame(gameName)
    else
        Library:Notify("Could not get place name!", 5)
    end
end

runScript()
end)
