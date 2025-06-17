-- // Pink UI Library Working Example with Fixed Theme System
-- // Uses both PinkUIFixed.lua and ComponentsFixed.lua with coordinated theme application

local PinkUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/rblxui/main/PinkUIFixed.lua"))();
local Components = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/rblxui/main/ComponentsFixed.lua"))();
local Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/rblxui/main/Themes.lua"))();

-- // Check if libraries loaded correctly
if not PinkUI then
    warn("Failed to load PinkUI library!");
    return;
end;

if not Components then
    warn("Failed to load Components library!");
    return;
end;

if not Themes then
    warn("Failed to load Themes library!");
    return;
end;

print("✅ All libraries loaded successfully!");

-- // Create window
local window = PinkUI:CreateWindow({
    Title = "Pink UI v2.0 Working",
    Subtitle = "Theme system functional",
    TitleGradient = true
});

-- // Create tabs
local maintab = window:CreateTab({
    Name = "Main Features",
    Icon = "🏠"
});

local themestab = window:CreateTab({
    Name = "Theme Settings",
    Icon = "🎨"
});

-- // Theme Settings Tab
local themebox = themestab:CreateBox({
    Name = "Color Themes",
    Column = "left",
    Height = 350 -- Adjusted height
});

local settingsbox = themestab:CreateBox({
    Name = "UI Settings",
    Column = "right",
    Height = 350
});

-- // Add color wheel for custom theme color
local customColorWheel = Components:AddColorWheel(themebox, {
    Name = "Custom Theme",
    Description = "Pick a custom color for theme",
    Default = Color3.fromRGB(255, 0, 255), -- Updated to match UI
    Callback = function(color)
        -- Create a custom theme based on the selected color
        local customTheme = {
            bg = Color3.fromRGB(6, 6, 8),
            secondary = Color3.fromRGB(12, 12, 15),
            accent = Color3.fromRGB(20, 20, 25),
            pink = color,
            red = Color3.fromRGB(255, 80, 80),
            darkpink = color:Lerp(Color3.new(0,0,0), 0.2),
            lightpink = color:Lerp(Color3.new(1,1,1), 0.2),
            white = Color3.fromRGB(255, 255, 255),
            grey = Color3.fromRGB(120, 120, 125),
            darkgrey = Color3.fromRGB(80, 80, 85),
            separator = Color3.fromRGB(35, 35, 40),
            toggleoff = Color3.fromRGB(80, 80, 85)
        };
        PinkUI:ApplyTheme(customTheme);
        Components:ApplyTheme(customTheme);
    end,
    Separator = {Height = 20}
});

-- Rest of the example code...