
if game.PlaceId == 920587237 then
    --GUI LOADSCRIPT AND WINDOW CREATE
    
    local StartTime = tick()

    local G = getgenv and getgenv() or _G or shared
    G.Get = setmetatable({}, {__index = function(A, B) return game:GetService(B) end})
    
    for i,v in pairs(game.GetChildren(game)) do
        G[v.ClassName] = v
    end
    
    G.Player = Players.LocalPlayer
    G.wait = task.wait
    G.spawn = task.spawn
    G.Heartbeat = RunService.Heartbeat
    G.Stepped = RunService.Stepped
    G.RenderStepped = RunService.RenderStepped
    G.Error = ScriptContext.Error
    G.MessageOut = LogService.MessageOut
    G.Kick = Player.Kick
    G.Idled = Player.Idled
    
    local Name = game.PlaceId .. ".json"
    local Des = {}
    if makefolder and not isfile("V.G Hub") then
        makefolder("V.G Hub")
    end
    
    G.Settings = {}
    local Pcall = pcall(function()
        if isfile("V.G Hub//" .. Name) then
            readfile("V.G Hub//" .. Name)
        else
            writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Des))
        end
    end)
    
    if isfile("V.G Hub//" .. Name) and readfile("V.G Hub//" .. Name) then
        Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))
    end
    
    local Yes = {
        "Kick",
        "kick",
    }
    
    local Disables = {
        Error,
        MessageOut,
        Idled
    }
    
    
    local OldNameCall = nil
    OldNameCall = hookmetamethod(game, "__namecall", function(...)
        local Args = {...}
        local A, B, C = ...
        if table.find(Yes, getnamecallmethod()) and A == Player then
            return
        end
        if type(A) ~= "Instance" then
            return OldNameCall(...)
        end
        return OldNameCall(...)
    end)
    
    
    if setfflag then
        setfflag("HumanoidParallelRemoveNoPhysics", "False")
        setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
    end
    if setfpscap then
        setfpscap(100)
    end
    
    G.GetFunction = function(A)
        for i,v in next, getgc() do
            if type(v) == "function" and getinfo(v).name == A and islclosure(v) then
                return v 
            end
        end
    end
    
    G.Teleport = function(A, B, Toggle)
        if Toggle and A and B then
            A.CFrame = B
        end
        return A, B, Toggle
    end
    
    G.DisableConnection = function(A)
        for i,v in next, getconnections(A) do 
            v:Disable()
        end
        return A
    end
    
    G.FireConnection = function(A)
        for i,v in next, getconnections(A) do
            v:Fire()
        end
    end
    
    G.Tween = function(A, B, C)
        if A and B then
            local Time = (B.Position - A.Position).Magnitude / C 
            local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
            local Tween = TweenService:Create(A, Info, {CFrame = CFrame.new(B.Position)})
            Tween:Play()
            if Tween.Completed then
                Tween.Completed:Wait()
            end
        end
        return A, B, C
    end
    
    G.Save = function()
        pcall(function()
            writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Settings))
        end)
    end
    
    G.ServerHop = function()
        spawn(function()
            while wait() do
                pcall(function()
                    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                    for i,v in next, Gay.data do
                        if v.playing < 2 then
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                            break
                        end
                    end
                end)
                wait(4)
            end
        end)
    end
    
    G.Rejoin = function()
        return TeleportService:Teleport(game.PlaceId, Player)
    end
    
    G.NoClip = function(A)
        return A:ChangeState(11)
    end
    G.NoClip2 = function(A)
        for i,v in next, A:GetChildren() do
            if v:IsA("BasePart") then
                v.CanCollide = false 
            end
        end
    end
    G.SendNotification = function(Title, Text, Icon, Duration)
        return StarterGui:SetCore("SendNotification", {Title = Title, Text = Text, Icon = Icon, Duration = Duration})
    end
    
    G.Mag = function(A, B)
        return (A.Position - B.Position).Magnitude
    end
    if game.GameId ~= 111958650 then
        for i,v in next, Disables do 
            for i,v in next, getconnections(v) do
                v:Disable()
            end
        end
    end
    ScriptContext:SetTimeout(0)
    local getconstants=debug.getconstants or getconstants;local getidentity=get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity;local setidentity=set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity;local hookfunc=hookfunction or hookfunc or detour_function;for a,b in next,getgc()do if type(b)=="function"and islclosure(b)then local c=getconstants(b)if table.find(c,"Detected")and table.find(c,"crash")then hookfunc(b,function()return task.wait(math.huge)end)end end end
    
    
    
    local VirtualUser = VirtualUser
    Player.Idled:connect(
        function()
            VirtualUser:ClickButton2(Vector2.new())
        end
    )
    
    for i,v in pairs(getconnections(Player.Idled)) do
        v:Disable()
    end
    repeat wait() until Player.PlayerGui:FindFirstChild("PlayButton",true)
    RunService.Stepped:Connect(function()
        pcall(function()
            if Player.PlayerGui:FindFirstChild("NewsApp",true).Enabled then
                for i,v in pairs(getconnections(Player.PlayerGui:FindFirstChild("PlayButton",true).MouseButton1Click)) do
                    v:Fire()
                end
            end
            if Player.PlayerGui:FindFirstChild("ChooseParent",true) then
                for i,v in pairs(getconnections(Player.PlayerGui:FindFirstChild("ChooseParent",true).MouseButton1Click)) do
                    v:Fire()
                end
            end
            if Workspace:FindFirstChild("ServerSidedMapSeats") then
                Workspace.ServerSidedMapSeats:Destroy()
            end
        end)
    end)
    
    local Table = {6152116144, 185655149}
    local Set = setfpscap
    local getupvalue = getupvalue or debug.getupvalue
    local getconstant = getconstant or debug.getconstant
    local getconstants = getconstants or debug.getconstants
    local getgc = getgc or get_gc_objects or debug.getgc
    local getreg = getreg or getregistry or debug.getregistry
    local get_thread_context = get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
    local get_thread_identity = get_thread_context
    local set_thread_context = set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
    local set_thread_identity = set_thread_context
    local Remotes = {}
    local Inventorys = ReplicatedStorage.ClientDB.Inventory
    local InventoryGiftsSubDB = require(Inventorys.InventoryGiftsSubDB)
    
    local Stores = {
        "FireDimension",
        "CoffeeShop",
        "Supermarket",
        "PizzaShop",
        "ToyShop",
        "Obbies",
        "Neighborhood",
        "CampingShop",
        "AutoShop",
        "Nursery",
        "Cave",
        "IceCream",
        "PotionShop",
        "SkyCastle",
        "Hospital",
        "HatShop",
        "PetShop",
        "School",
        "BabyShop",
        "HotSpringHouse",
        "SafetyHub",
        "DebugInterior",
        "VIP",
        "Salon",
        "SpleefMinigame",
        "SimonSaysMinigame",
        "WinterCastle"
    }
    
    local Baths = {
        "StylishShower",
        "CheapBathtub",
        "ModernShower",
        "Bathtub",
        "GingerbreadShower",
        "HotTub"
    }
    
    local FreeFoods = {
        "ham_vip",
        "water_vip",
        "chocolate_milk_vip",
        "popcorn_vip",
        "marshmallow_on_a_stick",
        "healing_apple",
        "teachers_apple"
    }
    local IgnoreFoods = {
        "pet_age_potion",
        "sandwich",
        "sandwich-default",
        "hotdog",
        "cheese",
        "apple",
        "pizza",
        "ham",
        "water",
        "raspberry_pie",
        "tea",
        "chocolate_milk",
        "donut",
        "ham_vip",
        "water_vip",
        "chocolate_milk_vip",
        "popcorn_vip",
        "marshmallow_on_a_stick",
        "healing_apple",
        "teachers_apple"
    }
    
    local Beds = {
        "FancyPetBed",
        "ModernPetBed",
        "CircularPetBed",
        "RectangularPetBed",
        "NormalCrib",
        "BasicCrib",
        "RoyalCrib",
        "PoshCrib",
    }
    local Tasks = {
        "hungry",
        "sleepy",
        "thirsty",
        "bored",
        "dirty",
        "camping",
        "sick",
        "school",
        "pool_party",
        "salon",
        "pizza_party"
    }
    
    local Buypets = {
        "sky_ux_2023_grinmoire",
        "chiprac_2023_chipmunk",
        "chiprac_2023_raccoon"
    }

    local Eggs = {
        "urban_2023_egg",
        "royal_egg",
        "regular_pet_egg",
        "retired_egg",
        "cracked_egg"
    }
    
    local gifts = {
        "wings_2022_bucks_wing_chest",
        "legend_hat_2022_regal_chest",
        "legend_hat_2022_simple_chest",
        "massivegift",
        "biggift",
        "smallgift"
    }


    local Obbys = {
        "miniworld",
        "coastal_climb",
        "shipwreck_bay",
        "ancient_ruins",
        "lonelypeak",
        "pyramid",
        "tinyisles"
    }
    
    local RetardedBullShit = {
        "CashRegister",
        "GoldenCashRegister"
    }
    
    local PP = {}
    
    local Part = Instance.new("Part")
    Part.Name = "P"
    Part.Size = Vector3.new(9e9,0,9e9)
    Part.Anchored = true
    Part.Transparency = 0.5
    Part.CFrame = CFrame.new(5000,5000,5000)
    Part.Parent = Workspace
    ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("Core"):WaitForChild("InteriorsM"):WaitForChild("InteriorsM")
    local Location = nil
    for i, v in pairs(getgc()) do
        if type(v) == "function" then
            if getfenv(v).script == ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM then
                if table.find(getconstants(v), "LocationAPI/SetLocation") then
                    Location = v
                    break
                end
            end
        end
    end
    
    local SetLocation = function(A, B, C)
        local O = get_thread_identity()
        set_thread_identity(2)
        Location(A, B, C)
        set_thread_identity(O)
    end
    local Home = function()
        if Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model") then
            return Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    end
    local PersonHome = function()
        if Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model") then
            return Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model").Name
        else
            return false
        end
    end
    local Store = function()
        if Workspace.Interiors:FindFirstChildWhichIsA("Model") then
            if not string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"MainMap") and not
                string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"Neighborhood")
            then
                return Workspace.Interiors:FindFirstChildWhichIsA("Model").Name
            else
                return false
            end
        else
            return false
        end
    end
    
    local MainMap = function()
        if Workspace.Interiors:FindFirstChildWhichIsA("Model") then
            if string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"MainMap") then
                return Workspace.Interiors:FindFirstChildWhichIsA("Model").Name
            else
                return false
            end
        else
            return false
        end
    end
    
    local Neighborhood = function()
        if Workspace.Interiors:FindFirstChildWhichIsA("Model") then
            if string.find(Workspace.Interiors:FindFirstChildWhichIsA("Model").Name,"Neighborhood") then
                return Workspace.Interiors:FindFirstChildWhichIsA("Model").Name
            else
                return false
            end
        else
            return false
        end
    end
    
    local GoToStore = function(Name)
        if Store() == Name then
            return true
        end
    
        SetLocation(Name, "MainDoor", {})
    
        while Store() ~= Name do
            wait()
        end
        if Home() then
            return true
        end
        return false
    end
    
    local GoToHome = function()
        SetLocation("housing", "MainDoor", {["house_owner"] = Player})
        while not Home() do
            wait()
    
        end
        if Home() then
    
            return true
        end
    
        return false
    
    end
    
    local GoToNeighborhood = function()
        SetLocation("Neighborhood", "MainDoor", {})
        while not Neighborhood() do
            wait()
    
        end
        if Neighborhood() then
    
            return true
        end
        return false
    end
    
    local GoToMainMap = function()
        SetLocation("MainMap", "Neighborhood/MainDoor", {})
        while not MainMap() do
    
            wait()
        end
        if MainMap() then
    
            return true
        end
        return false
    end
    
    local GoToPersonsHouse = function(Name)
        SetLocation("housing","MainDoor",{["house_owner"] = Players[Name]})
        while not PersonHome() do
    
            wait()
        end
        if PersonHome() then
    
            return true
        end
        return false
    end
    local Bed = function(Name)
        GoToHome()
        Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 
        for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
            if v:FindFirstChildWhichIsA("Model") and (table.find(Beds, v:FindFirstChildWhichIsA("Model").Name)) then
                local String = string.split(v.Name,"/f")[2]
                print(String)
                return "f".. String
            end
        end
    end
    local Cash = function()
        for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
            if v:FindFirstChildWhichIsA("Model") and (table.find(RetardedBullShit, v:FindFirstChildWhichIsA("Model").Name)) then
                local String = string.split(v.Name,"/f")[2]
                print(String)
                return "f".. String
            end
        end
    end
    
    local Showers = function(Name)
        GoToHome()
        Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 
        for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
            if v:FindFirstChildWhichIsA("Model") and (table.find(Baths, v:FindFirstChildWhichIsA("Model").Name)) then
                local String = string.split(v.Name,"true/")[2]
                print(String)
                return String
            end
        end
    end
    
    local NoCliper = function()
        for i,v in next, Player.Character:GetChildren() do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Velocity = Vector3.new(0,0,0)
            end
        end
        return Player.Character
    end
    
    local Neons = {}
    local AilmentFurnitues = {}
    local Neon = {}
    local Spec = {}
    local Key = {}
    local Key3 = {}
    local PetID
    local Pet
    local PetsShow = {}
    local List = {}
    local JoJo = {}
    local GGO = {}
    local Fgpet ={}
    local Fgpetlist = {}
    for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets) do
        local key = tostring(v["id"]) .. " - " .. tostring(v["properties"]["age"]) .. " years old"
        if not table.find(List, Key) and v.kind ~= "practice_dog" then
            PetsShow[key] = v
            table.insert(List, key)
            table.sort(List)
        end
    end

    --Lists only fullgrown pets
    for i,v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets) do
        local key3 = tostring(v["id"]) .. " - " .. tostring(v["properties"]["age"]) .. " years old"
        if not table.find(Fgpetlist, Key3) and v.properties.age == 6 and v.kind ~= "practice_dog" then
            Fgpet[key3] = v
            table.insert(Fgpetlist, key3)
            table.sort(Fgpetlist)
        end
    end

    --Scans inventory and groups all pets into Species NOT individual pet count
    for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets) do
        if not table.find(JoJo,tostring(v["id"])) and v.kind ~= "practice_dog" then
            local Key2 = tostring(v["id"])
            GGO[Key2] = v
            table.insert(JoJo,Key2)
            table.sort(JoJo)
        end
    end


    UserInputService.WindowFocusReleased:Connect(function()
        if Render then
            RunService:Set3dRenderingEnabled(false)
            if table.find(Table, game.PlaceId) then
                Set(30)
            else
                Set(15)
            end
        end
    end)
    UserInputService.WindowFocused:Connect(function()
        if Render then
            RunService:Set3dRenderingEnabled(true)
            Set(100)
        end
    end)
    
    for i, v in pairs(getupvalue(require(ReplicatedStorage.Fsys).load("RouterClient").init, 4)) do
        v.Name = i
    end
    pcall(function()
        ReplicatedStorage.API:FindFirstChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
    end)
    
    local a = {
        ["sleepy"] = function(c)
            spawn(function()
                while wait(3) and c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments and PetFarm do
                    if c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments then
                        ReplicatedStorage:FindFirstChild('HousingAPI/ActivateFurniture',true):InvokeServer(Player, Bed(), 'UseBlock', {['cframe'] = Player.Character.HumanoidRootPart.CFrame}, C)
                    end
                end
            end)
            repeat wait(0) until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ['dirty'] = function(c)
            spawn(function()
                while wait(3) and c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments and PetFarm do
                    if c.Parent == Player.PlayerGui.AilmentsMonitorApp.Ailments then
                        ReplicatedStorage:FindFirstChild("HousingAPI/ActivateFurniture",true):InvokeServer(game:GetService("Players").LocalPlayer, Showers(), 'UseBlock', {['cframe'] = Player.Character.HumanoidRootPart.CFrame}, C)
                    end
                end
            end)
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
            end,
        ["hungry"] = function(c)
            ReplicatedStorage:FindFirstChild("ShopAPI/BuyItem",true):InvokeServer('food', 'pizza', {})
            ReplicatedStorage:FindFirstChild("ToolAPI/BakeItem",true):InvokeServer()
            while Player.Character:FindFirstChild('PizzaTool') do wait() end
            while not Player.Character:FindFirstChild('PizzaTool') do wait() end
            local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
            local Pizza
            for i,v in pairs(Foods) do
                if v.id == 'pizza' then
                    Pizza = v.unique
                    break
                end
            end
            if not Pizza then
                return
            end
            wait(2)
            ReplicatedStorage:FindFirstChild("PetObjectAPI/CreatePetObject",true):InvokeServer("__Enum_PetObjectCreatorType_2", {["unique_id"] = Pizza})
            ReplicatedStorage:FindFirstChild("PetAPI/ConsumeFoodItem",true):FireServer(Pizza)
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["thirsty"] = function(c)
            ReplicatedStorage:FindFirstChild("ShopAPI/BuyItem",true):InvokeServer('food', 'tea', {})
            local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
            local Tea
            for i, v in pairs(Foods) do
                if v.id == 'tea' then
                    Tea = v.unique
                    break
                end
            end
            if not Tea then
                return
            end
            wait(2)
            ReplicatedStorage:FindFirstChild("PetObjectAPI/CreatePetObject",true):InvokeServer("__Enum_PetObjectCreatorType_2", {["unique_id"] = Tea})
            ReplicatedStorage:FindFirstChild("PetAPI/ConsumeFoodItem",true):FireServer(Tea)
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments    
        end,
        ["sick"] = function(c)
            repeat wait(0) ReplicatedStorage:FindFirstChild("MonitorAPI/HealWithDoctor",true):FireServer() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["adoption_party"] = function(c)
            GoToStore('Nursery')
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["school"] = function(c)
            GoToStore('School')
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["pizza_party"] = function(c)
            GoToStore("PizzaShop")
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["salon"] = function(c)
            GoToStore("Salon")
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["pool_party"] = function(c)
            GoToMainMap()
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.StaticMap.Pool.PoolOrigin.Position + Vector3.new(0, 5, 0))
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ["camping"] = function(c)
            GoToMainMap()
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.StaticMap.Campsite.CampsiteOrigin.Position + Vector3.new(0, 5, 0))
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end,
        ['bored'] = function(c)
            GoToMainMap()
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(Workspace.StaticMap.Park.AilmentTarget.Position + Vector3.new(0, 5, 0))
            repeat wait() until c.Parent ~= Player.PlayerGui.AilmentsMonitorApp.Ailments
        end
    }
    



    local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()


    local Window = ArrayField:CreateWindow({
        Name = "ArrayField Example Window",
        LoadingTitle = "ArrayField Interface Suite",
        LoadingSubtitle = "by Arrays",
        ConfigurationSaving = {
           Enabled = true,
           FolderName = nil, -- Create a custom folder for your hub/game
           FileName = "ArrayField"
        },
        Discord = {
           Enabled = false,
           Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
           RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = false, -- Set this to true to use our key system
        KeySettings = {
           Title = "Untitled",
           Subtitle = "Key System",
           Note = "No method of obtaining the key is provided",
           FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
           SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
           GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
           Actions = {
                 [1] = {
                     Text = 'Click here to copy the key link <--',
                     OnPress = function()
                         print('Pressed')
                     end,
                     }
                 },
           Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
        }
     })


--[[
HERE STARTS MY CODE
]]--

--Defining asset functions
local IgnorePets = {
    "practice_dog",
    "dog"
}

local x2RidePots ={
    "queen_bee",
    "diamond_unicorn",
    "lny_2022_dragon",
    "phoenix"
}

function assetsCheckInventory()
    print("assetsCheckInventory is alive!")
    --We define a variable that will hold the returned table from assetsCheckInventory_pets() function
    local PetFor1RPotResults = assetsCheckInventory_pets()
    local PetFor1RPotResults_count = 0
    -- Loop through the table using pairs and count the key-value pairs
    for key, value in pairs(PetFor1RPotResults) do
        PetFor1RPotResults_count = PetFor1RPotResults_count + 1
    end
    print("assetsCheckInventory() Tradeable pets for 1 R pot in inventory: " .. PetFor1RPotResults_count)

    --If Tradeable pets for 1 R potion in inventory >= X then equip pet
    
    local Pets = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets or {}
    local ridePots = assetsCheckInventory_ridePots()
    local flyPots = assetsCheckInventory_flyPots()

    if PetFor1RPotResults_count >= 2 then
        for unique, pet in pairs(Pets) do
            if not table.find(IgnorePets, pet.kind) and not table.find(x2RidePots, pet.kind) and not pet.properties.neon and not pet.properties.ridable and not pet.properties.flyable and pet.properties.age <= 4 then
                PetID = unique -- Store the unique ID of the egg to be equipped
                break -- Exit the loop as soon as an egg is found
            end
        end

        if PetID then
            print(PetID)
            ReplicatedStorage.API["ToolAPI/Unequip"]:InvokeServer(PetID)
            Pet = ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(PetID)
            print("assetsCheckInventory() Equipped Pet for 1x R Potion:", PetID)
        else
            print("assetsCheckInventory() No suitable Pet for 1x R Potion.")
        end

        tradeMessage = "Trading a decent legendary for 1x R pot"
        tradeBot3_OutputTradeMsg(tradeMessage, PetID)

    elseif ridePots >= 1 then
        print("I have 1 or more ride potions")

        local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
        for i,v in pairs(Foods) do
            if v.id == 'pet_riding_potion' then
                rPot= v.unique
                break
            end
        end
        
        ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(rPot,{["use_sound_delay"] = false})


    elseif flyPots >= 1 then
        print("I have 1 or more fly potions")

        local Foods = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}
        for i,v in pairs(Foods) do
            if v.id == 'pet_flying_potion' then
                fPot= v.unique
                break
            end
        end
        
        ReplicatedStorage.API["ToolAPI/Equip"]:InvokeServer(fPot,{["use_sound_delay"] = false})
    end
    --Call function to start sending messages to server

