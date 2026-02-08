-- Trax Spawner - DarkBlack Premium
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "TraxSpawner_V3"; sg.ResetOnSpawn = false

-- 1. INTERFACE VAULT
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 240, 0, 300); main.Position = UDim2.new(0.5, -120, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", main)
local stroke = Instance.new("UIStroke", main); stroke.Color = Color3.fromRGB(255, 165, 0); stroke.Thickness = 2

-- Título com ícone de raio
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40); title.Text = "⚡ TRAX SPAWNER"; title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold; title.TextSize = 20; title.BackgroundTransparency = 1

-- Botão de Minimizar (—)
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 30, 0, 30); close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "—"; close.TextColor3 = Color3.new(1, 1, 1); close.BackgroundTransparency = 1; close.TextSize = 25
close.MouseButton1Down:Connect(function() main.Visible = false end)

-- 2. FUNÇÕES DE SPAWN (Focadas em Roubar Brainrots)
local function createSpawnBtn(txt, color, y, action)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(1, -30, 0, 45); btn.Position = UDim2.new(0, 15, 0, y)
    btn.BackgroundColor3 = color; btn.Text = txt; btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 16; Instance.new("UICorner", btn)
    
    -- Conexão protegida contra erros de NIL
    btn.MouseButton1Down:Connect(function()
        pcall(action)
    end)
    return btn
end

-- SPAWN 1: Plataforma de Roubo (Spawn de peça abaixo de você)
createSpawnBtn("Spawn: Base Segura", Color3.fromRGB(0, 120, 255), 50, function()
    local p = Instance.new("Part", game.Workspace)
    p.Size = Vector3.new(10, 1, 10); p.CFrame = lp.Character.HumanoidRootPart.CFrame + Vector3.new(0, -3.5, 0)
    p.Anchored = true; p.Color = Color3.fromRGB(0, 255, 255)
    game:GetService("Debris"):AddItem(p, 5) -- Deleta em 5s para não bugar
end)

-- SPAWN 2: Trax Lag (Spawna peças físicas nos outros)
createSpawnBtn("Spawn: Trax Lag", Color3.fromRGB(150, 0, 0), 105, function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            local t = Instance.new("Part", game.Workspace)
            t.Size = Vector3.new(5, 5, 5); t.CFrame = plr.Character.HumanoidRootPart.CFrame
            t.Velocity = Vector3.new(0, 100, 0); t.Transparency = 0.5
            game:GetService("Debris"):AddItem(t, 2)
        end
    end
end)

-- SPAWN 3: Brainrot Magnet (Simula atração de itens)
createSpawnBtn("Spawn: Magnet Box", Color3.fromRGB(0, 180, 50), 160, function()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Part") and v.Name:lower():find("brainrot") then
            v.CFrame = lp.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
        end
    end
end)

-- BOTÃO DE VELOCIDADE (Essencial para fugir)
createSpawnBtn("Super Velocidade", Color3.fromRGB(200, 150, 0), 215, function()
    lp.Character.Humanoid.WalkSpeed = 120
end)
