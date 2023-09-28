--[[
This code prints last ChatMessage from trade chat, also checks if added or removed appears on the sentence and then prints pet name
]]--

-- Execute getgenv().toggle = false to disable While Loop

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
        local messageText = newMessage.Text:lower() -- Convert to lowercase
        print(messageText) -- Print the original message

        -- Check for the conditions
        local addedStart, addedEnd = messageText:find("added")
        local removedStart, removedEnd = messageText:find("removed")

        if addedStart or removedStart then
            local startIdx = addedStart or removedStart
            local action = messageText:sub(startIdx, startIdx + 5) -- Get "added" or "removed"
            
            local restOfText = messageText:sub(startIdx + 6) -- +6 to skip "added" or "removed"
            local cleanedText = restOfText:gsub(" ", "_"):match("[^%.]+")
            
            print(action)
            print(cleanedText)
        end

        lastMessage = newMessage
    end

    wait() -- Adjust the wait time as needed to control how frequently you check for new messages
end
