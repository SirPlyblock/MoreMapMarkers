-- Marker data: { continent, zoneID, x, y, name, type, npcname, faction } --
local CURRENT_VERSION = 2.2
local playerfaction = ""
local hidepointsofinterest = false
local showmail = true
local showflight = true
local showreagent = true

local MAIL_TEXTURE = "Interface\\Addons\\MoreMapMarkers\\Images\\mail.tga"
local MAIL_SIZE = 14
local REAG_TEXTURE = "Interface\\Addons\\MoreMapMarkers\\Images\\icon_vendor.tga"
local REAG_SIZE = 16
local TAXI_TEXTURE = "Interface\\Addons\\MoreMapMarkers\\Images\\taxi.tga"
local TAXI_SIZE = 28

local debug = false

local points = {
    mail = {
    { 1, 12, 0.749, 0.44, "Mailbox", "mail", "" },
    { 1, 8, 0.248, 0.688, "Mailbox", "mail", "" },
    { 1, 22, 0.48, 0.611, "Mailbox", "mail", "" },
    { 1, 20, 0.507, 0.704, "Mailbox", "mail", ""}, 
    { 1, 20, 0.623, 0.405, "Mailbox", "mail", "" },
    { 1, 2, 0.736, 0.609, "Mailbox", "mail", "" },
    { 1, 26, 0.52, 0.304, "Mailbox", "mail", "" },
    { 1, 28, 0.453, 0.595, "Mailbox", "mail", ""},
    { 1, 26, 0.622, 0.392, "Mailbox", "mail", "" },
    { 1, 26, 0.451, 0.587, "Mailbox", "mail", "" },
    { 1, 10, 0.42, 0.731, "Mailbox", "mail", "" },
    { 1, 23, 0.523, 0.278, "Mailbox", "mail", "" },
    { 1, 26, 0.506, 0.404, "Mailbox", "mail", "" },
    { 2, 33, 0.681, 0.383, "Mailbox", "mail", "" },
    { 2, 33, 0.594, 0.578, "Mailbox", "mail", "" },
    { 2, 31, 0.615, 0.525, "Mailbox", "mail", "" },
    { 2, 26, 0.325, 0.285, "Mailbox", "mail", "" },
    { 2, 26, 0.273, 0.774, "Mailbox", "mail", "" },
    { 2, 26, 0.267, 0.763, "Mailbox", "mail", "" },
    { 2, 16, 0.624, 0.197, "Mailbox", "mail", "" },
    { 2, 3, 0.739, 0.331, "Mailbox", "mail", "" },
    { 2, 33, 0.726, 0.304, "Mailbox", "mail", "" },
    { 2, 1, 0.448, 0.642, "Mailbox", "mail", "" },
    { 2, 28, 0.466, 0.854, "Mailbox", "mail", "" },
    { 2, 1, 0.539, 0.528, "Mailbox", "mail", "" },
    { 2, 25, 0.617, 0.76, "Mailbox", "mail", "" },
    { 2, 25, 0.745, 0.553, "Mailbox", "mail", "" },
    { 2, 24, 0.434, 0.415, "Mailbox", "mail", "" },
    { 2, 27, 0.454, 0.551, "Mailbox", "mail", "" },
    { 2, 30, 0.789, 0.805, "Mailbox", "mail", "" },
    { 2, 12, 0.429, 0.655, "Mailbox", "mail", "" },
    { 2, 35, 0.531, 0.533, "Mailbox", "mail", "" },
    { 2, 20, 0.264, 0.466, "Mailbox", "mail", "" },
    { 2, 10, 0.737, 0.462, "Mailbox", "mail", "" },
    { 2, 1, 0.383, 0.769, "Mailbox", "mail", "" },
    { 1, 6, 0.373, 0.437, "Mailbox", "mail", "" },
    { 2, 17, 0.712, 0.720, "Mailbox", "mail", "" },
    { 2, 17, 0.722, 0.491, "Mailbox", "mail", "" },
    { 2, 17, 0.332, 0.649, "Mailbox", "mail", "" },
    { 2, 17, 0.211, 0.524, "Mailbox", "mail", "" },
    { 2, 9, 0.470, 0.526, "Mailbox", "mail", "" }, 
    { 2, 19, 0.348, 0.477, "Mailbox", "mail", "" },
    { 2, 36, 0.109, 0.597, "Mailbox", "mail", "" }, 
    { 1, 10, 0.660, 0.453, "Mailbox", "mail", "" },
    { 1, 7, 0.671, 0.166, "Mailbox", "mail", "" },
	{ 1, 7, 0.595, 0.549, "Mailbox", "mail", "" },
	{ 1, 7, 0.417, 0.420, "Mailbox", "mail", "", },
	{ 1, 2, 0.363, 0.502, "Mailbox", "mail", "" },
    { 2, 4, 0.0385, 0.473, "Mailbox", "mail", "" },
    },
    flight = {
	{ 1, 25, 0.584, 0.940, "Flight Master", "flight", "Vesprystus", "Alliance" },
	{ 1, 2, 0.344, 0.480, "Flight Master", "flight", "Daelyshia", "Alliance" },
	{ 1, 12, 0.755, 0.444, "Flight Master", "flight", "Shyn", "Horde" },
	{ 2, 16, 0.601, 0.186, "Flight Master", "flight", "Zarise", "Horde" },	
	{ 2, 4, 0.0398, 0.447, "Flight Master", "flight", "Gorrik", "Horde" },
	{ 2, 23, 0.348, 0.309, "Flight Master", "flight", "Grisha", "Horde" },
    { 1, 20, 0.451, 0.639, "Flight Master", "flight", "Doras", "Horde" },
    { 1, 22, 0.457, 0.593, "Flight Master", "flight", "", "Horde" },
    { 1, 8, 0.216, 0.741, "Flight Master", "flight", "", "Horde" },
    { 1, 26, 0.515, 0.303, "Flight Master", "flight", "Devrak", "Horde" },
    { 1, 2, 0.732, 0.616, "Flight Master", "flight", "Vhulgra", "Horde" },
    { 1, 2, 0.122, 0.338, "Flight Master", "flight", "Andruk", "Horde" },
    { 1, 28, 0.47, 0.498, "Flight Master", "flight", "Tal", "Horde" },
    { 1, 26, 0.631, 0.372, "Flight Master", "flight", "Bragok", nil },
    { 1, 26, 0.444, 0.591, "Flight Master", "flight", "Omusa Thunderhorn", "Horde" },
    { 1, 10, 0.356, 0.319, "Flight Master", "flight", "Shardi", "Horde" },
    { 1, 10, 0.428, 0.725, "Flight Master", "flight", "Razzit", nil },
    { 1, 23, 0.516, 0.254, "Flight Master", "flight", "Bulkrek Ragefist", "Horde" },
    { 1, 23, 0.51, 0.294, "Flight Master", "flight", "Bera Stonehammer", "Alliance" },
    { 2, 33, 0.633, 0.486, "Flight Master", "flight", "Michael Garrett", "Horde" },
    { 2, 31, 0.041, 0.607, "Flight Master", "flight", "Mary Willowfield", "Horde" },
    { 2, 26, 0.325, 0.294, "Flight Master", "flight", "Thysta", "Horde" },
    { 2, 26, 0.269, 0.771, "Flight Master", "flight", "Gringer", "Horde"},
    { 2, 26, 0.275, 0.778, "Flight Master", "flight", "Gyll", "Alliance" }, 
    { 2, 3, 0.73, 0.327, "Flight Master", "flight", "Urda", "Horde" },
    { 2, 24, 0.456, 0.426, "Flight Master", "flight", "Karos Razok", "Horde"},
    { 2, 1, 0.434, 0.604, "Flight Master", "flight", "Voryn Skystrider", "Alliance" },
    { 2, 25, 0.709, 0.725, "Flight Master", "flight", "Dungar Longdrink", "Alliance" },
    { 2, 27, 0.461, 0.548, "Flight Master", "flight", "Breyk", "Horde" },
    { 2, 20, 0.306, 0.594, "Flight Master", "flight", "Ariena Stormfeather", "Alliance" },
    { 2, 30, 0.817, 0.817, "Flight Master", "flight", "Gorkas", "Horde" },
    { 2, 10, 0.775, 0.443, "Flight Master", "flight", "Felicia Maline", "Alliance" },
    { 1, 6, 0.363, 0.456, "Flight Master", "flight", "Caylais Moonfeather", "Alliance" },   
    { 2, 17, 0.555, 0.478, "Flight Master", "flight", "Gryth Thurden", "Alliance" },      
    { 2, 19, 0.339, 0.509, "Flight Master", "flight", "Thorgrum Borrelson", "Alliance" },   
    { 2, 36, 0.095, 0.597, "Flight Master", "flight", "Shellei Brondir", "Alliance" },
    { 1, 10, 0.675, 0.514, "Flight Master", "flight", "Baldruc", "Alliance" },
    },
    reagents = {
    { 2, 25, 0.631, 0.749, "Reagent Vendor", "reagents", "Kyra Boucher", "Alliance" },
    { 2, 17, 0.192, 0.561, "Reagent Vendor", "reagents", "Barim Jurgenstaad", "Alliance" }, 
    { 2, 33, 0.828, 0.158, "Reagent Vendor", "reagents", "Hannah Akeley", "Horde" },
    { 1, 20, 0.454, 0.565, "Reagent Vendor", "reagents", "Horthus", "Horde" },
    { 2, 33, 0.697, 0.391, "Reagent Vendor", "reagents", "Thomas Mordan", "Horde" },
    { 1, 7, 0.371, 0.749, "Reagent Vendor", "reagents", "Alaindia", "Alliance" },
    }
}

