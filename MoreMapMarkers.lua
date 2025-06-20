-- Marker data: { continent, zoneID, x, y, name, type, info, Atlas ID }
local points = {
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
    -- Reagent vendors in Eastern Kingfom
    {2, 33, 0.828, 0.158, "Reagent Vendor", "reag", "Hannah Akeley", "Horde"}, --Undercity
    { 1, 20, 0.454, 0.565, "Reagent Vendor", "reag", "Horthus", "Horde" },--Orgrimmar
    { 2, 33, 0.697, 0.391, "Reagent Vendor", "reag", "Thomas Mordan", "Horde" },--Undercity
    -- Flight masters in Kalimdor
    { 1, 20, 0.451, 0.639, "Flight Master", "flight", "Doras", "Horde" },
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
    {2, 33, 0.633, 0.486, "Flight Master", "flight", "Michael Garrett", "Horde"},
    {2, 31, 0.041, 0.607, "Flight Master", "flight", "Mary Willowfield", "Horde"},
    { 2, 26, 0.325, 0.294, "Flight Master", "flight", "Thysta", "Horde" },
    { 2, 26, 0.269, 0.771, "Flight Master", "flight", "Gringer", "Horde" }, -- BB
    { 2, 26, 0.275, 0.778, "Flight Master", "flight", "Gyll", "Alliance" }, -- BB
    { 2, 3, 0.730, 0.327, "Flight Master", "flight", "Urda", "Horde" },--Arathi Highlands
    { 2, 16, 0.601, 0.186, "Flight Master", "flight", "Zarise", "Horde" }, -- Tarren Mill
    { 2, 1, 0.434, 0.604, "Flight Master", "flight", "Voryn Skystrider", "Alliance" },--Alah'Thalas
    { 2, 25, 0.709, 0.725, "Flight Master", "flight", "Dungar Longdrink", "Alliance" }--Stormwind City
}

-- keeping zoneIDs for reference and debugging only
kZoneNames = {GetMapZones(1)}
ekZoneNames = {GetMapZones(2)}
local firstLoad = true

local markers = {}
local debug = false

-- Prevent the error `Interface\FrameXML\MoneyFrame.lua:185: attempt to perform arithmetic on local `money' (a nil value)`
-- Reference: https://github.com/veechs/Bagshui/blob/c70823167ae2581da7a777c073291805297cb0a2/Components/Bagshui.BlizzFixes.lua#L6
--local oldMoneyFrame_UpdateMoney = MoneyFrame_UpdateMoney
--function MoneyFrame_UpdateMoney()
--    if this.moneyType == "STATIC" and this.staticMoney == nil then
--        this.staticMoney = 0
--    end
--    oldMoneyFrame_UpdateMoney()
--end

local function CreateMapPin(parent, x, y, size, texture, tooltipText, tooltipInfo)
    if debug then
        print("Attempting to create map pin. X: " .. x .. " Y: " .. y .. " Size: ".. size .. " Texture: " .. texture .. " Tip Text: " .. tooltipText)
    end
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
        if debug then
            print("Zone and Continent index is 0 - Looking at World Map")
        end
    elseif currentZone == 0 then
        -- When Zone ID is 0 We are looking at the zoomed out map of a continent
        if debug then
            print("Looking at Continent Map")
        end
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
    local playerfaction = UnitFactionGroup("player")
    for i, data in pairs(points) do
        local isMatching = false
        local cont, zoneID, x, y, label, kind, info, faction = unpack(data)   

        if debug then
            print("Cont: " .. cont .. " Zone ID: " .. zoneID .. " X: " .. x .. " Y: " .. y .. " Label: " .. label .. " Kind: " .. kind)
            -- We are looking at Kalimdor or Eastern Kingdoms (not the world map)
            print("Current Zone ID is: " .. currentZone)
        end
        
        if currentZone == zoneID and currentContinent == cont and (playerfaction == faction or faction == nil) then
            isMatching = true
            if debug then
                print("Matched current continent " .. currentContinent .. " to pin data for zone: " .. label)
                print("We are looking at a map for zone: " .. currentZone .. " which matches defined zone pin data:" ..
                        zoneID .. " for zone: " .. label)
            end
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

-- Add a flag to track if we've already initialized
local initialized = false

-- Event(s) handling frame
local frame = CreateFrame("Frame")

frame:RegisterEvent("WORLD_MAP_UPDATE")
--frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" and arg1 == "ModernMapMarkers" then
        -- Addon is loaded, create UI but don't initialize saved vars yet
        CreateConfigUI()
        if debug then
            print("Modern Map Markers: Addon Loaded, UI Created")
        end
--    elseif event == "VARIABLES_LOADED" then
        -- This is when saved variables are actually available
--        if not initialized then
--            UpdateCheckboxStates()
--            initialized = true
--            
--            if debug then
--                print("Modern Map Markers: Variables Loaded and Initialized")
--            end
--        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Ensure everything is set up when entering world
        if not initialized then
            initialized = true
        end
        -- Always update markers when entering world
        UpdateMarkers()
    elseif event == "WORLD_MAP_UPDATE" then
        if initialized then
            UpdateMarkers()
        end
    end
end)

-- Slash command handler
--SLASH_MMM1 = "/mmm"
--SlashCmdList["MMM"] = function()
--    if MMMConfigFrame and MMMConfigFrame:IsVisible() then
--        MMMConfigFrame:Hide()
--    else
--        MMMConfigFrame:Show()
--    end
--end

if debug then
    DEFAULT_CHAT_FRAME:AddMessage("Modern Map Markers: Initial Load Complete")
end
