--[[

ALCHEMY HUB NETA EDITION SCRIPT

This made by Alchemy Team ( io.Luable / Alchemy Hub )
Modification of the script, including attempting to bypass
or crack the script for any reason is not allowed.

Copyright © 2025 Alchemy Hub - Script. All Rights Reserved.

]]--

-- 84221975933832 logo ( NETA )
__f = {
    ['__game'] = function()
        local g = game.GameId
        if g == 994732206 then return "v3/loaders/311ad7329b80c2117f4bdbf46582dcc6.lua" -- Blox Fruits
        elseif g == 5750914919 then return "v3/loaders/40142043704f8ec418b59eddd1cb1949.lua" -- Fisch
        elseif g == 6325068386 then return "v3/loaders/4171685ce597cf71185c038656d405ca.lua" -- Bluelock Rivals
        elseif g == 6931042565 then return "v3/loaders/abbbbec4c052ea223f09c7e819748161.lua" -- Volleyball Legends
        elseif g == 6906326545 then return "v3/loaders/34a7bfd841e02f5b30b75712e5da67ae.lua" -- Basketball Showdown
        else
            game:GetService("Players").LocalPlayer:Kick("\n⚠️ This game is discontinued or not support ⚠️")
            return "."
        end
    end;
    ['__premium'] = function()
        local g = game.GameId
        if g == 994732206 then return "v3/loaders/a1a6b1634179469cd1b8f22b2a32492d.lua" -- Blox Fruits
        elseif g == 5750914919 then return "v3/loaders/b483c866b947fd0b7a2558cf67ae1417.lua" -- Fisch
        elseif g == 6325068386 then return "v3/loaders/42375cfe2e65070104eaaa05a823d9b4.lua" -- Bluelock Rivals
        elseif g == 6931042565 then return "v3/loaders/2a04962aae55b8e5d6626f949470c40a.lua" -- Volleyball Legends
        elseif g == 6906326545 then return "v3/loaders/f7d7cd2ec55759828c1e25f6feebe028.lua" -- Basketball Showdown
        else
            game:GetService("Players").LocalPlayer:Kick("\n⚠️ This game is discontinued or not support ⚠️")
            return "."
        end
    end;
    ['__script'] = function(m) return "https://raw.githubusercontent.com/ZoiIntra/__Script/main/__Alchemy/__"..m..".lua" end;
    ['__load'] = function(s) loadstring(game:HttpGet(s))() end;
    ['__ismobile'] = function()
        local uis = game:GetService("UserInputService")
        if uis.TouchEnabled and not uis.KeyboardEnabled and not uis.MouseEnabled then return true
        elseif not uis.TouchEnabled and uis.KeyboardEnabled and uis.MouseEnabled then return false end
    end;
    ['__executor'] = tostring(identifyexecutor())
}

_G.AutoRelaunch = auto_rejoin
_G.StreamerMode = streamer_mode

-- **Force Premium Mode**
_G.Premium = true

_G.Config = setting or _G.Config

if _G.run_time then 
    game:GetService("Players").LocalPlayer:Kick("\n⚠️ Please execute script only once ⚠️") 
end

task.spawn(function()
    while true do 
        task.wait()
        if _G.AutoRelaunch then
            pcall(function()
                getgenv().re = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Child)
                    if Child.Name == 'ErrorPrompt' and Child:FindFirstChild('MessageArea') and Child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(game.PlaceId) 
                    end
                end)
            end)
        end
    end
end)

if _G.StreamerMode then
    pcall(function()
        local allSpace = game:GetDescendants()
        for i = 1, #allSpace do
            if allSpace[i].ClassName == "TextLabel" then
                if string.find(allSpace[i].Text, game.Players.LocalPlayer.Name) then
                    allSpace[i].Text = "[Protect By Alchemy Hub]"
                    allSpace[i].Changed:Connect(function()
                        allSpace[i].Text = "[Protect By Alchemy Hub]"
                    end)
                end
                if string.find(allSpace[i].Text, game.Players.LocalPlayer.DisplayName) then
                    allSpace[i].Text = "[Protect By Alchemy Hub]"
                    allSpace[i].Changed:Connect(function()
                        allSpace[i].Text = "[Protect By Alchemy Hub]"
                    end)
                end
            end
        end
    end)
end

spawn(function()
    pcall(function()
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end)
end)

local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZoiIntra/__Script/refs/heads/main/__UI1.lua"))()
if game.GameId == 5750914919 then -- for fisch
    UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZoiIntra/__Script/refs/heads/main/__UI2.lua"))()
end

local tar;
pcall(function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZoiIntra/__Script/refs/heads/main/__Finded.lua"))() 
end)

-- **Ensure only Premium Loads**
tar = __f['__premium']()
__f['__load']("https://api.luarmor.net/files/"..tar)

_G.run_time = true