end

function assetsCheckInventory_pets()
    print("assetsCheckInventory_pets is alive!")
    local Key_TradeBot = {}
    local PetsShow_TradeBot = {}
    local ListPets_TradeBot = {}
   
    for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets) do
        local TableKey_TradeBot = tostring(v["id"]) .. " - " .. tostring(v["properties"]["age"]) .. " years old " .. "Ride: " .. tostring(v["properties"]["rideable"]) .. " Fly: " .. tostring(v["properties"]["flyable"]) .. " Neon: " .. tostring(v["properties"]["neon"])
        --Filter out any pets that are present in IgnorePets and also ignores pets that are 5 years old(post-teen) or more
        if not table.find(ListPets_TradeBot, Key_TradeBot) and not table.find(IgnorePets, v.kind) and not table.find(x2RidePots, v.kind) and not v.properties.neon and not v.properties.ridable and not v.properties.flyable and v.properties.age <= 4 then
            
            PetsShow_TradeBot[TableKey_TradeBot] = v
            table.insert(ListPets_TradeBot, TableKey_TradeBot)
            table.sort(ListPets_TradeBot)

        end
    end
    
    for index, value in ipairs(ListPets_TradeBot) do
        print(index, value)
    end

    return ListPets_TradeBot
end

function assetsCheckInventory_ridePots()
    local itemCounter = 0
    for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food) do
        if v["id"] == "pet_riding_potion" then
            itemCounter = itemCounter + 1 -- Remove 'local' here
            print(v.id)
        end
    end
    return itemCounter
