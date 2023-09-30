--[[
CHECKS ALL SLOTS, and if there is a coincidence with the table petData then it prints I found a coincidence. Loops through all slots up to 9
]]--
local player = game:GetService("Players").LocalPlayer

local petData = {
    alicorn = 9781852671,
    brown_chow = 9938967576,
    golden_king_penguin = 9490242683,
    golden_albatross = 9475753542,
    golden_albatross = 9475753542,
    -- Add more pet names and rbxassetid pairs as needed
}

-- Function to check for coincidences
local function checkForCoincidences(rbxassetid)
    for petName, petRbxassetid in pairs(petData) do
        -- Convert both rbxassetids to strings and compare
        if tostring(petRbxassetid) == tostring(rbxassetid) then
            return petName -- Return the pet name if there is a coincidence
        end
    end
    return nil -- Return nil if no coincidence is found
end

-- Define a function to check properties of a slot and return them in TradeSlot
local function checkSlotProperties(SlotNumber)
    local slot = player.PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Slots["Slot" .. SlotNumber]
    local itemImageTemplate = slot.ItemImageTemplate -- Get the ItemImageTemplate for the slot

    local TradeSlot = {}

    -- Iterate through properties
    local properties = {"flyable", "rideable", "neon", "mega_neon"}
    for _, prop in ipairs(properties) do
        local property = slot.TagDisplayTemplate[prop]
        TradeSlot[prop] = property and property.IsLoaded == true
    end

    -- Check if ItemImageTemplate has an Image property
    if itemImageTemplate and itemImageTemplate:IsA("ImageLabel") then
        local imageSource = itemImageTemplate.Image or ""
        -- Extract numeric characters from the imageSource
        local rbxassetid = imageSource:gsub("%D", "")
        TradeSlot.rbxassetid = rbxassetid
    end

    return TradeSlot -- Return the TradeSlot table with properties assigned
end

-- Create a table to store TradeSlots
local TradeSlots = {}

-- Number of iterations
local numIterations = 9 -- Change this to the number of iterations you want

for slotCounter = 1, numIterations do
    local success, result = pcall(checkSlotProperties, slotCounter)
    
    if success and result then
        -- Store the result in TradeSlots[slotCounter]
        TradeSlots[slotCounter] = result

        -- Print the properties of the TradeSlot for the current slotCounter
        print("Slot " .. slotCounter .. " properties:")
        print("rbxassetid:", TradeSlots[slotCounter].rbxassetid)
        print("Fly:", TradeSlots[slotCounter].flyable)
        print("Ride:", TradeSlots[slotCounter].rideable)
        print("Neon:", TradeSlots[slotCounter].neon)
        
        -- Mega NEON always prints false, IDKW, maybe I have to check for old_mega_neon
        print("Mega:", TradeSlots[slotCounter].mega_neon)
    end
end

-- Check for coincidences after TradeSlots are populated
for slotCounter = 1, numIterations do
    local rbxassetid = TradeSlots[slotCounter] and TradeSlots[slotCounter].rbxassetid
    if rbxassetid then
        local coincidence = checkForCoincidences(rbxassetid)
        
        if coincidence then
            print("Coincidence found for Slot " .. slotCounter .. ":")
            print("Pet Name:", coincidence)
            print("rbxassetid:", rbxassetid)
        else
            print("No coincidence found for Slot " .. slotCounter .. ":")
            print("rbxassetid:", rbxassetid)
        end
    end
end
