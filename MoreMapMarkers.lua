-- Marker data: { continent, zoneID, x, y, name, type, info, Atlas ID }
local playerfaction = ""
local puntas = {
    -- Kalimdor Mailboxes
    {1, 26, 0.622, 0.392, "Mailbox", "mail", "", nil}, -- Ratchet
    {1, 12, 0.749, 0.440, "Mailbox", "mail", "", nil }, --Camp Mojache
    {1, 8, 0.248, 0.688, "Mailbox", "mail", "", nil }, -- Shadowprey Village
    {1, 22, 0.480, 0.611, "Mailbox", "mail", "", nil }, -- Sun Rock Retreat
    {1, 20, 0.507, 0.704, "Mailbox", "mail", "", nil }, -- Orgrimmar
    {1, 20, 0.623, 0.405, "Mailbox", "mail", "", nil }, -- Orgrimmar
    { 1, 2, 0.736, 0.609, "Mailbox", "mail", "", nil }, -- Splintertree Post
    { 1, 26, 0.520, 0.304, "Mailbox", "mail", "", nil }, -- Xroads
    { 1, 28, 0.453, 0.595, "Mailbox", "mail", "", nil }, -- TB
    { 1, 26, 0.622, 0.392, "Mailbox", "mail", "", nil },--The Barrens
    { 1, 26, 0.451, 0.587, "Mailbox", "mail", "", nil },--The Barrens
    { 1, 10, 0.420, 0.731, "Mailbox", "mail", "", nil },--Dustwallow Marsh
    { 1, 23, 0.523, 0.278, "Mailbox", "mail", "", nil },--Tanaris
    { 1, 26, 0.506, 0.404, "Mailbox", "mail", "", nil },--The Barrens
    -- Eastern Kingdom Mailboxes
    { 2, 33, 0.681, 0.383, "Mailbox", "mail", "", nil }, -- UC
    { 2, 33, 0.594, 0.578, "Mailbox", "mail", "", nil }, -- UC
    { 2, 31, 0.615, 0.525, "Mailbox", "mail", "", nil }, -- Brill
    { 2, 26, 0.325, 0.285, "Mailbox", "mail", "", nil }, -- Grom'gol
    { 2, 26, 0.273, 0.774, "Mailbox", "mail", "", nil }, -- BB
    { 2, 26, 0.267, 0.763, "Mailbox", "mail", "", nil }, -- BB
    { 2, 16, 0.624, 0.197, "Mailbox", "mail", "", nil },
    { 2, 3, 0.739, 0.331, "Mailbox", "mail", "", nil },--Arathi Highlands
    { 2, 33, 0.726, 0.304, "Mailbox", "mail", "", nil },--Undercity
    { 2, 1, 0.448, 0.642, "Mailbox", "mail", "", nil },--Alah'Thalas
    { 2, 28, 0.466, 0.854, "Mailbox", "mail", "", nil },--Thalassian Highlands
    { 2, 1, 0.539, 0.528, "Mailbox", "mail", "", nil },--Alah'Thalas
    { 2, 25, 0.617, 0.760, "Mailbox", "mail", "", nil },--Stormwind City
    { 2, 25, 0.745, 0.553, "Mailbox", "mail", "", nil },--Stormwind City
    { 2, 24, 0.434, 0.415, "Mailbox", "mail", "", nil },--Silverpine Forest
    { 2, 27, 0.454, 0.551, "Mailbox", "mail", "", nil },--Swamp of Sorrows
    { 2, 30, 0.789, 0.805, "Mailbox", "mail", "", nil },--The Hinterlands
    { 2, 12, 0.429, 0.655, "Mailbox", "mail", "", nil },--Elwynn Forest
    { 2, 35, 0.531, 0.533, "Mailbox", "mail", "", nil },--Westfall
    -- Reagent vendors in Eastern Kingfom
    {2, 33, 0.828, 0.158, "Reagent Vendor", "reag", "Hannah Akeley", "Horde"}, --Undercity
    { 1, 20, 0.454, 0.565, "Reagent Vendor", "reag", "Horthus", "Horde" },--Orgrimmar
    { 2, 33, 0.697, 0.391, "Reagent Vendor", "reag", "Thomas Mordan", "Horde" },--Undercity
    -- Flight masters in Kalimdor
    { 1, 20, 0.451, 0.639, "Flight Master", "flight", "Doras", "Horde" },
    { 1, 22, 0.457, 0.593, "Flight Master", "flight", "", "Horde" },--Stonetalon Mountains
    {1, 8, 0.216, 0.741, "Flight Master", "flight", "", "Horde"},
    { 1, 26, 0.515, 0.303, "Flight Master", "flight", "Devrak", "Horde" },
    { 1, 2, 0.732, 0.616, "Flight Master", "flight", "Vhulgra", "Horde" },
    {1, 2, 0.122, 0.338, "Flight Master", "flight", "Andruk", "Horde" },
    { 1, 28, 0.470, 0.498, "Flight Master", "flight", "Tal", "Horde" },
    { 1, 26, 0.631, 0.372, "Flight Master", "flight", "Bragok", "Horde" },--The Barrens
    { 1, 26, 0.444, 0.591, "Flight Master", "flight", "Omusa Thunderhorn", "Horde" },--The Barrens
    { 1, 10, 0.356, 0.319, "Flight Master", "flight", "Shardi", "Horde" },--Dustwallow Marsh
    { 1, 10, 0.428, 0.725, "Flight Master", "flight", "Razzit", "Horde" },--Dustwallow Marsh
    { 1, 23, 0.516, 0.254, "Flight Master", "flight", "Bulkrek Ragefist", "Horde" },--Tanaris
    { 1, 23, 0.510, 0.294, "Flight Master", "flight", "Bera Stonehammer", "Alliance" },--Tanaris
    --Flight masters in Eastern Kingdoms
    { 2, 24, 0.434, 0.415, "Flight Master", "flight", "Nadia Vernon", nil },--Silverpine Forest
    {2, 33, 0.633, 0.486, "Flight Master", "flight", "Michael Garrett", "Horde"},
    {2, 31, 0.041, 0.607, "Flight Master", "flight", "Mary Willowfield", "Horde"},
    { 2, 26, 0.325, 0.294, "Flight Master", "flight", "Thysta", "Horde" },
    { 2, 26, 0.269, 0.771, "Flight Master", "flight", "Gringer", "Horde" }, -- BB
    { 2, 26, 0.275, 0.778, "Flight Master", "flight", "Gyll", "Alliance" }, -- BB
    { 2, 3, 0.730, 0.327, "Flight Master", "flight", "Urda", "Horde" },--Arathi Highlands
    { 2, 24, 0.456, 0.426, "Flight Master", "flight", "Karos Razok", "Horde" },--Silverpine Forest
    { 2, 1, 0.434, 0.604, "Flight Master", "flight", "Voryn Skystrider", "Alliance" },
    { 2, 25, 0.709, 0.725, "Flight Master", "flight", "Dungar Longdrink", "Alliance" }, --Stormwind City
    { 2, 27, 0.461, 0.548, "Flight Master", "flight", "Breyk", "Horde" }, --Swamp of Sorrows
    { 2, 20, 0.306, 0.594, "Flight Master", "flight", "Ariena Stormfeather", "Alliance" },--Redridge Mountains
    { 2, 30, 0.817, 0.817, "Flight Master", "flight", "Gorkas", "Horde" } --The Hinterlands
}

