local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Sina is cute uwu") -- Creates the window
local b = w:CreateFolder("Main") -- Creates the folder(U will put here your buttons,etc)
local m = w:CreateFolder("Misc") -- Creates the folder(U will put here your buttons,etc)
local player = game.Players.LocalPlayer
local coinpath = game:GetService("Workspace").spawnedCoins.Valley
local part,ctool,sel,cursword,selected,inst
local waitt = 2
local waitth = 2
local hoopath = game:GetService("Workspace").Hoops
_G.coincollect = false;
local coincollect = function()
    while _G.coincollect == true and wait() do 
        for i,v in pairs(coinpath:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(waitt)
            if _G.coincollect ~= true then
                return
            end
        end
        wait()
    end
end
_G.hoopcollect = false;
local hoopcollect = function()
    while _G.hoopcollect == true and wait() do 
        for i,v in pairs(hoopath:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.touchPart.CFrame
            wait(waitth)
            if _G.hoopcollect ~= true then
                return
            end
        end
        wait()
    end
end
local getsword = function()
    for i,v in pairs(player.Character:GetChildren()) do
        if v:IsA("Tool") then
            selsword = v
            return selsword
       end
    end
end
local getsell = function()
    for i,v in pairs(game:GetService("Workspace").sellAreaCircles:GetChildren()) do
        print(v,v.areaName.Value)
        if v.areaName.Value == "Blazing Vortex Island" then
            print("getitsell")
            
            return v
        end
    end
end
_G.autopunch = false;
local autopunch = function()
   while _G.autopunch == true do
        cursword = getsword()
        if cursword == nil then
            while cursword == nil do
                cursword = getsword()
                print("Waiting for a sword to be availabe")
                wait()
            end
        end
        game.Players.LocalPlayer.Character:FindFirstChild(cursword.Name):Activate()
        wait()
    end
end
_G.autosell = false;
local autosell = function()
    sellplace = getsell()
    while _G.autosell == true do
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, sellplace.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, sellplace.circleInner, 1)
        wait()
    end
end
local setwalkspeed = function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end
local setjumppwer = function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end
_G.noclip = false
local noclip = function(s)
    while _G.noclip == true do
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:isA("MeshPart") or v:isA("Part") then
                v.CanCollide = s
            end
        end
    end
end











b:Toggle("Coin-collect",function(bool)
    _G.coincollect = bool
    coincollect()
end)
b:Slider("Wait time for Coin Collect",{
    min = 0;
    max = 5; 
    precise = true; 
},function(value)
    waitt = value;
end)
b:Toggle("Hoop-collect",function(bool)
    _G.hoopcollect = bool
    hoopcollect()
end)
b:Slider("Wait time for Hoop Collect",{
    min = 0;
    max = 5; 
    precise = true; 
},function(value)
    waitth = value;
end)
b:Toggle("AutoPunch",function(bool)
    _G.autopunch = bool
    autopunch()
end)
b:Toggle("AutoSell",function(bool)
    _G.autosell = bool
    autosell()
end)
m:Button("Shop GUI",function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,     game:GetService("Workspace").shopAreaCircles.shopAreaCircle19.circleInner, 1)

    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,     game:GetService("Workspace").shopAreaCircles.shopAreaCircle19.circleInner, 0)

end)
m:Button("Upgrade GUI",function()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").skillAreaCircles.skillsAreaCircle19.circleInner, 1)

    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").skillAreaCircles.skillsAreaCircle19.circleInner, 0)

end)
m:Button("Discover all Islands",function()
    for i,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
    end
end)

local teleportto = function(d)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = d.CFrame
end

m:Button("Teleport",function()
    obj = game:GetService("Workspace").areaTeleportParts:FindFirstChild(selected)
    print(obj.Name,obj)
    teleportto(obj)
end)
local worlds = {}
for i,v in pairs(game:GetService("Workspace").areaTeleportParts:GetChildren()) do
    table.insert(worlds, v.Name)
end
m:Dropdown("Select Island",worlds,true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    selected = mob
end)

m:Slider("Jump power:",{
    min = 0;
    max = 1000; 
    precise = false; 
},function(value)
    setjumppwer(value)
end)
m:Slider("Walk speed:",{
    min = 0;
    max = 1000; 
    precise = false; 
},function(value)
    setwalkspeed(value)
end)
m:Button("Claim All Chests",function()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:isA("Model") then
            if v:FindFirstChild("Chest") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.circleInner, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.circleInner, 1)
                wait()
            end
        end
        wait()
    end
end)
local passes = {}
local gamepasspath = game.Players.LocalPlayer.ownedGamepasses
m:Button("Unlock gamepass",function()
    for i,v in pairs(game.Players.LocalPlayer.PlayerGui.gameGui.shopMenu.menus.passesMenu:GetChildren()) do
        if v:isA("TextButton") then
            table.insert(passes,v.nameLabel.Text)
        end
    end
    for i,v in pairs(passes) do
        inst = Instance.new("BoolValue")
        inst.Parent = gamepasspath
        inst.Name = v
        print("Instance number",i,v)
    end
end)

m:Label("For unlocking elements,Use the button to give yourself the required ranks,",{
    TextSize = 12; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 
m:Label("Then teleport to the element altar using the teleport tool and you can buy the elements for free",{
    TextSize = 10; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

local ranksg = {
"Master Of Elements",
"Golden Sun Shuriken Legend",
"Dragon Evolution Form V",
"Cybernetic Electro Master",
"Aether Genesis Master Ninja",
"Starstrike Master Sensei",
}

local rankpath = game:GetService("Players").DerrickSimpson2.ownedRanks
m:Button("Unlock Elements",function()
    for i,v in pairs(ranksg) do
        inst = Instance.new("BoolValue")
        inst.Parent = rankpath
        inst.Name = v
        print("Instance number",i,v)
    end
end)