MoreMapMarkersDB = MoreMapMarkersDB or
{ 
    AddedMailboxes = {},
    AddedFlightPoints = {},
    AddedReagentVendors = {},
    FrameVisible = true
}

local firstLoad = true
local markers = {}

local function localUnpack(data)
    return data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8]
end

function IsMarkerPositionFree(c, z, x, y, markers)
    for _, marker in ipairs(markers) do
        -- Only check markers of the same type
        if marker[1] == c and marker[2] == z then
            local dx = marker[3] - x  -- marker[3] = existing x
            local dy = marker[4] - y  -- marker[4] = existing y
            if (dx * dx + dy * dy) < 0.01 then  -- 0.1² = 0.01
                return false 
            end
        end
    end
    return true
end

local function CreateMapPin(parent, x, y, size, texture, tooltipText, tooltipInfo)
    local pin = CreateFrame("Button", nil, parent)
    pin.texture = pin:CreateTexture(nil, "OVERLAY")
    pin:SetWidth(size)
    pin:SetHeight(size)
    pin:SetPoint("CENTER", parent, "TOPLEFT", x, -y) 
    pin.texture:SetAllPoints()
    pin.texture:SetTexture(texture)
    pin:SetFrameLevel(parent:GetFrameLevel() + 3)
    pin:Show()

    local MapTooltip
    pin:SetScript("OnEnter", function()
        WorldMapTooltip:SetOwner(pin, "ANCHOR_BOTTOMRIGHT", -15, 15)
        WorldMapTooltip:SetText(tooltipText, 1, 1 ,1)
        WorldMapTooltip:AddLine(tooltipInfo, 1,1,0)
        WorldMapTooltip:Show()
    end)

    pin:SetScript("OnLeave", function()
        WorldMapTooltip:Hide()
    end)
    return pin
