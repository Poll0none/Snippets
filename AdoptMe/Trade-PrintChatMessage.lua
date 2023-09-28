--[[
This code prints last ChatMessage from trade chat: LOCATED AT game:GetService("Players").LocalPlayer.player.PlayerGui.TradeApp.Frame.NegotiationFrame.ChatFrame.ChatLog.ScrollComplex.ScrollingFrame.Content

It will need to be trimmed so I can extract only the pet´s name and assign it to a variable, also I need to 
]]--

--Execute getgenv().toggle = false to disable While Loop

local player = game:GetService("Players").LocalPlayer
local chatFrame = player.PlayerGui.TradeApp.Frame.NegotiationFrame.ChatFrame
local chatLog = chatFrame.ChatLog.ScrollComplex.ScrollingFrame.Content
local lastMessage = nil

getgenv().toggle = true

while wait() and toggle == true do
    local newMessage = nil
    for _, chatMessage in ipairs(chatLog:GetChildren()) do
        if chatMessage:IsA("TextLabel") and chatMessage.Name == "ChatMessage" then
            newMessage = chatMessage
        end
    end

    if newMessage and newMessage ~= lastMessage then
        print(newMessage.Text)
        lastMessage = newMessage
    end

    wait() -- Adjust the wait time as needed to control how frequently you check for new messages
end




