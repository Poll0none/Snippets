-- Define a flag to track whether the action has been triggered
local actionTriggered = false

-- Function to check ImageTransparency and trigger the action
local function checkImageTransparency()
    local object = game:GetService("Players").LocalPlayer.PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Accepted
    
    if object and object:IsA("GuiObject") and object.ImageTransparency then
        if object.ImageTransparency < 0.5 and not actionTriggered then
            print("ImageTransparency is less than 0.5 - Triggering action")
            
            -- Set the flag to true to indicate that the action has been triggered
            actionTriggered = true
        elseif object.ImageTransparency >= 0.5 then
            -- Reset the flag when ImageTransparency is no longer less than 0.5
            actionTriggered = false
        end
    else
        print("Object or property not found")
    end
end

-- Run the check in a loop
while true do
    checkImageTransparency()
    wait() -- Adjust the wait time as needed to control the frequency of checks
end