end

function assetsCheckInventory_flyPots()
    local itemCounter = 0
    for i, v in pairs(require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food) do
        if v["id"] == "pet_flying_potion" then
            itemCounter = itemCounter + 1 -- Remove 'local' here
            print(v.id)
        end
    end
    return itemCounter
end


function assetsCheckGuiVisibility(Gui, action)
    local guiElement = Gui

    while true do
        -- Check if the GUI element is visible
        local isVisible = guiElement.Visible

        if isVisible then
            print("The GUI element is on screen and visible!")
            if action == "AcceptTrade" then
                getgenv().FoundGuiElement = true
                assetsAcceptTrade()

                return getgenv().FoundGuiElement
            end
        else
            getgenv().FoundGuiElement = false
            print("The GUI element is off screen or not visible.")

            return getgenv().FoundGuiElement
        end

        -- Adjust the delay as needed (e.g., 1 second)
        wait(1)
    end
end
function assetsAcceptTrade()
    pcall(function()
        for i,v in pairs(Players:GetPlayers()) do
            if v ~= Player then
                wait(1.5)
                ReplicatedStorage.API:FindFirstChild("TradeAPI/AcceptOrDeclineTradeRequest"):InvokeServer(v,true)
            end 
        end 
        ReplicatedStorage.API:FindFirstChild("TradeAPI/AcceptNegotiation"):FireServer()
        ReplicatedStorage.API:FindFirstChild("TradeAPI/ConfirmTrade"):FireServer()
        for i,v in pairs(getconnections(Player.PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate.MouseButton1Click)) do
            v.Function()
            v:Fire()
        end 
    end)
