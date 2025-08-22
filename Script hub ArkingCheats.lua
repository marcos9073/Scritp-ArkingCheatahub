-- MarcXZ Hub Base
-- Feito para Delta Executor Mobile
-- Créditos: ArkingCheats

-- Criar GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(90, 255, 30)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.9, 0, 0.9, 0)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 30)

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "MarcXZ Hub"
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 20)
Title.TextColor3 = Color3.fromRGB(0, 255, 90)
Title.TextScaled = true

-- Criar abas
local Tabs = Instance.new("Frame", MainFrame)
Tabs.Size = UDim2.new(2, 0, 0, 60)
Tabs.Position = UDim2.new(0, 0, 0, 60)
Tabs.BackgroundColor3 = Color3.fromRGB(60, 30, 60)

-- Criar container de botões
local Container = Instance.new("Frame", MainFrame)
Container.Size = UDim2.new(5, 0, 5, -90)
Container.Position = UDim2.new(0, 0, 0, 60)
Container.BackgroundTransparency = 4

-- Função para criar botões
function CreateButton(text, pos, callback)
    local Btn = Instance.new("TextButton", Container)
    Btn.Text = text
    Btn.Size = UDim2.new(1, -20, 0, 40)
    Btn.Position = UDim2.new(0, 20, 0, pos)
    Btn.BackgroundColor3 = Color3.fromRGB(120, 60, 90)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextScaled = true
    local corner = Instance.new("UICorner", Btn)
    corner.CornerRadius = UDim.new(0, 24)
    Btn.MouseButton1Click:Connect(callback)
end

------------------------------------------------
-- 🔥 Funções
------------------------------------------------

-- TP para sua base (exemplo simples: posição fixa)
CreateButton("TP Minha Base", 0, function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    char:MoveTo(Vector3.new(0,5,0)) -- coloque coordenadas reais da sua base
end)

-- ESP inimigos (highlight)
CreateButton("ESP Inimigos", 90, function()
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character then
            if not v.Character:FindFirstChild("ESP") then
                local highlight = Instance.new("Highlight", v.Character)
                highlight.Name = "ESP"
                highlight.FillColor = Color3.fromRGB(90,70,255)
                highlight.OutlineColor = Color3.fromRGB(150,55,55)
            end
        end
    end
end)

-- Speed
CreateButton("Speed 50", 50, function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    char.Humanoid.WalkSpeed = 50
end)

-- Fly básico
local flying = false
CreateButton("Fly 255", 255, function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    
    flying = not flying
    if flying then
        game:GetService("RunService").RenderStepped:Connect(function()
            if flying and hrp then
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                    hrp.CFrame = hrp.CFrame + Vector3.new(0,9,0)
                elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                    hrp.CFrame = hrp.CFrame - Vector3.new(0,9,0)
                end
            end
        end)
    end
end)
