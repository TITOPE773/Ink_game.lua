-- INK GAME SCRIPT COMPLETO: GUI + SLIDERS + ESP + SEEKER DETECTION + NOCLIP

-- GUI PRINCIPAL local ScreenGui = Instance.new("ScreenGui") local Frame = Instance.new("Frame") local CloseButton = Instance.new("TextButton") local OpenButton = Instance.new("TextButton") local ESPButton = Instance.new("TextButton") local NoclipButton = Instance.new("TextButton") local UnNoclipButton = Instance.new("TextButton")

ScreenGui.Name = "CustomHackGUI" ScreenGui.Parent = game.CoreGui ScreenGui.ResetOnSpawn = false

Frame.Name = "Main" Frame.Parent = ScreenGui Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0, 200, 0, 310) Frame.Visible = true

-- BOTONES BÁSICOS CloseButton.Name = "Close" CloseButton.Parent = Frame CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) CloseButton.Position = UDim2.new(0.85, 0, 0, 0) CloseButton.Size = UDim2.new(0, 30, 0, 30) CloseButton.Text = "X"

OpenButton.Name = "Open" OpenButton.Parent = ScreenGui OpenButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50) OpenButton.Position = UDim2.new(0, 10, 0, 10) OpenButton.Size = UDim2.new(0, 50, 0, 30) OpenButton.Text = "Open" OpenButton.Visible = false

CloseButton.MouseButton1Click:Connect(function() Frame.Visible = false OpenButton.Visible = true end)

OpenButton.MouseButton1Click:Connect(function() Frame.Visible = true OpenButton.Visible = false end)

-- SLIDER SPEED local SpeedLabel = Instance.new("TextLabel", Frame) SpeedLabel.Position = UDim2.new(0.1, 0, 0.1, 0) SpeedLabel.Size = UDim2.new(0, 160, 0, 20) SpeedLabel.Text = "Speed: x1" SpeedLabel.TextColor3 = Color3.new(1, 1, 1) SpeedLabel.BackgroundTransparency = 1

local SpeedSlider = Instance.new("TextButton", Frame) SpeedSlider.Position = UDim2.new(0.1, 0, 0.16, 0) SpeedSlider.Size = UDim2.new(0, 160, 0, 20) SpeedSlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100) SpeedSlider.Text = ""

local SpeedDrag = Instance.new("Frame", SpeedSlider) SpeedDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255) SpeedDrag.Size = UDim2.new(0.2, 0, 1, 0) SpeedDrag.Position = UDim2.new(0, 0, 0, 0)

-- SLIDER JUMP local JumpLabel = Instance.new("TextLabel", Frame) JumpLabel.Position = UDim2.new(0.1, 0, 0.25, 0) JumpLabel.Size = UDim2.new(0, 160, 0, 20) JumpLabel.Text = "Jump: x1" JumpLabel.TextColor3 = Color3.new(1, 1, 1) JumpLabel.BackgroundTransparency = 1

local JumpSlider = Instance.new("TextButton", Frame) JumpSlider.Position = UDim2.new(0.1, 0, 0.31, 0) JumpSlider.Size = UDim2.new(0, 160, 0, 20) JumpSlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100) JumpSlider.Text = ""

local JumpDrag = Instance.new("Frame", JumpSlider) JumpDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255) JumpDrag.Size = UDim2.new(0.2, 0, 1, 0) JumpDrag.Position = UDim2.new(0, 0, 0, 0)

-- FUNCIONALIDAD SLIDERS local UserInputService = game:GetService("UserInputService")

local draggingSpeed = false SpeedSlider.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSpeed = true end end) UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingSpeed = false end end) UserInputService.InputChanged:Connect(function(input) if draggingSpeed and input.UserInputType == Enum.UserInputType.MouseMovement then local pos = math.clamp((input.Position.X - SpeedSlider.AbsolutePosition.X) / SpeedSlider.AbsoluteSize.X, 0, 1) SpeedDrag.Position = UDim2.new(pos, 0, 0, 0) local speedValue = math.floor(16 + (pos * (80 - 16))) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue SpeedLabel.Text = "Speed: x" .. tostring(math.floor(speedValue / 16 * 10 + 0.5) / 10) end end)