end
--End of asset function

getgenv().tradeBotToggle = false

function startTradeBot()
    spawn(function()
        if tradeBotToggle then
            print("startTradeBot is alive!")

            wait(1)
            tradeBot1_TpMainMap()
        end
    end)
end

--[[

MAIN SCRIPT FUNCTIONS START HERE

]]--

function tradeBot1_TpMainMap()
    spawn(function()
        if tradeBotToggle then
            print("tradeBot1_TpMainMap is alive!")

            if MainMap() then
                print("tradeBot1_TpMainMap - already in mainmap")
                tradeBot2_CheckInventory()
            else
                print("tradeBot1_TpMainMap - tp to main map")
                GoToMainMap()
                local characterLoad = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
                if characterLoad then
                    Player.Character.HumanoidRootPart.CFrame = Workspace.Interiors:FindFirstChildWhichIsA("Model"):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6))
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(-247.35408, 17.3820152, -1518.88879)
                    wait(2)
                    tradeBot2_CheckInventory()
                end
            end
        end
    end)
end

function tradeBot2_CheckInventory()
    if tradeBotToggle then
            if MainMap() then
                print("tradeBot2_CheckInventory is alive!")
                assetsCheckInventory()
            else
                tradeBot1_TpMainMap()
            end
    end
end


