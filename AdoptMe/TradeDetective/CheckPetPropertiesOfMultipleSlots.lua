local player = game:GetService("Players").LocalPlayer

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
        TradeSlot.rbxassetid = itemImageTemplate.Image or "" -- Assign rbxassetid if it exists
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
        print("Mega:", TradeSlots[slotCounter].mega_neon)
    else
        -- Handle the error here (e.g., print an error message)
        print("Error occurred for Slot " .. slotCounter)
    end
end
