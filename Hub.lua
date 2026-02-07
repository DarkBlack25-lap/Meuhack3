-- DᴀʀᴋBʟᴀᴄᴋ Hub: Brainrot Stealer Edition
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp.PlayerGui)
sg.Name = "DarkBlack_Brainrot"; sg.ResetOnSpawn = false

local function createMain()
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 240, 0, 280); main.Position = UDim2.new(0.5, -120, 0.5, -140)
    main.BackgroundColor3 = Color3.fromRGB(10, 10, 12); Instance.new("UICorner", main)
    local stroke = Instance.new("UIStroke", main); stroke.Color = Color3.fromRGB(255, 0, 0); stroke.Thickness = 2

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0, 40); title.Text = "⚡ BRAINROT STEALER"; title.TextColor3 = Color3.new(1,1,1)
    title.Font = Enum.Font.SourceSansBold; title.TextSize = 20; title.BackgroundTransparency = 1

    -- FUNÇÃO 1: REACH (Aumenta o alcance para pegar brainrots de longe)
    local reachBtn = Instance.new("TextButton", main)
    reachBtn.Size = UDim2.new(0, 200, 0, 45); reachBtn.Position = UDim2.new(0.5, -100, 0, 50)
    reachBtn.Text = "Aumentar Alcance (Reach)"; reachBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    reachBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", reachBtn)
    
    reachBtn.MouseButton1Click:Connect(function()
        _G.Reach = true
        spawn(function()
            while _G.Reach do
                for _, v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Part") and v.Name == "Brainrot" then -- Nome fictício, ajustável ao jogo
                        v.Size = Vector3.new(20, 20, 20)
                        v.CanCollide = false
                    end
                end
                task.wait(1)
            end
        end)
        reachBtn.Text = "Alcance Ativado!"; reachBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end)

    -- FUNÇÃO 2: LAG AURA (Trava quem chegar perto de você enquanto você rouba)
    local lagAura = Instance.new("TextButton", main)
    lagAura.Size = UDim2.new(0, 200, 0, 45); lagAura.Position = UDim2.new(0.5, -100, 0, 105)
    lagAura.Text = "Lag Aura (Proteção)"; lagAura.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    lagAura.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", lagAura)

    lagAura.MouseButton1Click:Connect(function()
        _G.Aura = not _G.Aura
        lagAura.Text = _G.Aura and "Aura: ON" or "Lag Aura (Proteção)"
        lagAura.BackgroundColor3 = _G.Aura and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(30, 30, 30)
        
        spawn(function()
            while _G.Aura do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= lp and p.Character and (p.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude < 15 then
                        -- Envia pacotes de física para travar o agressor
                        local f = Instance.new("BodyAngularVelocity", p.Character.HumanoidRootPart)
                        f.AngularVelocity = Vector3.new(9e9, 9e9, 9e9); task.wait(0.1); f:Destroy()
                    end
                end
                task.wait(0.2)
            end
        end)
    end)

    -- FUNÇÃO 3: SPEED HACK
    local speedBtn = Instance.new("TextButton", main)
    speedBtn.Size = UDim2.new(0, 200, 0, 45); speedBtn.Position = UDim2.new(0.5, -100, 0, 160)
    speedBtn.Text = "Velocidade Máxima"; speedBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    speedBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", speedBtn)
    
    speedBtn.MouseButton1Click:Connect(function()
        lp.Character.Humanoid.WalkSpeed = 80
    end)

    -- FUNÇÃO 4: AUTO-CLICKER (Para pegar o brainrot mais rápido)
    local clickBtn = Instance.new("TextButton", main)
    clickBtn.Size = UDim2.new(0, 200, 0, 45); clickBtn.Position = UDim2.new(0.5, -100, 0, 215)
    clickBtn.Text = "Auto-Click (Pegar)"; clickBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 0)
    clickBtn.TextColor3 = Color3.new(0,0,0); Instance.new("UICorner", clickBtn)

    clickBtn.MouseButton1Click:Connect(function()
        _G.Click = not _G.Click
        clickBtn.Text = _G.Click and "Coletando..." or "Auto-Click (Pegar)"
        spawn(function()
            while _G.Click do
                game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0))
                task.wait(0.05)
            end
        end)
    end)
end

createMain()