end

local function UpdateMarkers()
    if firstLoad == true then
        firstLoad = false
        return
    end
    
    -- do nothing if the worldmap frame is not visible
    if not WorldMapFrame:IsVisible() then
        return
    end

    local currentContinent = GetCurrentMapContinent()
    local currentZone = GetCurrentMapZone()
    
    -- Destroy pins
    for _, pin in pairs(markers) do
        pin:Hide()
        pin = nil
    end

    markers = {} -- Clear the markers table
    if hidepointsofinterest then
        return
    end
    local worldMap = WorldMapDetailFrame
    local mapWidth, mapHeight = worldMap:GetWidth(), worldMap:GetHeight()

    local activeCollections = {}
    if showmail then
        table.insert(activeCollections, points.mail)
        table.insert(activeCollections, MoreMapMarkersDB.AddedMailboxes or {})
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Added mailboxes to visible poi's")
        end
    elseif debug then
        DEFAULT_CHAT_FRAME:AddMessage("Mailboxes off")
    end
    
    if showflight then
        table.insert(activeCollections, points.flight)
        table.insert(activeCollections, MoreMapMarkersDB.AddedFlightPoints or {})
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Added flightpoints to visible poi's")
        end
    elseif debug then
        DEFAULT_CHAT_FRAME:AddMessage("Flightpoints off")
    end

    if showreagent then
        table.insert(activeCollections, points.reagents)
        table.insert(activeCollections, MoreMapMarkersDB.AddedReagentVendors or {})
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("Added reagentvendors to visible poi's")
        end
    elseif debug then
        DEFAULT_CHAT_FRAME:AddMessage("Reagentvendors off")
    end

    for _, collection in ipairs(activeCollections) do
        for i, data in pairs(collection) do
            local cont, zoneID, x, y, label, kind, info, faction = localUnpack(data)   
            if currentZone == zoneID and currentContinent == cont and (playerfaction == faction or faction == nil) then
                local size
                local texture
                
                if kind == "mail" then
                    texture = MAIL_TEXTURE
                    size = MAIL_SIZE
                elseif kind == "reagents" then
                    texture = REAG_TEXTURE
                    size = REAG_SIZE
                else
                    texture = TAXI_TEXTURE
                    size = TAXI_SIZE
                end

                local px, py = x * mapWidth, y * mapHeight
                local pin = CreateMapPin(worldMap, px, py, size, texture, label, info)        
                markers[i] = pin
            end --zone check
        end
    end
