local Number = 0
local SomeSRVS = {}
for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
    if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
        if v.playing > Number then
            Number = v.playing
            SomeSRVS[1] = v.id
        end
    end
end
if #SomeSRVS > 0 then
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, SomeSRVS[1])
end