function tradeBot3_OutputTradeMsg(msg, unique)
    print("tradeBot3_OutputTradeMsg() is alive!")

    while tradeBotToggle do
        chatMsg = msg
        unique = unique

        local Framework = loadstring(game:HttpGet("https://raw.githubusercontent.com/Poll0none/Snippets/main/CHAT-Framework.lua", true))()
        local services = Framework.Services 

        local isTradeGuiActive = assetsCheckGuiVisibility(Player.PlayerGui.DialogApp.Dialog.HeaderDialog, "AcceptTrade")
        if isTradeGuiActive then
            print("FoundGuiElement is true.")
        else
            wait(math.random(2, 8))
            services.TextChatService.TextChannels["RBXGeneral"]:SendAsync(chatMsg)
            print(unique)
        end

        print("tradeBot3_OutputTradeMsg() - Ohhh a trade")
    end
end


--[[

MAIN SCRIPT FUNCTIONS END HERE

]]--

local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local MainTab1 = MainTab:CreateSection("Trade Bot settings",false)


local Toggle = MainTab:CreateToggle({
Name = "Trade Bot Toggle",
Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
CurrentValue = false,
Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
Callback = function(Value)
    getgenv().tradeBotToggle = Value
    startTradeBot()
end,
})


--IDK why but it was at then end in the original
for i, v in next, Games do
    if i == game.PlaceId then
        loadstring(game:HttpGet(v))()
    end
end

for i, v in next, Unknown do
    loadstring(game:HttpGet(v))()
end

--KILL GUI EXECUTE
end
