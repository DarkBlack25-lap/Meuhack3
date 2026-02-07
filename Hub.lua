-- DarkBlack Hub: Brainrot Stealer (Visão Limpa)
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Clean_V2"; sg.ResetOnSpawn = false

-- 1. BOTÃO FLUTUANTE (Para abrir quando estiver escondido)
local openIcon = Instance.new("ImageButton", sg)
openIcon.Size = UDim2.new(0, 45, 0, 45); openIcon.Position = UDim2.new(0.1, 0, 0.2, 0)
openIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 20); openIcon.Visible = false
openIcon.Image = "rbxassetid://6031068433" -- Ícone de raio/ninja
Instance.new("UICorner", openIcon).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", openIcon).Color = Color3.new(1, 0, 0)

-- 2. MENU PRINCIPAL
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 240, 0, 280); main.Position = UDim2.new(0.5, -120, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", main)
local mStroke = Instance.new("UIStroke", main); mStroke.Color = Color3.fromRGB(200, 0, 0); mStroke.Thickness = 2

-- Título com o Raio
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -40, 0, 40); title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "⚡ BRAINROT STEALER"; title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = "Left"; title.BackgroundTransparency = 1; title.Font = Enum.Font.SourceSansBold; title.TextSize = 18

-- BOTÃO DE FECHAR/MINIMIZAR (O traço da imagem)
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 30, 0, 30); closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "—"; closeBtn.TextColor3 = Color3.new(1, 1, 1); closeBtn.BackgroundTransparency = 1
closeBtn.TextSize = 20; closeBtn.Font = Enum.Font.SourceSansBold

closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    openIcon.Visible = true -- Mostra o ícone pequeno para reabrir
end)

openIcon.MouseButton1Click:Connect(function()
    main.Visible = true
    openIcon.Visible = false -- Esconde o ícone quando o menu abre
end)

-- BOTÕES DE FUNÇÃO
local function addBtn(txt, color, y)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1, -30, 0, 45); b.Position = UDim2.new(0, 15, 0, y)
    b.Text = txt; b.BackgroundColor3 = color; b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.SourceSansBold; b.TextSize = 16; Instance.new("UICorner", b)
    return b
end

addBtn("Alcance Ativado!", Color3.fromRGB(0, 150, 0), 50)
addBtn("Aura: ON", Color3.fromRGB(150, 0, 0), 105)
addBtn("Velocidade Máxima", Color3.fromRGB(0, 120, 255), 160)
addBtn("Auto-Click (Pegar)", Color3.fromRGB(200, 150, 0), 215).TextColor3 = Color3.new(0,0,0)