end



local function InsertInMarkerTable(c, z, x, y, description, ttype, targetname, faction)
    local affectedtable
    local pointstable
    if ttype == "mail" then
        affectedtable = MoreMapMarkersDB.AddedMailboxes
        pointstable = points.mail
    elseif ttype == "flight" then
        affectedtable = MoreMapMarkersDB.AddedFlightPoints
        pointstable = points.flight
    else
        affectedtable = MoreMapMarkersDB.AddedReagentVendors
        pointstable = points.reagents
    end

    if IsMarkerPositionFree(c, z, x, y, pointstable) and IsMarkerPositionFree(c, z, x, y, affectedtable) then
        table.insert(affectedtable, 
        {
            c,  -- Eastern Kingdoms (1 = Kalimdor)
            z, -- Zone ID (Undercity = 33)
            x, y,  -- X, Y coordinates
            description,  -- Display name
            ttype,  -- Type ("mail", "reagents", "flight")
            targetname and tostring(targetname) or "",  -- Additional info (e.g., NPC name)
            faction  -- Faction restriction (nil for both)
        })
        DEFAULT_CHAT_FRAME:AddMessage(string.format([[{ %d, %d, %.3f, %.3f, %s, %s, %s, %s },--%s]],c,z,x,y,description,ttype,targetname or "",faction or "nil",GetZoneText()))
        DEFAULT_CHAT_FRAME:AddMessage("POI Added.")
    else
        DEFAULT_CHAT_FRAME:AddMessage(string.format("Duplicate found! %s not added.", description))
    end
end

local function GetPlayerWorldLocation()
    local c,z=GetCurrentMapContinent(),GetCurrentMapZone() 
    local x,y=GetPlayerMapPosition("player") 
    return c,z,x,y  
end

local function GenerateFlightMasterInfo()
    local c,z,x,y = GetPlayerWorldLocation()
    local t = UnitName("target") or ""
    InsertInMarkerTable(c, z, x, y, "Flight Master" ,"flight", t, playerfaction)
    UpdateMarkers()
end

local function GenerateMailboxInfo()
    local c,z,x,y = GetPlayerWorldLocation()
    InsertInMarkerTable(c, z, x, y, "Mailbox", "mail", "", nil)
    UpdateMarkers()
end

local function GenerateReagentVendorInfo()
    local c,z,x,y = GetPlayerWorldLocation()
    local t = UnitName("target") or ""
    InsertInMarkerTable(c, z, x, y, "Reagent Vendor", "reagents", t, playerfaction)
    UpdateMarkers()
end

