-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
-- [[ ZEL GUI - INSTANT LOGS NO WAIT ]]

local amount = 100000 -- الكمية الإجمالية
local remote = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
local runService = game:GetService("RunService")

local sent = 0
local connection -- تعريف الاتصال عشان نقدر نفصله

connection = runService.Heartbeat:Connect(function()
    -- يرسل 30 أمر في كل نبضة (Frame) - سرعة خيالية وصافية
    for i = 1, 30 do
        if sent >= amount then 
            connection:Disconnect() -- يوقف السكربت إذا وصل للعدد المطلوب
            break 
        end
        
        sent = sent + 1
        local msg = "/e 1" .. string.rep(" ", sent % 8)
        
        if remote then
            -- إرسال خام للسجلات فقط
            remote:FireServer(msg)
        else
            -- للنظام الجديد
            local tcs = game:GetService("TextChatService")
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then channel:SendAsync(msg) end
        end
    end
end)

print("ZEL GUI: Heartbeat Nuke Active! Check CLogs.")
