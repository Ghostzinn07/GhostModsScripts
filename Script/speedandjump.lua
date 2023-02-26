-- cria a janela
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ResetOnSpawn = false

-- define a posição e o tamanho da janela
local windowWidth = 200
local windowHeight = 150
local screenWidth = workspace.CurrentCamera.ViewportSize.X
local screenHeight = workspace.CurrentCamera.ViewportSize.Y
local windowX = screenWidth - windowWidth
local windowY = 0

-- cria o frame da janela
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, windowWidth, 0, windowHeight)
Frame.Position = UDim2.new(0, windowX, 0, windowY)
Frame.BackgroundColor3 = Color3.fromRGB(60, 141, 188)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Mods Ghost"
Title.Size = UDim2.new(1, 0, 0, 20)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(0, 162, 232)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.Parent = Frame

local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(0, 162, 232)
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 16
CloseButton.Parent = Frame

-- adiciona o input para a velocidade
local SpeedInput = Instance.new("TextBox")
SpeedInput.Size = UDim2.new(0, 150, 0, 20)
SpeedInput.Position = UDim2.new(0.5, -75, 0.5, -40)
SpeedInput.BackgroundColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 14
SpeedInput.Text = "Velocidade"
SpeedInput.Parent = Frame

-- adiciona o botão de confirmar a velocidade
local ConfirmButton = Instance.new("TextButton")
ConfirmButton.Text = "Alterar Velocidade"
ConfirmButton.Size = UDim2.new(0, 100, 0, 20)
ConfirmButton.Position = UDim2.new(0.5, -50, 0.5, -10)
ConfirmButton.BackgroundColor3 = Color3.fromRGB(60, 141, 188)
ConfirmButton.TextColor3 = Color3.new(1, 1, 1)
ConfirmButton.Font = Enum.Font.SourceSansBold
ConfirmButton.TextSize = 14
ConfirmButton.Parent = Frame

-- função para fechar a janela quando o botão X é clicado
CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)

-- função para mudar a velocidade do personagem quando o botão de confirmar é pressionado
ConfirmButton.MouseButton1Click:Connect(function()
    local newSpeed = tonumber(SpeedInput.Text)
    if newSpeed ~= nil then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = newSpeed
        game.StarterGui:SetCore("SendNotification", {
            Title = "Mods Ghost",
            Text = "A velocidade foi alterada para " .. newSpeed,
            Duration = 2
        })
    end
end)

-- adiciona o input para o pulo
local JumpInput = Instance.new("TextBox")
JumpInput.Size = UDim2.new(0, 150, 0, 20)
JumpInput.Position = UDim2.new(0.5, -75, 0.5, 20)
JumpInput.BackgroundColor3 = Color3.new(1, 1, 1)
JumpInput.Font = Enum.Font.SourceSans
JumpInput.TextSize = 14
JumpInput.Text = "Pulo"
JumpInput.Parent = Frame

-- adiciona o botão de confirmar o pulo
local ConfirmJumpButton = Instance.new("TextButton")
ConfirmJumpButton.Text = "Alterar Pulo"
ConfirmJumpButton.Size = UDim2.new(0, 100, 0, 20)
ConfirmJumpButton.Position = UDim2.new(0.5, -50, 0.5, 50)
ConfirmJumpButton.BackgroundColor3 = Color3.fromRGB(60, 141, 188)
ConfirmJumpButton.TextColor3 = Color3.new(1, 1, 1)
ConfirmJumpButton.Font = Enum.Font.SourceSansBold
ConfirmJumpButton.TextSize = 14
ConfirmJumpButton.Parent = Frame

-- função para alterar o pulo do personagem quando o botão de confirmar é pressionado
ConfirmJumpButton.MouseButton1Click:Connect(function()
    local newJump = tonumber(JumpInput.Text)
    if newJump ~= nil then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = newJump
        game.StarterGui:SetCore("SendNotification", {
            Title = "Mods Ghost",
            Text = "O pulo foi alterado para " .. newJump,
            Duration = 2
        })
    end
end)
