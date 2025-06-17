local themes = {};

-- // generate theme based on main color
function themes:GenerateFromColor(mainclr)
    local r, g, b = mainclr.R * 255, mainclr.G * 255, mainclr.B * 255;
    
    -- // calculate brightness
    local brightness = (r * 0.299 + g * 0.587 + b * 0.114) / 255;
    
    -- // generate bg colors based on brightness
    local bgmult = brightness > 0.5 and 0.03 or 0.05;
    local secmult = brightness > 0.5 and 0.06 or 0.08;
    local accmult = brightness > 0.5 and 0.1 or 0.12;
    
    local theme = {
        bg = Color3.fromRGB(
            math.floor(r * bgmult + 6),
            math.floor(g * bgmult + 6),
            math.floor(b * bgmult + 8)
        ),
        secondary = Color3.fromRGB(
            math.floor(r * secmult + 12),
            math.floor(g * secmult + 12),
            math.floor(b * secmult + 15)
        ),
        accent = Color3.fromRGB(
            math.floor(r * accmult + 20),
            math.floor(g * accmult + 20),
            math.floor(b * accmult + 25)
        ),
        pink = mainclr,
        red = Color3.fromRGB(255, 80, 80),
        darkpink = Color3.fromRGB(
            math.floor(r * 0.78),
            math.floor(g * 0.78),
            math.floor(b * 0.78)
        ),
        lightpink = Color3.fromRGB(
            math.min(255, math.floor(r * 1.2 + 30)),
            math.min(255, math.floor(g * 1.2 + 30)),
            math.min(255, math.floor(b * 1.2 + 30))
        ),
        white = Color3.fromRGB(255, 255, 255),
        grey = Color3.fromRGB(120, 120, 125),
        darkgrey = Color3.fromRGB(80, 80, 85),
        separator = Color3.fromRGB(35, 35, 40),
        toggleoff = Color3.fromRGB(80, 80, 85)
    };
    
    return theme;
end;

-- // preset colors for quick access
themes.Presets = {
    Pink = Color3.fromRGB(255, 105, 180),
    Blue = Color3.fromRGB(100, 150, 255),
    Purple = Color3.fromRGB(180, 100, 255),
    Green = Color3.fromRGB(100, 255, 150),
    Orange = Color3.fromRGB(255, 150, 80),
    Red = Color3.fromRGB(255, 80, 100),
    Cyan = Color3.fromRGB(80, 200, 255),
    Yellow = Color3.fromRGB(255, 220, 80),
    Magenta = Color3.fromRGB(255, 80, 255),
    Lime = Color3.fromRGB(180, 255, 80)
};

-- // get theme from preset name
function themes:GetPreset(name)
    local clr = self.Presets[name];
    if clr then
        return self:GenerateFromColor(clr);
    end;
    return self:GenerateFromColor(self.Presets.Pink);
end;

-- // backward compatibility
function themes:GetTheme(name)
    return self:GetPreset(name);
end;

-- // get preset names
function themes:GetPresetNames()
    local names = {};
    for name, _ in pairs(self.Presets) do
        table.insert(names, name);
    end;
    return names;
end;

return themes;