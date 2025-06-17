-- // Pink UI Library Themes
local themes = {};

-- // Default Pink Theme
themes.Pink = {
    bg = Color3.fromRGB(6, 6, 8),
    secondary = Color3.fromRGB(12, 12, 15),
    accent = Color3.fromRGB(20, 20, 25),
    pink = Color3.fromRGB(255, 105, 180),
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(200, 80, 140),
    lightpink = Color3.fromRGB(255, 150, 200),
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(120, 120, 125),
    darkgrey = Color3.fromRGB(80, 80, 85),
    separator = Color3.fromRGB(35, 35, 40),
    toggleoff = Color3.fromRGB(80, 80, 85) -- Grey for disabled toggles
};

-- // Blue Theme
themes.Blue = {
    bg = Color3.fromRGB(6, 8, 12),
    secondary = Color3.fromRGB(12, 15, 20),
    accent = Color3.fromRGB(20, 25, 35),
    pink = Color3.fromRGB(100, 150, 255), -- Main accent (blue)
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(80, 120, 200), -- Darker blue
    lightpink = Color3.fromRGB(150, 180, 255), -- Lighter blue
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(120, 125, 130),
    darkgrey = Color3.fromRGB(80, 85, 90),
    separator = Color3.fromRGB(35, 40, 50),
    toggleoff = Color3.fromRGB(80, 85, 90)
};

-- // Purple Theme
themes.Purple = {
    bg = Color3.fromRGB(8, 6, 12),
    secondary = Color3.fromRGB(15, 12, 20),
    accent = Color3.fromRGB(25, 20, 35),
    pink = Color3.fromRGB(180, 100, 255), -- Main accent (purple)
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(140, 80, 200), -- Darker purple
    lightpink = Color3.fromRGB(200, 150, 255), -- Lighter purple
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(125, 120, 130),
    darkgrey = Color3.fromRGB(85, 80, 90),
    separator = Color3.fromRGB(40, 35, 50),
    toggleoff = Color3.fromRGB(85, 80, 90)
};

-- // Green Theme
themes.Green = {
    bg = Color3.fromRGB(6, 10, 8),
    secondary = Color3.fromRGB(12, 18, 15),
    accent = Color3.fromRGB(20, 30, 25),
    pink = Color3.fromRGB(100, 255, 150), -- Main accent (green)
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(80, 200, 120), -- Darker green
    lightpink = Color3.fromRGB(150, 255, 200), -- Lighter green
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(120, 130, 125),
    darkgrey = Color3.fromRGB(80, 90, 85),
    separator = Color3.fromRGB(35, 50, 40),
    toggleoff = Color3.fromRGB(80, 90, 85)
};

-- // Orange Theme
themes.Orange = {
    bg = Color3.fromRGB(10, 8, 6),
    secondary = Color3.fromRGB(18, 15, 12),
    accent = Color3.fromRGB(30, 25, 20),
    pink = Color3.fromRGB(255, 150, 80), -- Main accent (orange)
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(200, 120, 60), -- Darker orange
    lightpink = Color3.fromRGB(255, 180, 120), -- Lighter orange
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(130, 125, 120),
    darkgrey = Color3.fromRGB(90, 85, 80),
    separator = Color3.fromRGB(50, 40, 35),
    toggleoff = Color3.fromRGB(90, 85, 80)
};

-- // Red Theme
themes.Red = {
    bg = Color3.fromRGB(12, 6, 6),
    secondary = Color3.fromRGB(20, 12, 12),
    accent = Color3.fromRGB(35, 20, 20),
    pink = Color3.fromRGB(255, 80, 100), -- Main accent (red)
    red = Color3.fromRGB(255, 60, 60),
    darkpink = Color3.fromRGB(200, 60, 80), -- Darker red
    lightpink = Color3.fromRGB(255, 120, 140), -- Lighter red
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(130, 120, 120),
    darkgrey = Color3.fromRGB(90, 80, 80),
    separator = Color3.fromRGB(50, 35, 35),
    toggleoff = Color3.fromRGB(90, 80, 80)
};

-- // Dark Theme (Monochrome)
themes.Dark = {
    bg = Color3.fromRGB(8, 8, 8),
    secondary = Color3.fromRGB(15, 15, 15),
    accent = Color3.fromRGB(25, 25, 25),
    pink = Color3.fromRGB(200, 200, 200), -- Main accent (light grey)
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(160, 160, 160), -- Darker grey
    lightpink = Color3.fromRGB(220, 220, 220), -- Lighter grey
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(120, 120, 120),
    darkgrey = Color3.fromRGB(80, 80, 80),
    separator = Color3.fromRGB(40, 40, 40),
    toggleoff = Color3.fromRGB(80, 80, 80)
};

-- // Cyan Theme
themes.Cyan = {
    bg = Color3.fromRGB(6, 10, 12),
    secondary = Color3.fromRGB(12, 18, 20),
    accent = Color3.fromRGB(20, 30, 35),
    pink = Color3.fromRGB(80, 200, 255), -- Main accent (cyan)
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(60, 160, 200), -- Darker cyan
    lightpink = Color3.fromRGB(120, 220, 255), -- Lighter cyan
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(120, 125, 130),
    darkgrey = Color3.fromRGB(80, 85, 90),
    separator = Color3.fromRGB(35, 45, 50),
    toggleoff = Color3.fromRGB(80, 85, 90)
};

-- // Function to apply theme
function themes:ApplyTheme(themeName, uiElements)
    local theme = themes[themeName];
    if not theme then
        warn("Theme '" .. themeName .. "' not found! Available themes: " .. table.concat(themes:GetThemeNames(), ", "));
        return false;
    end;
    
    -- Apply theme to UI elements if provided
    if uiElements then
        for elementType, elements in pairs(uiElements) do
            if elementType == "backgrounds" then
                for _, element in pairs(elements) do
                    element.BackgroundColor3 = theme.bg;
                end;
            elseif elementType == "accents" then
                for _, element in pairs(elements) do
                    element.BackgroundColor3 = theme.accent;
                end;
            elseif elementType == "pinks" then
                for _, element in pairs(elements) do
                    element.BackgroundColor3 = theme.pink;
                end;
            end;
        end;
    end;
    
    return theme;
end;

-- // Get list of available themes
function themes:GetThemeNames()
    local names = {};
    for name, _ in pairs(themes) do
        if type(themes[name]) == "table" and themes[name].bg then
            table.insert(names, name);
        end;
    end;
    return names;
end;

-- // Get current theme colors
function themes:GetTheme(themeName)
    return themes[themeName] or themes.Pink;
end;

return themes;