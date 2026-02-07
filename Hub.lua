-- Limpa GUIs antigas para evitar conflito
for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == "DarkBlack_Official" then v:Destroy() end
end

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Official"; sg.ResetOnSpawn = false

-- 1. BOTÃO FLUTUANTE DE SEGURANÇA (Aparece se o menu sumir)
local openIcon = Instance.new("TextButton", sg)
openIcon.Size = UDim2.new(0, 45, 0, 45); openIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
openIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 20); openIcon.Text = "DB"; openIcon.TextColor3 = Color3.new(1,0,0)
openIcon.Visible = false; Instance.new("UICorner", openIcon).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", openIcon).Color = Color3.new(1, 0, 0)

-- 2. MENU PRINCIPAL
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 240, 0, 280); main.Position = UDim2.new(0.5, -120, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", main)
local mStroke = Instance.new("UIStroke", main); mStroke.Color = Color3.fromRGB(200, 0, 0)

-- TÍTULO E BOTÃO DE MINIMIZAR (—)
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -40, 0, 40); title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "⚡ BRAINROT STEALER"; title.TextColor3 = Color3.new(1,1,1); title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold; title.TextSize = 18; title.TextXAlignment = "Left"

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 30, 0, 30); close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "—"; close.TextColor3 = Color3.new(1,1,1); close.BackgroundTransparency = 1; close.TextSize = 25

close.MouseButton1Click:Connect(function() main.Visible = false; openIcon.Visible = true end)
openIcon.MouseButton1Click:Connect(function() main.Visible = true; openIcon.Visible = false end)

-- FUNÇÃO DE CRIAÇÃO DE BOTÃO COM PROTEÇÃO CONTRA NIL
local function createButton(txt, color, y, action)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(1, -30, 0, 45); btn.Position = UDim2.new(0, 15, 0, y)
    btn.BackgroundColor3 = color; btn.Text = txt; btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 16; Instance.new("UICorner", btn)
    
    -- Usa pcall para evitar que o script quebre se houver erro no jogo
    btn.MouseButton1Down:Connect(function()
        local success, err = pcall(action)