-- keeping zoneIDs for reference and debugging only
kZoneNames = {GetMapZones(1)}

ekZoneNames = {GetMapZones(2)}
local firstLoad = true

local markers = {}
local debug = false

local function CreateMapPin(parent, x, y, size, texture, tooltipText, tooltipInfo)
    -- if debug then
    --     print("Attempting to create map pin. X: " .. x .. " Y: " .. y .. " Size: ".. size .. " Texture: " .. texture .. " Tip Text: " .. tooltipText)
    -- end
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

    if currentZone == 0 and currentContinent == 0 then
        -- When Continent and Zone ID is 0 We are looking at the zoomed out world map
        -- if debug then
        --     print("Zone and Continent index is 0 - Looking at World Map")
        -- end
    elseif currentZone == 0 then
        -- When Zone ID is 0 We are looking at the zoomed out map of a continent
        -- if debug then
        --     print("Looking at Continent Map")
        -- end
    end    
    
    -- Because these maps also have co-ordinates, we need to remove any drawn pins otherwise they will overlay these maps
    -- Destroy any entries in markers for pins relating to other zone / continent maps
    for _, pin in pairs(markers) do
        pin:Hide()
        pin = nil
    end
    markers = {} -- Clear the markers table

    local worldMap = WorldMapDetailFrame
    local mapWidth, mapHeight = worldMap:GetWidth(), worldMap:GetHeight()
    
    for i, data in pairs(MoreMapMarkersDB.points) do
        local isMatching = false
        local cont, zoneID, x, y, label, kind, info, faction = unpack(data)   

        -- if debug then
        --     print("Cont: " .. cont .. " Zone ID: " .. zoneID .. " X: " .. x .. " Y: " .. y .. " Label: " .. label .. " Kind: " .. kind)
        --     -- We are looking at Kalimdor or Eastern Kingdoms (not the world map)
        --     print("Current Zone ID is: " .. currentZone)
        -- end
        
        if currentZone == zoneID and currentContinent == cont and (playerfaction == faction or faction == nil) then
            isMatching = true
            -- if debug then
            --     print("Matched current continent " .. currentContinent .. " to pin data for zone: " .. label)
            --     print("We are looking at a map for zone: " .. currentZone .. " which matches defined zone pin data:" ..
            --             zoneID .. " for zone: " .. label)
            -- end
        end
        
        if isMatching then
            local size = 32
            local texture = "Interface\\Addons\\MoreMapMarkers\\Textures\\dummy.tga"
            
            if kind == "mail" then -- Mailbox
                texture = "Interface\\Addons\\MoreMapMarkers\\Images\\mail.tga"
                size = 18
            elseif kind == "reag" then --Reagent vendor
                texture = "Interface\\Addons\\MoreMapMarkers\\Images\\icon_vendor.tga"
                size = 20
            else --if kind == "flight" then
                texture = "Interface\\Addons\\MoreMapMarkers\\Images\\taxi.tga" --"Interface\\AddOns\\JonasMedia\\Taxi.tga"

            end

            local px, py = x * mapWidth, y * mapHeight
            local pin = CreateMapPin(worldMap, px, py, size, texture, label, info)        

            markers[i] = pin -- Store the pin in the markers table
        end
    end
