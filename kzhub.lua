-- Créer le ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Créer la notification
local notification = Instance.new("Frame")
notification.Size = UDim2.new(0, 350, 0, 50)  -- Taille de la notification (plus petite largeur)
notification.Position = UDim2.new(1, -360, 1, -60)  -- Positionné en bas à droite
notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Fond noir/gris foncé
notification.BorderSizePixel = 2  -- Bordure légère
notification.BorderColor3 = Color3.fromRGB(148, 0, 211)  -- Contours violets
notification.Visible = false  -- Initialement invisible
notification.Parent = screenGui

-- Créer le texte de la notification
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)  -- Occupe tout l'espace du Frame
textLabel.Text = "KzScript Hub | Le script a bien chargé Ctrl pour l'ouvrir"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Texte blanc
textLabel.TextSize = 14  -- Taille du texte plus petite
textLabel.TextWrapped = true  -- Enrouler le texte
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.BackgroundTransparency = 1  -- Pas de fond
textLabel.Parent = notification

-- Fonction pour afficher la notification
local function showNotification()
    notification.Visible = true
    -- Animation pour afficher
    notification:TweenPosition(UDim2.new(1, -360, 1, -60), "Out", "Quad", 0.5, true)

    -- Attendre 3 secondes avant de faire disparaître la notification
    wait(3)

    -- Animation pour cacher la notification
    notification:TweenPosition(UDim2.new(1, -360, 1, 60), "Out", "Quad", 0.5, true, function()
        notification.Visible = false  -- La rendre invisible après l'animation
    end)
end

-- Afficher la notification après que le script soit chargé
wait(1)  -- Attendre 1 seconde avant d'afficher
showNotification()

-- Créer le Frame principal (menu)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 350)  -- Menu plus grand en hauteur et plus petit en largeur
frame.Position = UDim2.new(0.5, -150, 0.5, -175)  -- Positionné au centre de l'écran
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  -- Gris foncé
frame.BorderSizePixel = 4  -- Contours violets
frame.BorderColor3 = Color3.fromRGB(148, 0, 211)  -- Contours violets
frame.Parent = screenGui

-- Créer un séparateur (ligne horizontale)
local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, 0, 0, 2)  -- Ligne fine
separator.Position = UDim2.new(0, 0, 0.3, 0)  -- Positionner sous le texte
separator.BackgroundColor3 = Color3.fromRGB(148, 0, 211)  -- Couleur violette
separator.Parent = frame

-- Créer le texte "KzHub V1" (en haut à gauche) avec une taille plus petite
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 200, 0, 50)
titleLabel.Position = UDim2.new(0, 10, 0, 10)  -- Position en haut à gauche
titleLabel.Text = "KzHub V1"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Texte blanc
titleLabel.TextSize = 24  -- Taille réduite du texte
titleLabel.TextXAlignment = Enum.TextXAlignment.Left  -- Aligné à gauche
titleLabel.TextYAlignment = Enum.TextYAlignment.Top
titleLabel.BackgroundTransparency = 1  -- Pas de fond
titleLabel.Parent = frame

-- Créer le texte "Version: 0.0.1" sous le titre avec une taille plus petite
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(0, 200, 0, 50)
versionLabel.Position = UDim2.new(0, 10, 0, 50)  -- Position sous "KzHub V1"
versionLabel.Text = "Version: 0.0.1"
versionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Texte blanc
versionLabel.TextSize = 18  -- Taille réduite du texte
versionLabel.TextXAlignment = Enum.TextXAlignment.Left
versionLabel.TextYAlignment = Enum.TextYAlignment.Top
versionLabel.BackgroundTransparency = 1
versionLabel.Parent = frame

-- Créer le bouton "X" pour fermer le menu (à droite)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)  -- Taille du bouton
closeButton.Position = UDim2.new(1, -40, 0, 10)  -- Position à droite
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Texte rouge
closeButton.TextSize = 20
closeButton.BackgroundTransparency = 1  -- Pas de fond
closeButton.Parent = frame

-- Créer le bouton "Jeux01" sous la séparation (déplacé plus bas)
local jeuxButton = Instance.new("TextButton")
jeuxButton.Size = UDim2.new(0, 280, 0, 40)  -- Taille du bouton
jeuxButton.Position = UDim2.new(0, 10, 0, 120)  -- Position plus bas sous la séparation
jeuxButton.Text = "Jeux01"
jeuxButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Texte blanc
jeuxButton.TextSize = 20
jeuxButton.BackgroundColor3 = Color3.fromRGB(148, 0, 211)  -- Bouton violet
jeuxButton.BackgroundTransparency = 0.2  -- Légèrement transparent
jeuxButton.Parent = frame

-- Fonction pour fermer le menu
local function closeMenu()
    frame.Visible = false
end

-- Fonction pour ouvrir/fermer le menu avec la touche Ctrl gauche
local function toggleMenu()
    frame.Visible = not frame.Visible
end

-- Connexion à l'événement pour fermer le menu avec le bouton "X"
closeButton.MouseButton1Click:Connect(closeMenu)

-- Connexion à l'événement pour le bouton "Jeux01"
jeuxButton.MouseButton1Click:Connect(function()
    print("Le bouton 'Jeux01' a été cliqué !")
    -- Ajoute ici l'action que tu veux lorsque "Jeux01" est cliqué
end)

-- Activer/désactiver le menu avec la touche Ctrl gauche
local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.LeftControl then
            toggleMenu()
        end
    end
end)

-- Initialement cacher le menu
frame.Visible = false
