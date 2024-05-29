local userInputService = game:GetService("UserInputService")
local tweenSerivce = game:GetService("TweenService")

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character.Humanoid
local humanoidRootPart = humanoid:FindFirstChild("HumanoidRootPart")
local walkspeed = humanoid.WalkSpeed

local playerCamera = game.Workspace.CurrentCamera

-- Run Settings
local defualtWalkspeed = 16; sprintingSpeed = 20
local defualtFOV = 70; sprintingFOV = 95

local timeToSprint = 0.5


-- SHIFT To Run! 
userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		tweenSerivce:Create(playerCamera, TweenInfo.new(timeToSprint), {FieldOfView = sprintingFOV}):Play()
		tweenSerivce:Create(humanoid, TweenInfo.new(timeToSprint), {WalkSpeed = sprintingSpeed}):Play()
	end
end)

userInputService.InputEnded:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		tweenSerivce:Create(playerCamera, TweenInfo.new(timeToSprint), {FieldOfView = defualtFOV}):Play()
		tweenSerivce:Create(humanoid, TweenInfo.new(timeToSprint), {WalkSpeed = defualtWalkspeed}):Play()
	end
end)
