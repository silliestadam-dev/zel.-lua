-- [[ zel gui backdoor - LALOL HUB STYLE ]] --
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- تنظيف النسخ القديمة
if CoreGui:FindFirstChild("ZelLalolBackdoor") then CoreGui:FindFirstChild("ZelLalolBackdoor"):Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZelLalolBackdoor"
ScreenGui.Parent = CoreGui

-- [[ محرك الأنيميشن والسحب ]] --
local function Ripple(obj)
    obj.MouseButton1Click:Connect(function()
        local r = Instance.new("Frame", obj)
        r.BackgroundColor3 = Color3.new(1,1,1)
        r.BackgroundTransparency = 0.8
        r.Size = UDim2.new(0,0,0,0)
        Instance.new("UICorner", r).CornerRadius = UDim.new(1,0)
        r:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), "Out", "Quart", 0.3)
        task.wait(0.3)
        r:Destroy()
    end)
end

-- [[ الواجهة الرئيسية ]] --
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local MStroke = Instance.new("UIStroke", Main)
MStroke.Color = Color3.fromRGB(40, 40, 40)
MStroke.Thickness = 1.5

-- Sidebar (ستايل لالول)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

local Logo = Instance.new("TextLabel", Sidebar)
Logo.Text = "zel gui"
Logo.Size = UDim2.new(1, 0, 0, 60)
Logo.TextColor3 = Color3.fromRGB(0, 255, 150)
Logo.Font = Enum.Font.Code
Logo.TextSize = 22
Logo.BackgroundTransparency = 1

-- زر الإغلاق (Kill) والتصغير
local Controls = Instance.new("Frame", Main)
Controls.Size = UDim2.new(0, 60, 0, 30)
Controls.Position = UDim2.new(1, -70, 0, 10)
Controls.BackgroundTransparency = 1

local Close = Instance.new("TextButton", Controls)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1,0)

-- [[ محاكي التبويبات ]] --
local Container = Instance.new("Frame", Main)
Container.Position = UDim2.new(0, 150, 0, 50)
Container.Size = UDim2.new(1, -160, 1, -60)
Container.BackgroundTransparency = 1

local Tabs = {}
local TabButtons = Instance.new("Frame", Sidebar)
TabButtons.Size = UDim2.new(1, 0, 1, -70)
TabButtons.Position = UDim2.new(0, 0, 0, 70)
TabButtons.BackgroundTransparency = 1
Instance.new("UIListLayout", TabButtons).Padding = UDim.new(0, 5)

local function NewTab(name, isDefault)
    local F = Instance.new("ScrollingFrame", Container)
    F.Size = UDim2.new(1, 0, 1, 0)
    F.Visible = isDefault
    F.BackgroundTransparency = 1
    F.ScrollBarThickness = 0
    Instance.new("UIListLayout", F).Padding = UDim.new(0, 10)

    local B = Instance.new("TextButton", TabButtons)
    B.Size = UDim2.new(1, -20, 0, 35)
    B.Position = UDim2.new(0, 10, 0, 0)
    B.BackgroundColor3 = isDefault and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(20, 20, 20)
    B.Text = name
    B.TextColor3 = isDefault and Color3.fromRGB(0, 255, 150) or Color3.new(1,1,1)
    B.Font = Enum.Font.Code
    Instance.new("UICorner", B)
    
    B.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do t.F.Visible = false t.B.BackgroundColor3 = Color3.fromRGB(20, 20, 20) t.B.TextColor3 = Color3.new(1,1,1) end
        F.Visible = true
        B.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        B.TextColor3 = Color3.fromRGB(0, 255, 150)
    end)
    Tabs[name] = {F = F, B = B}
    return F
end

-- الأقسام
local ScanTab = NewTab("Backdoor", true)
local ConsoleTab = NewTab("Executor", false)

