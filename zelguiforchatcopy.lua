local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner_Main = Instance.new("UICorner")
local TitleBar = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local CommandBox = Instance.new("TextBox")
local SpeedBox = Instance.new("TextBox")
local SendBtn = Instance.new("TextButton")
local SpamBtn = Instance.new("TextButton")
local AntiCopyBtn = Instance.new("TextButton")
local TargetBox = Instance.new("TextBox")
local AutoFillBtn = Instance.new("TextButton")

ScreenGui.Name = "silliestzel_Custom"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 310)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0
UICorner_Main.CornerRadius = UDim.new(0, 10)
UICorner_Main.Parent = MainFrame

TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.Text = "  [ silliestzel gui ]"
TitleBar.TextColor3 = Color3.fromRGB(0, 170, 255)
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 14
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)

CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -25, 0.5, -10)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

local function createBox(parent, pos, placeholder, text, color)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(0, 180, 0, 30)
    box.Position = pos
    box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    box.PlaceholderText = placeholder
    box.Text = text
    box.TextColor3 = color
    box.Font = Enum.Font.Gotham
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    return box
end

CommandBox = createBox(MainFrame, UDim2.new(0, 10, 0, 40), "Enter Command...", ";re", Color3.fromRGB(255, 255, 255))
SpeedBox = createBox(MainFrame, UDim2.new(0, 10, 0, 75), "Speed (e.g. 1.5)", "1.5", Color3.fromRGB(0, 255, 150))
TargetBox = createBox(MainFrame, UDim2.new(0, 10, 0, 110), "Target User", "", Color3.fromRGB(255, 255, 255))

local function createBtn(parent, pos, text, color, yOffset)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 180, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, yOffset)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

SendBtn = createBtn(MainFrame, nil, "Execute Once", Color3.fromRGB(0, 120, 215), 145)
SpamBtn = createBtn(MainFrame, nil, "Start Spam", Color3.fromRGB(50, 50, 50), 180)
AutoFillBtn = createBtn(MainFrame, nil, "Fill Target Commands", Color3.fromRGB(180, 0, 0), 215)
AntiCopyBtn = createBtn(MainFrame, nil, "Anti-Copy", Color3.fromRGB(70, 20, 140), 250)

local function executeCombined()
    local cmd = CommandBox.Text
    if cmd ~= "" then
        task.spawn(function()
            task.wait(math.random(5, 15) / 100)
            local args = { cmd }

            pcall(function()
                game:GetService("ReplicatedStorage")
                    .RemoteEvents.ChatEvent:FireServer(unpack(args))
            end)

            pcall(function()
                game:GetService("ReplicatedStorage")
                    .HDAdminHDClient.Signals.RequestCommandModification:InvokeServer(unpack(args))
            end)
        end)
    end
end

SendBtn.MouseButton1Click:Connect(executeCombined)

local isSpamming = false

SpamBtn.MouseButton1Click:Connect(function()
    isSpamming = not isSpamming

    if isSpamming then
        SpamBtn.Text = "STOP"

        task.spawn(function()
            while isSpamming do
                executeCombined()
                task.wait(tonumber(SpeedBox.Text) or 1.5)
            end
        end)
    else
        SpamBtn.Text = "Start Spam"
    end
end)

AutoFillBtn.MouseButton1Click:Connect(function()
    local user = TargetBox.Text

    if user ~= "" then
        CommandBox.Text = ";clogs " .. user .. " :logs " .. user .. " :re " .. user
    end
end)

AntiCopyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        game:GetService("ReplicatedStorage")
            .HDAdminHDClient.Assets.NightVision:Destroy()

        game:GetService("Players")
            .LocalPlayer.PlayerGui.HDAdminInterface:Destroy()

        AntiCopyBtn.Text = "CLEANED!"

        task.wait(1)

        AntiCopyBtn.Text = "Anti-Copy"
    end)
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