local function CreateButtonFrame(parentframe, anchor, xpos, ypos, siz, texture, delegate)
    local butt = CreateFrame("Button", nil, parentframe)
    butt:SetWidth(siz)
    butt:SetHeight(siz)
    butt:SetPoint(anchor, parentframe, anchor, xpos, ypos)

    -- Set the button's texture
    local buttonTexture = butt:CreateTexture(nil, "BACKGROUND")
    buttonTexture:SetTexture(texture)
    buttonTexture:SetAllPoints()
    if delegate then
        butt:SetScript("OnClick", delegate)
    end

    return butt
end

local function CreateMapMarkerUI()
    MoreMapMarkerFrame = CreateFrame("Frame", "MoreMapMarkerUI", UIParent)
    MoreMapMarkerFrame:SetWidth(98)
    MoreMapMarkerFrame:SetHeight(48)
    local pos = MoreMapMarkersDB.framePosition or 
    {
        x = 0, y = 0,             
        point = "CENTER",
        relativePoint = "CENTER"
    }
    MoreMapMarkerFrame:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y)
    MoreMapMarkerFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        tile = true,
        tileSize = 32,
        edgeSize = 0,
        insets = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0
        }
    })
    MoreMapMarkerFrame:SetMovable(true)
    MoreMapMarkerFrame:EnableMouse(true)
    MoreMapMarkerFrame:RegisterForDrag("LeftButton")
    MoreMapMarkerFrame:SetScript("OnDragStart", function()
        this:StartMoving()
    end)
    MoreMapMarkerFrame:SetScript("OnDragStop", function()
        this:StopMovingOrSizing()
        local point, _, relativePoint, x, y = this:GetPoint()
        MoreMapMarkersDB.framePosition = 
        {
            x = x,
            y = y,
            point = point,
            relativePoint = relativePoint
        }
    end)

    -- Add create POI-buttons
    local flightButton = CreateButtonFrame(MoreMapMarkerFrame, "BOTTOMLEFT", 1, 1, 32, TAXI_TEXTURE, GenerateFlightMasterInfo)
    local mailButton = CreateButtonFrame(MoreMapMarkerFrame, "BOTTOMLEFT", 34, 1, 32, MAIL_TEXTURE, GenerateMailboxInfo)
    local vendorButton = CreateButtonFrame(MoreMapMarkerFrame, "BOTTOMLEFT", 67, 1, 32, REAG_TEXTURE, GenerateReagentVendorInfo)
    MoreMapMarkerFrame:Hide()
end

-- Add a flag to track if we've already initialized
local initialized = false

-- Event(s) handling frame
local frame = CreateFrame("Frame")

frame:RegisterEvent("WORLD_MAP_UPDATE")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "MoreMapMarkers" then
        
        DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7fM|cffffffffore |cff7fff7fM|cffffffffap |cff7fff7fM|cffffffffarkers loaded, type /moremm or /moremapmarkers for info.")
    elseif event == "VARIABLES_LOADED" then
        -- This is when saved variables are actually available
        MoreMapMarkersDB = MoreMapMarkersDB or {}
        MoreMapMarkersDB.AddedPoints = nil
        MoreMapMarkersDB.version = MoreMapMarkersDB.version or 1
        
        if MoreMapMarkersDB.version < CURRENT_VERSION then
            MoreMapMarkersDB.version = CURRENT_VERSION
            DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: Upgraded database to v"..CURRENT_VERSION)
        end
        showmail = MoreMapMarkersDB.ShowMailboxes or true
        showflight = MoreMapMarkersDB.ShowFlightPoints or true
        showreagent = MoreMapMarkersDB.ShowReagentVendors or true
        CreateMapMarkerUI()
        
        if MoreMapMarkersDB.FrameVisible then
            MoreMapMarkerFrame:Show()
        else
            MoreMapMarkerFrame:Hide()
        end
        hidepointsofinterest = MoreMapMarkersDB.HidePOIs or false
        frame:UnregisterEvent("VARIABLES_LOADED")
        initialized = true
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Ensure everything is set up when entering world
        playerfaction = UnitFactionGroup("player")
        if initialized then
            UpdateMarkers()
        end
    elseif event == "WORLD_MAP_UPDATE" then
        if initialized then
            UpdateMarkers()
        end
    end
end)

