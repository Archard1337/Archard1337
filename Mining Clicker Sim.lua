local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Mining Clicker Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "bitkisel"})
--Values

_G.autoTap = true
_G.autoRebirth = true
_G.autoDaily = true
_G.autoAchievment = true
_G.autoAchievment2 = true
_G.autoAchievment3 = true
_G.buyUpgrade = true
_G.buyUpgrade2 = true
_G.buyUpgrade3 = true
_G.buyUpgrade4 = true
_G.buyUpgrade5 = true
_G.buyUpgrade6 = true
_G.rebirthTime = true
_G.autoHatch = true
_G.selectEgg = "Starter Egg"
_G.antiAFK = true

--Functions


function antiAFK()
    if _G.antiAFK == true then
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end

function autoHatch()
    while _G.autoHatch == true do
        game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(table.unpack({
            [1] = _G.selectEgg,
            [2] = 1,
        }))
    end
end

function autoTap()
    while _G.autoTap == true do
        game:GetService("ReplicatedStorage").Remotes.Click:InvokeServer()
        wait(.1)
    end
end

function autoRebirth()
    while _G.autoRebirth == true do
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
        wait(_G.rebirthTime)
    end    
end

function autoDaily()
    while _G.autoDaily == true do
        local args = {
            [1] = "Coin"
        }
        
        game:GetService("ReplicatedStorage").Remotes.DailyReward:InvokeServer(unpack(args))
        wait(5)
    end
end

function autoAchievment()
    while _G.autoAchievment == true do
        local args = {
            [1] = "mineOre"
        }
        
        game:GetService("ReplicatedStorage").Remotes.claimAchievment:FireServer(unpack(args))
        wait(2)
    end
    
end

function autoAchievment2()
    while _G.autoAchievment2 == true do
        local args = {
            [1] = "unlockArea"
        }
        
        game:GetService("ReplicatedStorage").Remotes.claimAchievment:FireServer(unpack(args))
        wait(2)
    end
    
end

function autoAchievment3()
    while _G.autoAchievment3 == true do
        local args = {
            [1] = "hatchEgg"
        }
        
        game:GetService("ReplicatedStorage").Remotes.claimAchievment:FireServer(unpack(args))
        wait(2)
    end
    
end

function buyUpgrade()
    while _G.buyUpgrade == true do
        local args = {
            [1] = "Ore Pay"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        wait(1)
    end
end

function buyUpgrade2()
    while _G.buyUpgrade2 == true do
        local args = {
            [1] = "Pet Storage"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        wait(1)
    end
end

function buyUpgrade3()
    while _G.buyUpgrade3 == true do
        local args = {
            [1] = "Player Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        wait(1)
    end
end

function buyUpgrade4()
    while _G.buyUpgrade4 == true do
        local args = {
            [1] = "Auto Click Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        wait(1)
    end
end

function buyUpgrade5()
    while _G.buyUpgrade5 == true do
        local args = {
            [1] = "Pets Equipped"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        wait(1)
    end
end

function buyUpgrade6()
    while _G.buyUpgrade6 == true do
        local args = {
            [1] = "Drill Speed"
        }
        
        game:GetService("ReplicatedStorage").Remotes.upgradePlr:FireServer(unpack(args))
        wait(1)
    end
end

--Tabs

local FARMTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local ClaimTab = Window:MakeTab({
    Name = "Auto Claim",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local UpgradeTab = Window:MakeTab({
    Name = "Upgrades",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local EggsTab = Window:MakeTab({
    Name = "Eggs",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--Toggles

FARMTab:AddToggle({
    Name = "Auto Tap",
    Callback = function(Value)
        _G.autoTap =  Value
        autoTap()
    end
})

FARMTab:AddToggle({
    Name = "Auto Rebirth",
    Callback = function(Value)
        _G.autoRebirth =  Value
        autoRebirth()
    end
})

FARMTab:AddSlider({
	Name = "Rebirth Delay",
	Min = 0.1,
	Max = 50,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "ms",
	Callback = function(Value)
		_G.rebirthTime = Value
	end    
})

ClaimTab:AddToggle({
    Name = "Auto Claim Daily Rewards",
    Callback = function(Value)
        _G.autoDaily =  Value
        autoDaily()
    end
})

ClaimTab:AddToggle({
    Name = "Auto Claim Achievment Ore",
    Callback = function(Value)
        _G.autoAchievment =  Value
        autoAchievment()
    end
})

ClaimTab:AddToggle({
    Name = "Auto Claim Achievment Area",
    Callback = function(Value)
        _G.autoAchievment2 =  Value
        autoAchievment2()
    end
})

ClaimTab:AddToggle({
    Name = "Auto Claim Achievment Hatch Egg",
    Callback = function(Value)
        _G.autoAchievment3 =  Value
        autoAchievment3()
    end
})

UpgradeTab:AddToggle({
    Name = "Buy Upgrade Ore Pay",
    Callback = function(Value)
        _G.buyUpgrade =  Value
        buyUpgrade()
    end
})

UpgradeTab:AddToggle({
    Name = "Buy Upgrade Pet Storage",
    Callback = function(Value)
        _G.buyUpgrade2 =  Value
        buyUpgrade2()
    end
})

UpgradeTab:AddToggle({
    Name = "Buy Upgrade Player Speed",
    Callback = function(Value)
        _G.buyUpgrade3 =  Value
        buyUpgrade3()
    end
})

UpgradeTab:AddToggle({
    Name = "Buy Upgrade Auto Click Speed",
    Callback = function(Value)
        _G.buyUpgrade4 =  Value
        buyUpgrade4()
    end
})

UpgradeTab:AddToggle({
    Name = "Buy Upgrade Pets Equipped",
    Callback = function(Value)
        _G.buyUpgrade5 =  Value
        buyUpgrade5()
    end
})

UpgradeTab:AddToggle({
	Name = "Buy Upgrade Drill Speed",
	Callback = function(Value)
        _G.buyUpgrade6 =  Value
        buyUpgrade6()
  	end    
})

EggsTab:AddToggle({
	Name = "Auto Hatch",
    Callback = function(Value)
        _G.autoHatch = Value
        autoHatch()
    end
})

MiscTab:AddToggle({
	Name = "Anti AFK",
    Callback = function(Value)
        _G.antiAFK = Value
        antiAFK()
    end
})



MiscTab:AddSlider({
	Name = "Walkspeed",
	Min = 10,
	Max = 500,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})
--Dropdowns

EggsTab:AddDropdown({
	Name = "Select Egg",
	Default = "Starter Egg",
	Options = {"Starter Egg", "Spotted Egg", "Floral Egg", "Desert Egg", "Snow Egg", "Cave Egg", "Flower Egg", "Space Egg", "Jungle Egg", "Volcano Egg", "Eye Egg", "Hell Egg", "Tundra Egg", "Cactus Egg", "Spotted Egg", "Devil Egg", "Pirate Egg", "Dimension Egg"},
	Callback = function(Value)
        _G.selectEgg = Value
        print(_G.selectEgg)
	end    
})