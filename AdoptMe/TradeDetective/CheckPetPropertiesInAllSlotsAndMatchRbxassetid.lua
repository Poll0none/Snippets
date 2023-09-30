--[[
CHECKS ALL SLOTS, and if there is a coincidence with the table petData then it prints I found a coincidence. Loops through all slots up to 9
]]--

local player = game:GetService("Players").LocalPlayer

local petData = {
    petname1 = 13620861015,
    petname2 = 13894724323,
    petname3 = 10618035564,
    -- Add more pet names and rbxassetid pairs as needed
}

-- Function to check for coincidences
local function checkForCoincidences(rbxassetid)
    for petName, petRbxassetid in pairs(petData) do
        if petRbxassetid == rbxassetid then
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
    
    if success then
        -- Store the result in TradeSlots[slotCounter]
        TradeSlots[slotCounter] = result

        -- Print the properties of the TradeSlot for the current slotCounter
        print("Slot " .. slotCounter .. " properties:")
        print("rbxassetid:", TradeSlots[slotCounter].rbxassetid)
        print("Fly:", TradeSlots[slotCounter].flyable)
        print("Ride:", TradeSlots[slotCounter].rideable)
        print("Neon:", TradeSlots[slotCounter].neon)
        
        --Mega NEON always prints false, IDKW, maybe I have to check for old_mega_neon
        print("Mega:", TradeSlots[slotCounter].mega_neon)
    end
end


--Checks all slots to see if any rbxassetid coincides with the table defined at the start of this code: petData
for petName, petRbxassetid in pairs(petData) do
    local coincidence = checkForCoincidences(petRbxassetid)
    if coincidence then
        print("Coincidence found!")
        print("Pet Name:", coincidence)
        print("rbxassetid:", petRbxassetid)
    else
        print("No coincidence found for rbxassetid:", petRbxassetid)
    end
end
