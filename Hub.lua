-- DᴀʀᴋBʟᴀᴄᴋ's Lag Bomb - Versão Fiel ao YouTube
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "DarkBlack_Lag_YouTube"; sg.ResetOnSpawn = false

local lagActive = false

-- 1. MENU PRINCIPAL (Design Compacto)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 200, 0, 230)
main.Position = UDim2.new(0.5, -100, 0.5, -115)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- Título e Fechar
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -10, 0, 30); title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "zzzz's lag bomb"; title.TextColor3 = Color3.new(1,1,1)
title.TextXAlignment = "Left"; title.BackgroundTransparency = 1; title.Font = Enum.Font.SourceSansBold; title.TextSize = 18

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 20, 0, 20); close.Position = UDim2.new(1, -25, 0, 8)
close.Text = "X"; close.TextColor3 = Color3.new(1,1,1); close.BackgroundTransparency = 1
close.MouseButton1Click:Connect(function() sg:Destroy() end)

-- Status: Ping e FPS
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, -20, 0, 40); status.Position = UDim2.new(0, 10, 0, 40)
status.Text = "Ping: 0 ms\nFPS: 0"; status.TextColor3 = Color3.fromRGB(150, 255, 150)
status.BackgroundTransparency = 1; status.TextXAlignment = "Left"; status.Font = Enum.Font.SourceSans; status.TextSize = 16

-- Loop de Atualização do Monitor
spawn(function()
    while task.wait(0.5) do
        if main.Visible then
            local fps = math.floor(1/rs.RenderStepped:Wait())
            local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            status.Text = "Ping: "..ping.." ms\nFPS: "..fps
        end
    end
end)

-- Função para Criar Botões Coloridos
local function createBtn(txt, color, y, cb)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1, -20, 0, 35); b.Position = UDim2.new(0, 10, 0, y)
    b.Text = txt; b.BackgroundColor3 = color; b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold; b.TextSize = 17; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(cb)
end

-- Botão Azul: lag em (Ação de travar os outros)
createBtn("lag em", Color3.fromRGB(45, 110, 170), 90, function()
    lagActive = not lagActive
    if lagActive then
        print("Lag Bomb Iniciada!")
        spawn(function()
            while lagActive do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        -- Cria partículas pesadas para derrubar o FPS do alvo
                        local pEx = Instance.new("ParticleEmitter", p.Character.HumanoidRootPart)
                        pEx.Rate = 99999; pEx.Lifetime = NumberRange.new(0.1)
                        pEx.Texture = "rbxassetid://243098098"; task.wait(0.1); pEx:Destroy()
                    end
                end
                task.wait()
            end
        end)
    end
end)

-- Botão Vermelho: Reset
createBtn("Reset", Color3.fromRGB(175, 50, 50), 135, function()
    if lp.Character then lp.Character:BreakJoints() end
end)

-- Botão Verde: Speed [E] (Velocidade)
createBtn("Speed [E]", Color3.fromRGB(75, 140, 75), 180, function()
    lp.Character.Humanoid.WalkSpeed = 100
end)

-- 2. CÍRCULO PARA ABRIR/FECHAR
local circle = Instance.new("TextButton", sg)
circle.Size = UDim2.new(0, 50, 0, 50); circle.Position = UDim2.new(0.05, 0, 0.4, 0)
circle.BackgroundColor3 = Color3.new(0,0,0); circle.Text = "Lag"; circle.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)
local cStroke = Instance.new("UIStroke", circle); cStroke.Color = Color3.new(1,1,1); cStroke.Thickness = 2

circle.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

-- Atalho Tecla E (Para o Speed)
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.E then
        lp.Character.Humanoid.WalkSpeed = (lp.Character.Humanoid.WalkSpeed == 100 and 16 or 100)
    end
end)

