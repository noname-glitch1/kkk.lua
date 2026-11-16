local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "SystemUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999
gui.Parent = game.CoreGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = gui

local window = Instance.new("Frame")
window.Size = UDim2.new(0.85, 0, 0.55, 0)
window.Position = UDim2.new(0.075, 0, 0.22, 0)
window.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
window.BorderSizePixel = 0
window.Parent = gui
Instance.new("UICorner", window).CornerRadius = UDim.new(0, 12)

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0.5, -25, 0, -25)
icon.BackgroundTransparency = 1
icon.Text = "⚠️"
icon.TextScaled = true
icon.Parent = window

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0.08, 0)
title.BackgroundTransparency = 1
title.Text = "SYSTEM ERROR"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = window

local desc = Instance.new("TextLabel")
desc.Size = UDim2.new(1, -20, 0, 60)
desc.Position = UDim2.new(0, 10, 0.2, 0)
desc.BackgroundTransparency = 1
desc.Text = "Обнаружено несанкционированное вмешательство в память устройства. Доступ ограничен. Введите ключ восстановления или удалите данные аккаунта."
desc.TextColor3 = Color3.fromRGB(50, 50, 50)
desc.TextWrapped = true
desc.Font = Enum.Font.Gotham
desc.TextSize = 12
desc.Parent = window

local input = Instance.new("TextBox")
input.Size = UDim2.new(0.8, 0, 0, 35)
input.Position = UDim2.new(0.1, 0, 0.5, 0)
input.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
input.TextColor3 = Color3.fromRGB(0, 0, 0)
input.PlaceholderText = "RECOVERY KEY"
input.Font = Enum.Font.Gotham
input.TextSize = 14
input.Parent = window
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 6)

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.4, 0, 0, 35)
button.Position = UDim2.new(0.05, 0, 0.7, 0)
button.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Text = "RESTORE"
button.Font = Enum.Font.GothamBold
button.TextSize = 12
button.Parent = window
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

local deleteButton = Instance.new("TextButton")
deleteButton.Size = UDim2.new(0.4, 0, 0, 35)
deleteButton.Position = UDim2.new(0.55, 0, 0.7, 0)
deleteButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteButton.Text = "DELETE DATA"
deleteButton.Font = Enum.Font.GothamBold
deleteButton.TextSize = 12
deleteButton.Parent = window
Instance.new("UICorner", deleteButton).CornerRadius = UDim.new(0, 6)

local password = "lox"

button.MouseButton1Click:Connect(function()
    if input.Text == password then
        gui:Destroy()
        game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    else
        input.Text = "INVALID KEY"
        input.TextColor3 = Color3.fromRGB(255, 0, 0)
        task.wait(1)
        input.Text = ""
        input.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)

deleteButton.MouseButton1Click:Connect(function()
    deleteButton.Text = "DELETING..."
    deleteButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    task.wait(2)
    desc.Text = "ERROR: Connection to server lost. Data not deleted."
    desc.TextColor3 = Color3.fromRGB(255, 0, 0)
    deleteButton.Text = "DELETE DATA"
    deleteButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
end)

pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)