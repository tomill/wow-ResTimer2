local frame = CreateFrame("Button", "ResTimer2Frame", UIParent)
frame:SetFrameStrata("MEDIUM")
frame:SetWidth(60)
frame:SetHeight(45)
frame:SetPoint("CENTER", 0, 0)
frame:SetMovable(true)
frame:SetUserPlaced(true)
frame:CreateTitleRegion() 
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", function(self) frame:StartMoving() end)
frame:SetScript("OnDragStop", function(self) frame:StopMovingOrSizing() end)
frame:Show()

local textarea = frame:CreateFontString("CFontString")
textarea:SetFont("Fonts\\FRIZQT__.TTF", 28, "THICKOUTLINE")
textarea:SetPoint("CENTER", frame, "CENTER", 0, 0)
textarea:SetWidth(frame:GetWidth())
textarea:SetHeight(frame:GetHeight())
textarea:SetText("res timer")
textarea:SetTextColor(1,1,1)

frame:SetScript("OnUpdate", function(self, elapsed)
    self.time = (self.time or 0) - elapsed
    if self.time < 0 then
      self.time = 31.44
    end

    local restime = GetAreaSpiritHealerTime()
    if (restime > 0) then
      self.time = restime
    end
    
    if not UnitIsGhost("player") then
        textarea:Hide()
    else
        textarea:Show()
    end

    if string.format("%.0f", self.time) == "0" then
        textarea:SetText("res")
    else
        textarea:SetText(string.format("%.0f", self.time))
    end
end)