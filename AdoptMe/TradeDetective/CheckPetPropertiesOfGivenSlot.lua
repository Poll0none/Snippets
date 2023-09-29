local player = game:GetService("Players").LocalPlayer
local chatFrame = player.PlayerGui.TradeApp.Frame.NegotiationFrame.ChatFrame
local chatLog = chatFrame.ChatLog.ScrollComplex.ScrollingFrame.Content
local lastMessage = nil
local slotCounter = 0  -- Initialize the counter

getgenv().toggle = true


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


--Input slot you want to check
local slotCounter = 2

-- Store the result in TradeSlots[SlotCounter]
TradeSlots[slotCounter] = checkSlotProperties(slotCounter)

-- Print the properties of the TradeSlot
print("PetName:", TradeSlots[slotCounter].petName)
print("rbxassetid:", TradeSlots[slotCounter].rbxassetid)
print("Flyable:", TradeSlots[slotCounter].flyable)
print("Rideable:", TradeSlots[slotCounter].rideable)
print("Neon:", TradeSlots[slotCounter].neon)
print("Mega Neon:", TradeSlots[slotCounter].mega_neon)
