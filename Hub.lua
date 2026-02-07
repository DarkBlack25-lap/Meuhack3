-- NOVO MÉTODO: TRAVAR VIA REDE E FÍSICA
createBtn("lag em", Color3.fromRGB(45, 110, 170), 90, function()
    lagActive = not lagActive
    if lagActive then
        spawn(function()
            while lagActive do
                -- Faz seu personagem "vibrar" em alta velocidade para bugar quem encostar
                if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                    lp.Character.HumanoidRootPart.Velocity = Vector3.new(999999, 999999, 999999)
                end
                
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        -- Envia notificações e sons repetidos que o servidor replica
                        local s = Instance.new("Sound", p.Character.HumanoidRootPart)
                        s.SoundId = "rbxassetid://0"
                        s.Volume = 10
                        s:Play()
                        game:GetService("Debris"):AddItem(s, 0.01)
                    end
                end
                task.wait(0.05) -- Intervalo curto para não crashar você mesmo
            end
        end)
    end
end)
