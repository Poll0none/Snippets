--This code is halfway, I need to check for the word added, if found then add 1 to the counter, use the counter to refer to the function and create a table for that TradeSlot with the pet properties. In the end I need to be able to get the table generated by the function and the first value would be the petName 

local player = game:GetService("Players").LocalPlayer
local chatFrame = player.PlayerGui.TradeApp.Frame.NegotiationFrame.ChatFrame
local chatLog = chatFrame.ChatLog.ScrollComplex.ScrollingFrame.Content
local lastMessage = nil
local slotCounter = 0  -- Initialize the counter

getgenv().toggle = true


-- Define a function to check properties of a slot and return them in TradeSlot
local function checkSlotProperties(SlotNumber)
    local player = game:GetService("Players").LocalPlayer
    local slot = player.PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Slots["Slot" .. SlotNumber]

    local TradeSlot = {}

    -- Iterate through properties
    local properties = {"flyable", "rideable", "neon", "mega_neon"}
    for _, prop in ipairs(properties) do
        local property = slot.TagDisplayTemplate[prop]
        TradeSlot[prop] = property and property.IsLoaded == true
    end

    return TradeSlot -- Return the TradeSlot table with properties assigned
end

-- Create a table to store TradeSlots
local TradeSlots = {}

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
        local addedStart, addedEnd = messageText:find("added%s")
        local removedStart, removedEnd = messageText:find("removed%s")

        if addedStart then
            local addedPet = messageText:sub(addedStart, addedEnd - 1)
            local petName = messageText:sub(addedEnd + 1):gsub(" ", "_"):match("[^%.]+")

            print(addedPet)
            print("Pet:", petName)

            slotCounter = slotCounter + 1  -- Increment the counter
            
            -- Call checkSlotProperties(SlotNumber) where SlotNumber is the variable SlotCounter
            -- Store the result in TradeSlots[SlotCounter]
            TradeSlots[slotCounter] = checkSlotProperties(slotCounter)
            
            -- Include petName as a property of the TradeSlot
            TradeSlots[slotCounter].petName = petName
            
            -- Print the properties of the TradeSlot
            print("PetName:", TradeSlots[slotCounter].petName)
            print("Flyable:", TradeSlots[slotCounter].flyable)
            print("Rideable:", TradeSlots[slotCounter].rideable)
            print("Neon:", TradeSlots[slotCounter].neon)
            print("Mega Neon:", TradeSlots[slotCounter].mega_neon)
            
        elseif removedStart then
            local removedPet = messageText:sub(removedStart, removedEnd - 1)
            local petName = messageText:sub(removedEnd + 1):gsub(" ", "_"):match("[^%.]+")

            print(removedPet)
            print("Pet:", petName)
        end

        lastMessage = newMessage
    end

    wait() -- Adjust the wait time as needed to control how frequently you check for new messages
end