end

local function InsertInMarkerTable(c, z, x, y, description, ttype, targetname, faction)
    assert(type(c) == "number", "Continent must be a number (1 or 2)")
    assert(x >= 0 and x <= 1 and y >= 0 and y <= 1, "Coordinates must be 0-1")
    table.insert(MoreMapMarkersDB.points, 
    {
        c,  -- Eastern Kingdoms (1 = Kalimdor)
        z, -- Zone ID (Undercity = 33)
        x, y,  -- X, Y coordinates
        description,  -- Display name
        ttype,  -- Type ("mail", "reag", "flight")
        targetname and tostring(targetname) or "",  -- Additional info (e.g., NPC name)
        faction  -- Faction restriction (nil for both)
    })
end

local function GetPlayerWorldLocation()
    local c,z=GetCurrentMapContinent(),GetCurrentMapZone() 
    local x,y=GetPlayerMapPosition("player") 
    return c,z,x,y  
end

local function flightButtonClicked()
    local c,z,x,y = GetPlayerWorldLocation()
    local t = UnitName("target") or ""
    InsertInMarkerTable(c, z, x, y, "Flight Master" ,"flight", t, playerfaction)
    UpdateMarkers()
    DEFAULT_CHAT_FRAME:AddMessage(string.format([[{ %d, %d, %.3f, %.3f, "Flight Master", "flight", "%s", "%s" },--%s]],c,z,x,y,t,playerfaction,GetZoneText()))
    DEFAULT_CHAT_FRAME:AddMessage("Flight point added")
end

local function mailButtonClicked()
    local c,z,x,y = GetPlayerWorldLocation()
    InsertInMarkerTable(c, z, x, y, "Mailbox", "mail", "", nil)
    UpdateMarkers()
    DEFAULT_CHAT_FRAME:AddMessage(string.format([[{ %d, %d, %.3f, %.3f, "Mailbox", "mail", "", nil },--%s]],c,z,x,y,GetZoneText()))
    DEFAULT_CHAT_FRAME:AddMessage("Mailbox Added")
end

