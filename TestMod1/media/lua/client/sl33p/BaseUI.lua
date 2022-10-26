require "ISUI/ISPanel"

sl33pISUI = ISPanel:derive("sl33pISUI");

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

sl33pISUI.color = {
    red = { 1, 0, 0 },
    green = { 0, 1, 0 },
    blue = { 0, 0, 1 },
    yellow = { 1, 1, 0 },
    cyan = { 0, 1, 1 },
    white = { 1, 1, 1 },
    black = { 0, 0, 0 },
}
sl33pISUI.bars = {
    {
         name = "PlaceHolderName", 
         title = "PlaceHolderTitle"
    },
    {
        name = "PlaceHolderName", 
        title = "PlaceHolderTitle"
   }
}
function sl33pISUI:initalise()
    ISPanel.initalise(self);
    self:create();
end

function sl33pISUI:setVisible(visible)
    self.javaObject:setVisible(visible)
end

function sl33pISUI:drawBar(percent, i)
    local radius = 20
    local darkAlpha = 0.6

    local barWidth = 20
    local barLength = 100
    local y = (barWidth + 3) * i - barWidth
end

function sl33pISUI:new(x, y, player)

end

function sl33pISUI:getHoverBar(barw)
    local x = getMouseX()
    local y = getMouseY()
    local bar = {
        x = self.x,
        y = self.y,
        w = self.width,
        h = self.height,
    }
    if x <= bar.x or y <= bar.y or x >= bar.x + bar.w or y >= bar.y + bar.h then return nil end
    x = x - bar.x
    y = y - bar.y

    local xp = 0
    local index = 1
    while xp < bar.w do
        xp = xp + 3
        if x >= xp and x <= xp + barw then
            return index, x, y
        end
        index = index + 1
        xp = xp + barw
    end
    return nil
end


return sl33pISUI