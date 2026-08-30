-- [[ zel gui - Extreme Speed Edition ]] --

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local StartBtn = Instance.new("TextButton")
local CommandBox = Instance.new("TextBox")
local AmountBox = Instance.new("TextBox")

ScreenGui.Parent = CoreGui
Main.Name = "ZelGui"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 220, 0, 180)
Main.Position = UDim2.new(0.5, -110, 0.4, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function Style(obj, text, pos, height)
    obj.Parent = Main
    obj.Size = UDim2.new(0, 200, 0, height or 35)
    obj.Position = pos
    obj.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    obj.Text = text
    obj.TextColor3 = Color3.new(1, 1, 1)
    obj.Font = Enum.Font.Code
    obj.BorderSizePixel = 0
    Instance.new("UICorner", obj)
end

Style(CommandBox, ";re others ;nv others", UDim2.new(0, 10, 0, 15), 45)
CommandBox.PlaceholderText = "Enter Commands..."

Style(AmountBox, "50", UDim2.new(0, 10, 0, 70)) -- عدد الطلبات في كل فريم (اطار)

Style(StartBtn, "START EXTREME", UDim2.new(0, 10, 0, 120), 45)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
StartBtn.Font = Enum.Font.GothamBold

local isRunning = false
local Connection = nil
local Remote = ReplicatedStorage:WaitForChild("HDAdminHDClient"):WaitForChild("Signals"):WaitForChild("RequestCommand")

-- تسريع الاستدعاء البرمجي لتجنب Lookup overhead
local invoke = Remote.InvokeServer

StartBtn.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    if isRunning then
        StartBtn.Text = "STOP"
        StartBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        
        local burstPerFrame = tonumber(AmountBox.Text) or 50
        
        -- الربط بأسرع Event في روبلوكس (يعمل مع كل فريم)
        Connection = RunService.PreRender:Connect(function()
            local cmd = CommandBox.Text
            for i = 1, burstPerFrame do
                task.spawn(invoke, Remote, cmd)
            end
        end)
    else
        StartBtn.Text = "START EXTREME"
        StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end
    end
end)
