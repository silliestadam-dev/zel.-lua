--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- [[ silliestzel gui - CUSTOM SPEED EDITION ]] --

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner_Main = Instance.new("UICorner")
local TitleBar = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local CommandBox = Instance.new("TextBox")
local SpeedBox = Instance.new("TextBox") -- خانة السرعة الجديدة
local SendBtn = Instance.new("TextButton")
local SpamBtn = Instance.new("TextButton")
local AntiCopyBtn = Instance.new("TextButton")

-- 1. الإعدادات الأساسية
ScreenGui.Name = "silliestzel_Custom"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- 2. الإطار الرئيسي (زدنا الطول شوي عشان الخانة الجديدة)
MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 220) 
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.BorderSizePixel = 0

UICorner_Main.CornerRadius = UDim.new(0, 10)
UICorner_Main.Parent = MainFrame

-- 3. العنوان
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.Text = "  [ silliestzel gui ]"
TitleBar.TextColor3 = Color3.fromRGB(0, 170, 255)
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextSize = 14
TitleBar.TextXAlignment = Enum.TextXAlignment.Left

local UICorner_Title = Instance.new("UICorner")
UICorner_Title.CornerRadius = UDim.new(0, 10)
UICorner_Title.Parent = TitleBar

-- زر الإغلاق
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -25, 0.5, -10)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
local UICorner_Close = Instance.new("UICorner")
UICorner_Close.CornerRadius = UDim.new(1, 0)
UICorner_Close.Parent = CloseBtn

-- 4. خانة الأوامر
CommandBox.Parent = MainFrame
CommandBox.Size = UDim2.new(0, 180, 0, 30)
CommandBox.Position = UDim2.new(0, 10, 0, 40)
CommandBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CommandBox.PlaceholderText = "Enter Command..."
CommandBox.Text = ""
CommandBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBox.Font = Enum.Font.Gotham
local UICorner_B1 = Instance.new("UICorner")
UICorner_B1.CornerRadius = UDim.new(0, 6)
UICorner_B1.Parent = CommandBox

-- 5. خانة تحديد السرعة (Speed TextBox)
SpeedBox.Parent = MainFrame
SpeedBox.Size = UDim2.new(0, 180, 0, 30)
SpeedBox.Position = UDim2.new(0, 10, 0, 75)
SpeedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBox.PlaceholderText = "Speed (e.g. 1.5)"
SpeedBox.Text = "1.5" -- القيمة الافتراضية
SpeedBox.TextColor3 = Color3.fromRGB(0, 255, 150) -- لون مميز للسرعة
SpeedBox.Font = Enum.Font.Gotham
local UICorner_B2 = Instance.new("UICorner")
UICorner_B2.CornerRadius = UDim.new(0, 6)
UICorner_B2.Parent = SpeedBox

-- 6. أزرار التحكم
SendBtn.Parent = MainFrame
SendBtn.Size = UDim2.new(0, 180, 0, 30)
SendBtn.Position = UDim2.new(0, 10, 0, 110)
SendBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
SendBtn.Text = "Execute Once"
SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendBtn.Font = Enum.Font.GothamBold
local UICorner_S = Instance.new("UICorner")
UICorner_S.CornerRadius = UDim.new(0, 6)
UICorner_S.Parent = SendBtn

SpamBtn.Parent = MainFrame
SpamBtn.Size = UDim2.new(0, 180, 0, 30)
SpamBtn.Position = UDim2.new(0, 10, 0, 145)
SpamBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpamBtn.Text = "Start Spam"
SpamBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
SpamBtn.Font = Enum.Font.GothamBold
local UICorner_Sp = Instance.new("UICorner")
UICorner_Sp.CornerRadius = UDim.new(0, 6)
UICorner_Sp.Parent = SpamBtn

AntiCopyBtn.Parent = MainFrame
AntiCopyBtn.Size = UDim2.new(0, 180, 0, 30)
AntiCopyBtn.Position = UDim2.new(0, 10, 0, 180)
AntiCopyBtn.BackgroundColor3 = Color3.fromRGB(70, 20, 140)
AntiCopyBtn.Text = "Anti-Copy"
AntiCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiCopyBtn.Font = Enum.Font.GothamBold
local UICorner_A = Instance.new("UICorner")
UICorner_A.CornerRadius = UDim.new(0, 6)
UICorner_A.Parent = AntiCopyBtn

-- [[ الوظائف ]] --

local function execute()
    local cmd = CommandBox.Text
    if cmd ~= "" then
        pcall(function()
            game:GetService("ReplicatedStorage").HDAdminHDClient.Signals.RequestCommandModification:InvokeServer(cmd)
        end)
    end
end

local isSpamming = false
SpamBtn.MouseButton1Click:Connect(function()
    isSpamming = not isSpamming
    if isSpamming then
        -- قراءة السرعة من الخانة وتحويلها لرقم
        local speed = tonumber(SpeedBox.Text) or 1.5 -- إذا كتب كلام خطأ يرجع لـ 1.5 تلقائياً
        
        SpamBtn.Text = "STOP"
        SpamBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        
        task.spawn(function()
            while isSpamming do
                execute()
                task.wait(speed) -- يستخدم السرعة اللي حددتها أنت
            end
        end)
    else
        SpamBtn.Text = "Start Spam"
        SpamBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

-- وظيفة الحذف (Anti-Copy)
AntiCopyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local assets = game:GetService("ReplicatedStorage"):FindFirstChild("HDAdminHDClient")
        if assets and assets:FindFirstChild("Assets") and assets.Assets:FindFirstChild("NightVision") then
            assets.Assets.NightVision:Destroy()
        end
        local playerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui and playerGui:FindFirstChild("HDAdminInterface") then
            playerGui.HDAdminInterface:Destroy()
        end
        AntiCopyBtn.Text = "CLEANED!"
        task.wait(1)
        AntiCopyBtn.Text = "Anti-Copy"
    end)
end)

SendBtn.MouseButton1Click:Connect(execute)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