-- [[ محتوى قسم الـ Backdoor (الفحص) ]] --
local ScanBtn = Instance.new("TextButton", ScanTab)
ScanBtn.Size = UDim2.new(1, 0, 0, 45)
ScanBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
ScanBtn.Text = "SCAN SERVER FOR VULNS"
ScanBtn.Font = Enum.Font.Code
ScanBtn.TextColor3 = Color3.new(0,0,0)
Instance.new("UICorner", ScanBtn)

local Status = Instance.new("TextLabel", ScanTab)
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Text = "Ready to scan..."
Status.TextColor3 = Color3.fromRGB(150, 150, 150)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.Code

-- [[ محتوى قسم الـ Executor ]] --
local Input = Instance.new("TextBox", ConsoleTab)
Input.Size = UDim2.new(1, 0, 0, 150)
Input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Input.PlaceholderText = "Enter require(ID) or Code here..."
Input.Text = ""
Input.MultiLine = true
Input.TextColor3 = Color3.new(1,1,1)
Input.Font = Enum.Font.Code
Input.TextYAlignment = Enum.TextYAlignment.Top
Instance.new("UICorner", Input)

-- [[ منطق الفحص الحقيقي ]] --
local SelectedRemote = nil

ScanBtn.MouseButton1Click:Connect(function()
    Status.Text = "Scanning all models & remotes..."
    for _, child in pairs(ScanTab:GetChildren()) do
        if child:IsA("TextButton") and child ~= ScanBtn then child:Destroy() end
    end

    local found = 0
    local function Check(folder)
        for _, obj in pairs(folder:GetDescendants()) do
            if obj:IsA("RemoteEvent") then
                found = found + 1
                local rb = Instance.new("TextButton", ScanTab)
                rb.Size = UDim2.new(1, 0, 0, 40)
                rb.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                rb.Text = "Target: " .. obj.Name
                rb.TextColor3 = Color3.new(1,1,1)
                rb.Font = Enum.Font.Code
                Instance.new("UICorner", rb)
                
                rb.MouseButton1Click:Connect(function()
                    SelectedRemote = obj
                    Status.Text = "Selected: " .. obj.Name
                    Status.TextColor3 = Color3.fromRGB(0, 255, 150)
                end)
            end
        end
    end
    Check(game:GetService("ReplicatedStorage"))
    Check(game:GetService("Workspace"))
    Status.Text = "Found " .. found .. " Potential Remotes"
end)

local ExecBtn = Instance.new("TextButton", ConsoleTab)
ExecBtn.Size = UDim2.new(1, 0, 0, 45)
ExecBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
ExecBtn.Text = "EXECUTE ON SERVER"
ExecBtn.TextColor3 = Color3.new(0,0,0)
ExecBtn.Font = Enum.Font.Code
Instance.new("UICorner", ExecBtn)

ExecBtn.MouseButton1Click:Connect(function()
    if SelectedRemote then
        SelectedRemote:FireServer(Input.Text)
        ExecBtn.Text = "SENT!"
        task.wait(1)
        ExecBtn.Text = "EXECUTE ON SERVER"
    else
        ExecBtn.Text = "SELECT A REMOTE FIRST!"
        task.wait(1)
        ExecBtn.Text = "EXECUTE ON SERVER"
    end
end)

-- [[ زر الفتح Z ]] --
local Toggle = Instance.new("TextButton", ScreenGui)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Position = UDim2.new(0, 20, 0.8, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Toggle.Text = "Z"
Toggle.TextColor3 = Color3.fromRGB(0, 255, 150)
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

local isOpen = true
Toggle.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    Main:TweenPosition(isOpen and UDim2.new(0.5, -250, 0.5, -175) or UDim2.new(0.5, -250, 1.5, 0), "Out", "Quart", 0.5, true)
end)

Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- سحب الواجهة
local function Drag(f)
    local d, s, p
    f.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true; s = i.Position; p = f.Position end end)
    UserInputService.InputChanged:Connect(function(i) if d and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - s
        f.Position = UDim2.new(p.X.Scale, p.X.Offset + delta.X, p.Y.Scale, p.Y.Offset + delta.Y)
    end end)
    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)
end
Drag(Main)