local function reagentButtonClicked()
    local c,z,x,y = GetPlayerWorldLocation()
    local t = UnitName("target") or ""
    InsertInMarkerTable(c, z, x, y, "Reagent Vendor", "reag", t, playerfaction)
    UpdateMarkers()
    DEFAULT_CHAT_FRAME:AddMessage(string.format([[{ %d, %d, %.3f, %.3f, "Reagent Vendor", "reag", "%s", "%s" },--%s]],c,z,x,y,t,playerfaction,GetZoneText()))
    DEFAULT_CHAT_FRAME:AddMessage("Reagent vendor added")
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

    return button
end

local function CreateMapMarkerUI()
    MoreMapMarkerFrame = CreateFrame("Frame", "MoreMapMarkerUI", UIParent)
    MoreMapMarkerFrame:SetWidth(98)
    MoreMapMarkerFrame:SetHeight(48)
    local pos = MoreMapMarkersDB.framePosition or 
    {
        x = 0, y = 0
    }
    MoreMapMarkerFrame:SetPoint("CENTER", UIParent, "CENTER", pos.x, pos.y)
    MoreMapMarkerFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        --edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
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
    local flightButton = CreateButtonFrame(MoreMapMarkerFrame, "BOTTOMLEFT", 1, 1, 32, "Interface\\Addons\\MoreMapMarkers\\Images\\taxi.tga", flightButtonClicked)
    local mailButton = CreateButtonFrame(MoreMapMarkerFrame, "BOTTOMLEFT", 34, 1, 32, "Interface\\Addons\\MoreMapMarkers\\Images\\mail.tga", mailButtonClicked)
    local vendorButton = CreateButtonFrame(MoreMapMarkerFrame, "BOTTOMLEFT", 67, 1, 32, "Interface\\Addons\\MoreMapMarkers\\Images\\icon_vendor.tga", reagentButtonClicked)
    --local closeButton = CreateButtonFrame(MoreMapMarkerFrame,"TOPRIGHT", 1, 1, 10, "Interface\\Addons\\MoreMapMarkers\\Images\\close.tga", function() MoreMapMarkerFrame:Hide() end)
    MoreMapMarkerFrame:Hide()
end

-- Add a flag to track if we've already initialized
local initialized = false

-- Event(s) handling frame
local frame = CreateFrame("Frame")
MoreMapMarkersDB = MoreMapMarkersDB or
{ 
    points = puntas,
    FrameVisible = true
}

frame:RegisterEvent("WORLD_MAP_UPDATE")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "MoreMapMarkers" then
        
        DEFAULT_CHAT_FRAME:AddMessage("More Map Markers loaded")
    elseif event == "VARIABLES_LOADED" then
        -- This is when saved variables are actually available
        CreateMapMarkerUI()
        if not initialized then
            if MoreMapMarkersDB.FrameVisible then
                MoreMapMarkerFrame:Show()
            else
                MoreMapMarkerFrame:Hide()
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Ensure everything is set up when entering world
        if not initialized then
            initialized = true
            playerfaction = UnitFactionGroup("player")
        end
        UpdateMarkers()
    elseif event == "WORLD_MAP_UPDATE" then
        if initialized then
            UpdateMarkers()
        end
    end
end)

local function HandleMoreMapMarkersSlashCommand(msg)
    if msg == "on" or msg == "show" then
        MoreMapMarkerFrame:Show()
        MoreMapMarkersDB.FrameVisible = true
    elseif msg == "off" or msg == "hide" then
        MoreMapMarkerFrame:Hide()
        MoreMapMarkersDB.FrameVisible = false
    elseif msg == "reset" then
        MoreMapMarkersDB.framePosition = nil
        MoreMapMarkerFrame:ClearAllPoints()
        MoreMapMarkerFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        MoreMapMarkerFrame:Show()
        DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: Position reset")
    else
        DEFAULT_CHAT_FRAME:AddMessage("/moremm [option] or /moremapmarkers [option]")
        DEFAULT_CHAT_FRAME:AddMessage("[on] or [show] - shows the frame")
        DEFAULT_CHAT_FRAME:AddMessage("[off] or [hide] - hides the frame")
        DEFAULT_CHAT_FRAME:AddMessage("[reset] - resets frame position to center screen")
    end
end

SLASH_MOREMAPMARKERS1 = "/moremm"
SLASH_MOREMAPMARKERS2 = "/moremapmarkers"
SlashCmdList["MOREMAPMARKERS"] = HandleMoreMapMarkersSlashCommand
