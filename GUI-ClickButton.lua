local Player = game.Players.LocalPlayer

--Replace Button with GUI´s Button Path
local Button = Player.PlayerGui.MinigameRewardsApp.Body.Button
local events = { "MouseButton1Click", "MouseButton1Down", "Activated" }
for i, v in next, events do firesignal(Button[v]) end