local function SetMarkerTypeVisibility(tp, vis)
    if tp == "m" or tp == "mail" then
        MoreMapMarkersDB.ShowMailboxes = vis
        showmail = vis
        DEFAULT_CHAT_FRAME:AddMessage("ShowMailboxes set to " .. tostring(vis))
    elseif tp == "f" or tp == "flight" then
        MoreMapMarkersDB.ShowFlightPoints = vis
        showflight = vis
        DEFAULT_CHAT_FRAME:AddMessage("ShowFlightPoints set to " .. tostring(vis))
    elseif tp == "r" or tp == "reagents" then
        MoreMapMarkersDB.ShowReagentVendors = vis
        showreagent = vis
        DEFAULT_CHAT_FRAME:AddMessage("ShowReagentVendors set to " .. tostring(vis))
    else
        DEFAULT_CHAT_FRAME:AddMessage("Unknown marker type.")
    end
end

local function strsplit(text)
    local result = {}
    for word in string.gmatch(text, "[^%s]+") do
        table.insert(result, word)
    end
    return result
end

local function HandleMoreMapMarkersSlashCommand(msg)
    local params = strsplit(msg)
    local param1 = params[1]
    local param2 = params[2]
    if debug then
        DEFAULT_CHAT_FRAME:AddMessage(param1 or nil)
        DEFAULT_CHAT_FRAME:AddMessage(param2 or nil)
    end
    if param1 == "show" then
        if param2 then
            SetMarkerTypeVisibility(param2, true)
            
        else
            MoreMapMarkerFrame:Show()
            MoreMapMarkersDB.FrameVisible = true
        end
    elseif param1 == "hide" then
        if param2 then
            SetMarkerTypeVisibility(param2, false)
        else
            MoreMapMarkerFrame:Hide()
            MoreMapMarkersDB.FrameVisible = false
        end
    elseif param1 == "reset" then
        MoreMapMarkersDB.framePosition = nil
        MoreMapMarkerFrame:ClearAllPoints()
        MoreMapMarkerFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        MoreMapMarkerFrame:Show()
        MoreMapMarkersDB.FrameVisible = true
        SetMarkerTypeVisibility("m", true)
        SetMarkerTypeVisibility("f", true)
        SetMarkerTypeVisibility("r", true)
        DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: Settings reset to deafult.")
    elseif param1 == "on" then
        MoreMapMarkersDB.HidePOIs = false
        hidepointsofinterest = false
        UpdateMarkers()
    elseif param1 == "off" then
        MoreMapMarkersDB.HidePOIs = true
        hidepointsofinterest = true
        UpdateMarkers()
    elseif param1 == "toggle" then
        if hidepointsofinterest then
            HandleMoreMapMarkersSlashCommand("on")
        else
            HandleMoreMapMarkersSlashCommand("off")
        end
    elseif param1 == "f" or param1 == "flight" then
        GenerateFlightMasterInfo()
    elseif param1 == "m" or param1 == "mail" then
        GenerateMailboxInfo()
    elseif param1 == "r" or param1 == "reagents" then
        GenerateReagentVendorInfo()
    else
        DEFAULT_CHAT_FRAME:AddMessage("/moremm [option] or /moremapmarkers [option]")
        DEFAULT_CHAT_FRAME:AddMessage("[show] {type} - shows the frame or the marker type if supplied")
        DEFAULT_CHAT_FRAME:AddMessage("[hide] {type} - hides the frame or the marker type if supplied")
        DEFAULT_CHAT_FRAME:AddMessage("[toggle] - hides/shows map markers")
        DEFAULT_CHAT_FRAME:AddMessage("[on] - shows map markers")
        DEFAULT_CHAT_FRAME:AddMessage("[off] - hides map markers")
        DEFAULT_CHAT_FRAME:AddMessage("[reset] - resets frame position to center screen")
        DEFAULT_CHAT_FRAME:AddMessage("[f] or [flight] - Generates flight master info for targetted unit at your location")
        DEFAULT_CHAT_FRAME:AddMessage("[m] or [mail] - Generates mailbox info at your location")
        DEFAULT_CHAT_FRAME:AddMessage("[r] or [reagents] - Generates reagent vendor info for targetted unit at your location")
    end
end

SLASH_MOREMAPMARKERS1 = "/moremm"
SLASH_MOREMAPMARKERS2 = "/moremapmarkers"
SlashCmdList["MOREMAPMARKERS"] = HandleMoreMapMarkersSlashCommand
