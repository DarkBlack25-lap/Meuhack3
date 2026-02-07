-- DarkBlack Hub: Brainrot Stealer - FIX TOTAL
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Final_Fix"; sg.ResetOnSpawn = false

-- Variáveis de Controle
local auraActive = false
local clickActive = false

-- 1. ÍCONE PARA REABRIR (Aparece quando o menu fecha)
local openBtn = Instance.new("TextButton", sg)
openBtn.Size = UDim2.new(0, 45, 0, 45); openBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
openBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); openBtn.Text = "DB"; openBtn.TextColor3 = Color3.new(1,0,0)
openBtn.Visible = false; Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", openBtn).Color = Color3.new(1, 0, 0)

-- 2. MENU PRINCIPAL
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 240, 0
