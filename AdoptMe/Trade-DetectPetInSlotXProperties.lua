local player = game:GetService("Players").LocalPlayer

--Change .flyable for rideable or mega_neon or neon THERE ARE OTHER VALUES mega_neon_old and wearing
local flyable = player.PlayerGui.TradeApp.Frame.NegotiationFrame.Body.PartnerOffer.Slots.Slot2.TagDisplayTemplate.flyable

if flyable.IsLoaded == true then
    print("Flyable")
end