local draggingJump = false JumpSlider.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingJump = true end end) UserInputService.InputChanged:Connect(function(input) if draggingJump and input.UserInputType == Enum.UserInputType.MouseMovement then local pos = math.clamp((input.Position.X - JumpSlider.AbsolutePosition.X) / JumpSlider.AbsoluteSize.X, 0, 1) JumpDrag.Position = UDim2.new(pos, 0, 0, 0) local jumpValue = math.floor(50 + (pos * (200 - 50))) game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpValue JumpLabel.Text = "Jump: x" .. tostring(math.floor(jumpValue / 50 * 10 + 0.5) / 10) end end) UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingJump = false end end)

-- BOTONES EXTRA ESPButton.Name = "ESP" ESPButton.Parent = Frame ESPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60) ESPButton.Position = UDim2.new(0.1, 0, 0.41, 0) ESPButton.Size = UDim2.new(0, 160, 0, 30) ESPButton.Text = "Toggle ESP"

NoclipButton.Name = "Noclip" NoclipButton.Parent = Frame NoclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60) NoclipButton.Position = UDim2.new(0.1, 0, 0.56, 0) NoclipButton.Size = UDim2.new(0, 160, 0, 30) NoclipButton.Text = "Noclip"

UnNoclipButton.Name = "UnNoclip" UnNoclipButton.Parent = Frame UnNoclipButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60) UnNoclipButton.Position = UDim2.new(0.1, 0, 0.71, 0) UnNoclipButton.Size = UDim2.new(0, 160, 0, 30) UnNoclipButton.Text = "UnNoclip"

-- NOCLIP FUNCIONALIDAD local noclipConnection NoclipButton.MouseButton1Click:Connect(function() local player = game.Players.LocalPlayer noclipConnection = game:GetService("RunService").Stepped:Connect(function() if player.Character and player.Character:FindFirstChild("Humanoid") then for _, part in pairs(player.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end end) end)

UnNoclipButton.MouseButton1Click:Connect(function() if noclipConnection then noclipConnection:Disconnect() noclipConnection = nil end local player = game.Players.LocalPlayer for _, part in pairs(player.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = true end end end)

-- ESP CON DETECTOR DE SEEKERS POR COLOR local espEnabled = false ESPButton.MouseButton1Click:Connect(function() espEnabled = not espEnabled for _, player in pairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer then local char = player.Character if char and char:FindFirstChild("Head") then if espEnabled then if char:FindFirstChild("ESP") then continue end

local billboard = Instance.new("BillboardGui")
                billboard.Name = "ESP"
                billboard.Adornee = char.Head
                billboard.Size = UDim2.new(0, 200, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                billboard.AlwaysOnTop = true

                local seekerColors = {
                    ["Bright red"] = true,
                    ["Really red"] = true,
                    ["Crimson"] = true
                }
                local isSeeker = player.TeamColor and seekerColors[player.TeamColor.Name] or false

                local nameLabel = Instance.new("TextLabel", billboard)
                nameLabel.Font = Enum.Font.SourceSansBold
                nameLabel.TextSize = 18
                nameLabel.TextColor3 = isSeeker and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)
                nameLabel.Text = isSeeker and "[SEEKER] " .. player.Name or player.Name
                nameLabel.BackgroundTransparency = 1
                nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                nameLabel.Position = UDim2.new(0, 0, 0, 0)

                local distanceLabel = Instance.new("TextLabel", billboard)
                distanceLabel.Font = Enum.Font.SourceSansBold
                distanceLabel.TextSize = 16
                distanceLabel.TextColor3 = Color3.new(1, 1, 1)
                distanceLabel.BackgroundTransparency = 1
                distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
                distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)

                game:GetService("RunService").RenderStepped:Connect(function()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                        distanceLabel.Text = string.format("%.1f metros", dist)
                    end
                end)

                billboard.Parent = char
            else
                if char:FindFirstChild("ESP") then
                    char.ESP:Destroy()
                end
            end
        end
    end
end

end)
