-- [[ zel gui ]] --

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local StartBtn = Instance.new("TextButton")
local CommandBox = Instance.new("TextBox")
local AmountBox = Instance.new("TextBox")
local DelayBox = Instance.new("TextBox")

ScreenGui.Parent = game:GetService("CoreGui")
Main.Name = "ZelGui"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 220, 0, 220)
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

Style(AmountBox, "100", UDim2.new(0, 10, 0, 70))
Style(DelayBox, "0.0000001", UDim2.new(0, 10, 0, 115))

Style(StartBtn, "START BURST", UDim2.new(0, 10, 0, 160), 45)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
StartBtn.Font = Enum.Font.GothamBold

local isRunning = false
local Remote = game:GetService("ReplicatedStorage"):WaitForChild("HDAdminHDClient"):WaitForChild("Signals"):WaitForChild("RequestCommand")

StartBtn.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    if isRunning then
        StartBtn.Text = "STOP"
        StartBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        
        local amt = tonumber(AmountBox.Text) or 100
        local dly = tonumber(DelayBox.Text) or 0
        
        task.spawn(function()
            while isRunning do
                local currentCmd = CommandBox.Text
                for i = 1, amt do
                    task.spawn(function()
                        pcall(function()
                            Remote:InvokeServer(currentCmd)
                        end)
                    end)
                end
                task.wait(dly)
            end
        end)
    else
        StartBtn.Text = "START BURST"
        StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
    end
end)
