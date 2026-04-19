-- [[ zel gui - Modern Premium ]] --

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Header = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local ToggleBtn = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")

-- إعدادات الشاشة
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "ZelPremiumHub"

-- زر الفتح/الإغلاق (تصميم أنيق)
ToggleBtn.Name = "ZelToggle"
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.45, 0)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Text = "Z"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 20
local btnCorner = Instance.new("UICorner", ToggleBtn)
btnCorner.CornerRadius = UDim.new(0, 10)
local btnStroke = Instance.new("UIStroke", ToggleBtn)
btnStroke.Color = Color3.fromRGB(0, 170, 255)
btnStroke.Thickness = 1.5

-- الإطار الرئيسي
Main.Name = "MainFrame"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -130, 0.3, 0)
Main.Size = UDim2.new(0, 260, 0, 360)
Main.ClipsDescendants = true
Main.Visible = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", Main).Color = Color3.fromRGB(35, 35, 35)

-- الهيدر (الجزء العلوي)
Header.Name = "Header"
Header.Parent = Main
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Header.BorderSizePixel = 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

Title.Parent = Header
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "ZEL SKIN HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

-- قائمة السكنات
ScrollFrame.Parent = Main
ScrollFrame.Size = UDim2.new(1, 0, 1, -55)
ScrollFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 2
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

UIPadding.Parent = ScrollFrame
UIPadding.PaddingTop = UDim.new(0, 5)

-- وظيفة التبديل (تأثير بسيط)
ToggleBtn.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

-- وظيفة التنفيذ
local function CharMe(user)
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("RequestCommand", true)
    if remote then
        remote:InvokeServer(";char me " .. user)
    end
end

-- بناء الأزرار بتصميم "Clean"
local function AddUserBtn(name)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = ScrollFrame
    btn.Size = UDim2.new(0, 230, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    -- تأثير عند مرور الماوس والضغط
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35) end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25) end)
    
    btn.MouseButton1Click:Connect(function()
        CharMe(name)
        -- تأثير وميض أزرق عند الضغط
        btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        task.wait(0.1)
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    end)
    
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end

-- القائمة الرسمية
local users = {
    "Ammmoook25", "SLS_PLASMA", "redaa72008", "Rorisang14536", "Prettiestgi15",
    "3fegwieeiyge", "7ixop7", "sjoricsharkie", "FyolaiMarii", "VelWasTakenl",
    "LRXBUNNY118", "Ali_blue345", "Hmood_83", "Hellokitty220247", "batkata260",
    "SAD45_MM2", "JOKERYT305", "loo_OMDS", "capitanamerica8097", "the_leosmar",
    "Nicothebeast_8", "Mistar_Abood", "mhmdali202510", "Pros_Hunter22", "Mo73sh",
    "ck001617", "honeyheart516", "swordx52"
}

for _, user in ipairs(users) do
    AddUserBtn(user)
end

-- تفعيل ميزة السحب (Drag)
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

Main.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
