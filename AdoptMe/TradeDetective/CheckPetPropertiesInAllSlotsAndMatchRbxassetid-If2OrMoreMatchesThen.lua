local player = game:GetService("Players").LocalPlayer

local petData = {
    alicorn = 9781852671,
    brown_chow = 9938967576,
    black_chow = 9938967130,
    golden_king_penguin = 9490242683,
    golden_albatross = 9475753542,
    cobra = 6963387165,
    astronaut_gorilla = 12778628650,
    billy_goat = 13894724323,
    chimera = 10926054030,
    golden_rat = 4621220431,
    cerberus = 5862774327,
    firefly = 12187391973,
    fallow_deer = 8938703243,
    chameleon = 8596153183,
    dodo = 5721843247,
    baku = 10618035564,
    golden_dragon = 4797806780,
    cudly_candle = 13186021971,
    gargoyle = 14146196672,
    golden_unicorn = 4797806957,
    green_butterfly = 10318105392,
    green_chested_pheasant = 10137833794,
    griffin = 3181727727,
    guardian_lion = 6240249282,
    golden_mummy = 7734928470,
    hawk = 8938702589,
    ice_moth_dragon = 11496077150,
    king_bee = 4281674580,
    kitsune = 5307473113,
    lava_wolf = 11109286837,
    lunar_moon_bear = 11758575657,
    maneki_neko = 10695038557,
    naga_dragon = 12557346746,
    octopus = 6498256211,
    owl_bear = 13104112588,
    peacock = 6531232495,
    phoenix = 7126719832,
    hermit_pirate_crab = 13883274830,
    robodog = 5973019152,
    shark = 6498256069,
    shark_puppy = 13665641282,
    skele = 5862774166,
    snow_owl = 6060988121,
    spinosaurus = 13104109574,
    squid = 8596147681,
    morning_duckling = 12917347755,
    rex = 5721844281,
    tree_kangaroo = 12480100169,
    unicorn = 3181728194,
    white_amazon = 11109110190,
    winged_horse = 9226723356,
    yule_log = 12778919221,
    yule_log = 12778919221,
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
local coincidenceCouter = 0
for slotCounter = 1, numIterations do
    local rbxassetid = TradeSlots[slotCounter] and TradeSlots[slotCounter].rbxassetid
    if rbxassetid then
        local coincidence = checkForCoincidences(rbxassetid)
        if coincidence then
            coincidenceCouter = coincidenceCouter + 1
            print("Coincidence found for Slot " .. slotCounter .. ":")
            print("Pet Name:", coincidence)
            print("rbxassetid:", rbxassetid)
        else
            print("No coincidence found for Slot " .. slotCounter .. ":")
            print("rbxassetid:", rbxassetid)
        end
    end
end

if coincidenceCouter >= 2 then
    print("2 or more coincidences")
end
