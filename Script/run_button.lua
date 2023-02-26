-- Pega o serviço de Players e UserInput
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Configura a velocidade normal do personagem
local normalSpeed = 16

-- Configura a posição do botão
local buttonPosition = UDim2.new(0.9, 0, 0.5, 0) -- 50% para cima, 90% para direita

-- Cria uma tela em branco sem ícone
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Enabled = true
screenGui.DisplayOrder = 10 -- Altera a ordem para sobrepor outras GUIs
screenGui.Parent = game:GetService("CoreGui")

-- Cria um botão com cor preta
local button = Instance.new("TextButton")
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Position = buttonPosition
button.Size = UDim2.new(0, 50, 0, 50) -- tamanho fixo de 50x50
button.BackgroundColor3 = Color3.new(0, 2, 0) -- cor
button.BorderSizePixel = 0 -- sem borda
button.Text = "Andar" -- texto 

-- Cria uma variável para controlar se a velocidade está aumentada ou não
local isSpeedBoosted = false

-- Função que altera a velocidade do personagem
local function toggleSpeedBoost()
    isSpeedBoosted = not isSpeedBoosted -- alterna o estado da variável
    
    -- Pega o jogador local e altera sua velocidade
    local player = Players.LocalPlayer
    if isSpeedBoosted then
        player.Character.Humanoid.WalkSpeed = normalSpeed * 2 -- aumenta a velocidade
        button.BackgroundColor3 = Color3.new(0, 1, 0) -- muda a cor do botão para verde
        button.Text = "Correr" -- texto 
    else
        player.Character.Humanoid.WalkSpeed = normalSpeed -- volta para a velocidade normal
        button.BackgroundColor3 = Color3.new(0, 2, 0) -- muda a cor do botão 
       button.Text = "Andar" -- texto 
    end
end

-- Conecta a função ao evento de clique do botão
button.MouseButton1Click:Connect(toggleSpeedBoost)

-- Adiciona o botão à tela
button.Parent = screenGui
