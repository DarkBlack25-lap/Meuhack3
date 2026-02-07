-- DarkBlack Hub - Lag & Crash (Fix)
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Final"; sg.ResetOnSpawn = false

local active = false

-- Interface Estilo YouTube/Vault
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 220, 0, 250); main.Position = UDim2.new(0.5, -110, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Instance.new("UICorner", main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30); title.Text = "⚡ PLAYER CRASH / LAG"; title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1; title.Font = Enum.Font.SourceSansBold; title.TextSize = 18

-- Monitor de Rede
local stats = Instance.new("TextLabel", main)
stats.Size = UDim2.new(1, 0, 0, 40); stats.Position = UDim2.new(0, 0, 0, 35)
stats.Text = "Ping: ... | FPS: ..."; stats.TextColor3 = Color3.new(0, 1, 0); stats.BackgroundTransparency = 1

spawn(function()
    while task.wait(0.5) do
        local fps = math.floor(1/rs.RenderStepped:Wait())
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        stats.Text = "Ping: "..ping.."ms | FPS: "..fps
    end
end)

-- Botão de Ativação (Resolve o erro do Print/Nil)
local btn = Instance.new("TextButton", main)
btn.Size = UDim2.new(0, 180, 0, 45); btn.Position = UDim2.new(0.5, -90, 0, 100)
btn.BackgroundColor3 = Color3.fromRGB(0, 180, 50); btn.Text = "ATIVAR LAG BOMB"
btn.Font = Enum.Font.SourceSansBold; btn.TextSize = 16; Instance.new("UICorner", btn)

btn.MouseButton1Click:Connect(function()
    active = not active
    btn.Text = active and "LAG ATIVADO" or "ATIVAR LAG BOMB"
    btn.BackgroundColor3 = active and Color3.fromRGB(180, 50, 50) or Color3.fromRGB(0, 180, 50)
    
    if active then
        spawn(function()
            while active do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        -- Método de sobrecarga física que não gera erro de animação
                        local force = Instance.new("BodyVelocity", p.Character.HumanoidRootPart)
                        force.Velocity = Vector3.new(1e7, 1e7, 1e7)
                        force.MaxForce = Vector3.new(1e7, 1e7, 1e7)
                        task.wait()
                        force:Destroy()
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)
