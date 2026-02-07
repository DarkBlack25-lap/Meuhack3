-- DᴀʀᴋBʟᴀᴄᴋ Hub: Brainrot Stealer (Visão Limpa)
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Clean"; sg.ResetOnSpawn = false

-- 1. BOTÃO PARA MINIMIZAR (Círculo Flutuante)
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 45, 0, 45); openBtn.Position = UDim2.new(0.02, 0, 0.4, 0)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); openBtn.Text = "DB"; openBtn.TextColor3 = Color3.new(1,0,0)
Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", openBtn).Color = Color3.new(1, 0, 0)

-- 2. MENU PRINCIPAL (Compacto e Arrastável)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 200, 0, 240); main.Position = UDim2.new(0.5, -100, 0.5, -120)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); main.Visible = false
Instance.new("UICorner", main)
local mStroke = Instance.new("UIStroke", main); mStroke.Color = Color3.fromRGB(255, 0, 0)

-- Lógica de Arrastar (Para não tapar a visão)
local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = main.Position
    end
end)
main.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
end)

openBtn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

-- TÍTULO COMPACTO
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30); title.Text = "DᴀʀᴋBʟᴀᴄᴋ Sᴛᴇᴀʟᴇʀ"; title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold; title.TextSize = 16; title.BackgroundTransparency = 1

-- BOTÕES (Mesmas funções, tamanho reduzido)
local function addBtn(txt, color, y, cb)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1, -20, 0, 35); b.Position = UDim2.new(0, 10, 0, y)
    b.Text = txt; b.BackgroundColor3 = color; b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

addBtn("Alcance Ativado", Color3.fromRGB(40, 40, 40), 40, function() print("Reach On") end)
addBtn("Lag Aura: OFF", Color3.fromRGB(150, 0, 0), 80, function() print("Aura Toggle") end)
addBtn("Velocidade [E]", Color3.fromRGB(0, 120, 200), 120, function() lp.Character.Humanoid.WalkSpeed = 80 end)
addBtn("Auto-Click", Color3.fromRGB(0, 150, 50), 160, function() print("Click On") end)
addBtn("Fechar Menu", Color3.fromRGB(20, 20, 20), 200, function() main.Visible = false end)
