local player = game:GetService("Players").LocalPlayer
local chatLog = player.PlayerGui.TradeApp.Frame.NegotiationFrame.ChatFrame.ChatLog.ScrollComplex.ScrollingFrame.Content.ChatMessage

--To turn off run getgenv().toggle = false
getgenv().toggle = true

while wait(1) and toggle == true do
	pcall(function()
	    -- Assuming you want to print the text property of the chatLog GUI element
		print(chatLog.Text)
	end)
end


