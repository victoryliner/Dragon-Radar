--[[

ALCHEMY HUB NETA EDITION SCRIPT

This made by Alchemy Team ( io.Luable / Alchemy Hub )
Modification of the script, including attempting to bypass
or crack the script for any reason is not allowed.

Copyright © 2025 Alchemy Hub - Script. All Rights Reserved.

]]--

-- 84221975933832 logo ( NETA )
__f = {
    ['__premium'] = function()
        local g = game.GameId
        if g == 994732206 then return "v3/loaders/a1a6b1634179469cd1b8f22b2a32492d.lua" -- Blox Fruits
        elseif g == 5750914919 then return "v3/loaders/b483c866b947fd0b7a2558cf67ae1417.lua" -- Fisch
        elseif g == 6325068386 then return "v3/loaders/42375cfe2e65070104eaaa05a823d9b4.lua" -- Bluelock Rivals
        elseif g == 6931042565 then return "v3/loaders/2a04962aae55b8e5d6626f949470c40a.lua" -- Volleyball Legends
        elseif g == 6906326545 then return "v3/loaders/f7d7cd2ec55759828c1e25f6feebe028.lua" -- Basketball Showdown
        else
            game:GetService("Players").LocalPlayer:Kick("\n⚠️ This game is discontinued or not supported ⚠️")
            return "."
        end
    end;
    ['__load'] = function(s) loadstring(game:HttpGet(s))() end;
}

-- Force Premium Mode
_G.Premium = true

-- Prompt for Key Input
local function requestKey()
    local UI = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextBox = Instance.new("TextBox")
    local Submit = Instance.new("TextButton")

    UI.Parent = game.CoreGui
    Frame.Parent = UI
    Frame.Size = UDim2.new(0, 300, 0, 150)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    Frame.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame.BorderSizePixel = 2

    TextBox.Parent = Frame
    TextBox.Size = UDim2.new(0.8, 0, 0.4, 0)
    TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
    TextBox.PlaceholderText = "Enter your key here"
    TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
    TextBox.TextColor3 = Color3.new(0, 0, 0)

    Submit.Parent = Frame
    Submit.Size = UDim2.new(0.8, 0, 0.3, 0)
    Submit.Position = UDim2.new(0.1, 0, 0.7, 0)
    Submit.Text = "Submit"
    Submit.BackgroundColor3 = Color3.new(0, 1, 0)

    local key = nil

    Submit.MouseButton1Click:Connect(function()
        key = TextBox.Text
        UI:Destroy()
    end)

    repeat wait() until key

    return key
end

-- Validate Key
local function validateKey(userKey)
    local validKeys = {
        "PREMIUM123",
        "VIP-ACCESS",
        "GOLDEN-TICKET"
    }
    for _, v in pairs(validKeys) do
        if v == userKey then return true end
    end
    return false
end

-- Run Key Check
local enteredKey = requestKey()

if validateKey(enteredKey) then
    print("✅ Valid Key! Loading Premium Script...")
    tar = __f['__premium']()
    __f['__load']("https://api.luarmor.net/files/"..tar) -- Load Premium Version
else
    game:GetService("Players").LocalPlayer:Kick("\n❌ Invalid Key! Please enter a valid premium key.")
end

_G.run_time = true
