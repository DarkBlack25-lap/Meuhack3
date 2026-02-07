-- DᴀʀᴋBʟᴀᴄᴋ Hub: Brainrot Stealer - V3 FINAL FIX
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Official"; sg.ResetOnSpawn = false

-- Variáveis Globais para os Botões funcionarem
_G.Aura = false
_G.Clicker = false

-- 1. BOTÃO PARA REABRIR (DB)
local open = Instance.new("TextButton", sg)
open.Size = UDim2.new(0, 45, 0, 45); open.Position = UDim2.new(0.1, 0, 0.15, 0)
open.BackgroundColor3 = Color3.fromRGB(20, 20, 20); open.Text = "DB"; open.TextColor3 = Color3.new(1,0,0)
open.Visible = false; Instance.new("UICorner", open).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", open).Color = Color3.new(1,0,0)

-- 2. MENU PRINCIPAL
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 240, 0, 280); main.Position = UDim2.new(0.5, -120, 0.5, -140)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Instance.new("UICorner", main)
local mStroke = Instance.new("UIStroke", main); mStroke.Color = Color3.fromRGB(200, 0, 0)

-- TÍTULO E FECHAR
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -40, 0, 40); title.Position = UDim2.new(0, 15, 0, 0)
title.Text
