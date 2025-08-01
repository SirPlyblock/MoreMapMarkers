-- Marker data: { continent, zoneID, x, y, name, type, npcname, faction } --
local CURRENT_VERSION = 3.0
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
local lastCurrentContinent, lastCurrentZone

local MoreMapMarkerFrame

local points = {
    mail = {
        [1] = {
            [2] = {
                { 0.736, 0.609, "" },
                { 0.363, 0.502, "" },
            },
            [6] = {
                { 0.373, 0.437, "" },
            },
            [7] = {
                { 0.671, 0.166, "" },
                { 0.595, 0.549, "" },
                { 0.417, 0.420, "", },        
            },
            [8] = {
                { 0.248, 0.688, "" },
            },
			[9] = {
                { 0.425, 0.686, "" },
				{ 0.590, 0.260, "" },
			},            
            [10] = {
                { 0.42, 0.731, "" },
                { 0.660, 0.453, "" },
            },
            [12] = {
                { 0.749, 0.44, "" },
            },
            [20] = {
                { 0.507, 0.704, ""},
                { 0.623, 0.405, "" },
            },
            [22] = {
                 { 0.48, 0.611, "" },
                 { 0.832, 0.615, "" },
                 { 0.360, 0.0724, "" },
            },
            [23] = {
                { 0.523, 0.278, "" },
            },
            [25] = {
                { 0.561, 0.584, "" },
            },
            [26] = {
                { 0.52, 0.304, "" },
                { 0.622, 0.392, "" },
                { 0.451, 0.587, "" },
                { 0.506, 0.404, "" },
            },
            [27] = {
                { 0.458, 0.510, "" },
			},
            [28] = {
                { 0.453, 0.595, ""},
            },
        },
        [2] = {
            [1] = {
                { 0.448, 0.642, "" },
                { 0.539, 0.528, "" },
                { 0.383, 0.769, "" },
            },
            [3] = {
                { 0.739, 0.331, "" },
            },
            [4] = {
                { 0.0385, 0.473, "" },
            },
            [9] = {
                { 0.470, 0.526, "" },
                { 0.238, 0.288, ""	},
            },
            [10] = {
                { 0.737, 0.462, "" },
            },
            [12] = {
                { 0.480, 0.419, "" },
                { 0.429, 0.655, "" },
            },
            [16] = {
                { 0.624, 0.197, "" },
            },
            [17] = {
                { 0.712, 0.720, "" },
                { 0.722, 0.491, "" },
                { 0.332, 0.649, "" },
                { 0.211, 0.524, "" },
            },
            [19] = {
                { 0.348, 0.477, "" },
            },
            [20] = {
                { 0.264, 0.466, "" },
            },
            [24] = {
                { 0.434, 0.415, "" },
                { 0.421, 0.772, "" },
            },
            [25] = {
                { 0.368, 0.691, "" },
                { 0.617, 0.76, "" },
                { 0.745, 0.553, "" },
            },
            [26] = {
                { 0.325, 0.285, "" },
                { 0.273, 0.774, "" },
                { 0.267, 0.763, "" },
            },
            [27] = {
                { 0.454, 0.551, "" },
            },
            [28] = {
                { 0.466, 0.854, "" },
			    { 0.728, 0.289, "" },          
            },
            [30] = {
                { 0.789, 0.805, "" },
            },
            [31] = {
                { 0.615, 0.525, "" },
            },
            [33] = {
                { 0.681, 0.383, "" },
                { 0.594, 0.578, "" },
                { 0.726, 0.304, "" },
            },
            [35] = {
                { 0.531, 0.533, "" },
            },
            [36] = {
                { 0.109, 0.597, "" },
            },
        }
    },
    flight = {
        [1] = {
            [2] = {
                { 0.344, 0.480, "Daelyshia", "Alliance" },
                { 0.732, 0.616, "Vhulgra", "Horde" },
                { 0.122, 0.338, "Andruk", "Horde" },                
            },
            [3] = {
				    { 0.220, 0.496, "Kroum", "Horde" },
			},
            [6] = {
                { 0.363, 0.456, "Caylais Moonfeather", "Alliance" },
            },
            [8] = {
                { 0.216, 0.741, "", "Horde" },
            },
            [10] = {
                { 0.356, 0.319, "Shardi", "Horde" },
                { 0.428, 0.725, "Razzit", nil },
                { 0.675, 0.514, "Baldruc", "Alliance" },
            },
            [11] = {
				{ 0.345, 0.539, "Brakkar", "Horde" },
			},
            [12] = {
                { 0.755, 0.444, "Shyn", "Horde" },
            },
            [20] = {
                { 0.451, 0.639, "Doras", "Horde" },
            },
            [22] = {
                { 0.457, 0.593, "", "Horde" },
                { 0.835, 0.626, "Orrik Thunderbeard", "Alliance" },
                { 0.364, 0.072, "Teloren", "Alliance" },
            },
            [23] = {
                { 0.516, 0.254, "Bulkrek Ragefist", "Horde" },
                { 0.51, 0.294, "Bera Stonehammer", "Alliance" },
            },
            [24] = {
				{ 0.394, 0.780, "Tezzin Skyfuse", "Horde" },
			},
            [25] = {
                { 0.584, 0.940, "Vesprystus", "Alliance" },
            },
            [26] = {
                { 0.515, 0.303, "Devrak", "Horde" },
                { 0.631, 0.372, "Bragok", nil },
                { 0.444, 0.591, "Omusa Thunderhorn", "Horde" },
            },
            [27] = {
				{ 0.451, 0.491, "Nyse", "Horde"	},
			},
            [28]= {
                { 0.47, 0.498, "Tal", "Horde" },
            },
        },
        [2] = {
            [1] = {
                { 0.434, 0.604, "Voryn Skystrider", "Alliance" },
            },
            [3] = {
                { 0.73, 0.327, "Urda", "Horde" },
            },
            [4] = {
                { 0.0398, 0.447, "Gorrik", "Horde" },
            },
            [7] = {
				{ 0.657, 0.242, "Vahgruk", "Horde" },
			},
            [9] = {
                { 0.270, 0.357, "Nelly Cogwheel", "Alliance" },
            },
            [10] = {
                { 0.775, 0.443, "Felicia Maline", "Alliance" },
            },
            [11] = {
				{ 0.816, 0.593, "Khaelyn Steelwing", "Alliance" },
                { 0.802, 0.570, "Georgia", "Horde" },
			},
            [16] = {
                { 0.601, 0.186, "Zarise", "Horde" },
            },
            [14] = {
                { 0.571, 0.384, "Andana", "Horde" },
			},
            [17] = {
                { 0.555, 0.478, "Gryth Thurden", "Alliance" },  
            },
            [19] = {
                { 0.339, 0.509, "Thorgrum Borrelson", "Alliance" },   
            },
            [20] = {
                { 0.306, 0.594, "Ariena Stormfeather", "Alliance" },
            },
            [23] = {
                { 0.348, 0.309, "Grisha", "Horde" },
            },
            [24] = {
                { 0.456, 0.426, "Karos Razok", "Horde"},
            },
            [25] = {
                { 0.709, 0.725, "Dungar Longdrink", "Alliance" },
            },
            [26] = {
                { 0.325, 0.294, "Thysta", "Horde" },
                { 0.269, 0.771, "Gringer", "Horde"},
                { 0.275, 0.778, "Gyll", "Alliance" }, 
            },
            [27] = {
                { 0.461, 0.548, "Breyk", "Horde" },
            },
            [30] = {
                { 0.817, 0.817, "Gorkas", "Horde" },
            },
            [31] = {
                { 0.041, 0.607, "Mary Willowfield", "Horde" },
            },
            [33] = {
                { 0.633, 0.486, "Michael Garrett", "Horde" },
            },
            [35] = {
                { 0.565, 0.526, "Thor", "Alliance" },
            },
            [36] = {
                { 0.095, 0.597, "Shellei Brondir", "Alliance" },
				{ 0.227, 0.654, "Greta Stonehammer", "Alliance"	},               
            },
        },
    },
    reagents = {
        [1] = {
            [7] = {
                { 0.371, 0.749, "Alaindia", "Alliance" },
            },
            [20] = {
                { 0.454, 0.565, "Horthus", "Horde" },
            }, 
            [28] = {
				{ 0.3693000972270966, 0.5702997446060181, "Chepi", "Horde" },
			},
        },
        [2] = {
            [17] = {
                { 0.192, 0.561, "Barim Jurgenstaad", "Alliance" },
            },
            [25] = {
				{ 0.532, 0.452, "Brother Cassius", "Alliance" },
                { 0.631, 0.749, "Kyra Boucher", "Alliance" },
            },
            [33] = {
                { 0.828, 0.158, "Hannah Akeley", "Horde" },
                { 0.697, 0.391, "Thomas Mordan", "Horde" },
            },
        },
        [10] = {
			[1] = {
				{ 0.365, 0.304, "Balai Lok'Wein", "Horde" },
		    },
        },
    },
}

MoreMapMarkersDB = MoreMapMarkersDB or
{ 
    AddedMailboxes = {},
    AddedFlightPoints = {},
    AddedReagentVendors = {},
    FrameVisible = true
}

local firstLoad = true
local mapmarkers = {}

local function localUnpack(data)
    return data[1], data[2], data[3], data[4]
end

local function IsMarkerPositionFree(c, z, x, y, markerTable)
    if not markerTable or not markerTable[c] or not markerTable[c][z] then
        return true
    end
    
    for _, marker in ipairs(markerTable[c][z]) do
        local dx = marker[1] - x 
        local dy = marker[2] - y 
        if (dx * dx + dy * dy) < 0.0001 then
            if debug then
                DEFAULT_CHAT_FRAME:AddMessage(tostring(marker[1]) .. " " .. tostring(marker[2]))
                DEFAULT_CHAT_FRAME:AddMessage(tostring(dx) .. " " .. tostring(dy))
                DEFAULT_CHAT_FRAME:AddMessage(tostring(dx*dx+dy*dy))
            end
            return false
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

--Proper destruction of map markers
local function SafeDestroyPin(pin)
    if not pin then return end
    
    -- Clear scripts
    pin:SetScript("OnEnter", nil)
    pin:SetScript("OnLeave", nil)
    
    -- Remove texture
    if pin.texture then
        pin.texture:SetTexture(nil)
        pin.texture = nil
    end
    
    -- Remove from parent and clear anchors
    pin:ClearAllPoints()
    pin:SetParent(nil)
    
    -- Hide last (some addons check :IsShown())
    pin:Hide()
end

local function IterateMarkerTable(kind, activeCollections, worldMap, mapWidth, mapHeight)
    local label
    local size
    local texture
    if kind == "mail" then
        label = "Mailbox"
        texture = MAIL_TEXTURE
        size = MAIL_SIZE
    elseif kind == "reagents" then
        label = "Reagent Vendor"
        texture = REAG_TEXTURE
        size = REAG_SIZE
    else
        label = "Flight Master"
        texture = TAXI_TEXTURE
        size = TAXI_SIZE
    end
    for _, collection in ipairs(activeCollections) do
        if collection then
            if debug and type(collection) == "string" then
                DEFAULT_CHAT_FRAME:AddMessage("Collection: " .. collection)
            end
            for i, data in pairs(collection) do
                local x, y, name, faction = localUnpack(data)   
                if playerfaction == faction or not faction then
                    local px, py = x * mapWidth, y * mapHeight
                    local pin = CreateMapPin(worldMap, px, py, size, texture, label, name)        
                    table.insert(mapmarkers, pin) --[i] = pin
                end --zone check
            end
        end
    end
end

local function UpdateMoreMapMarkers(currentContinent, currentZone)
    if firstLoad == true then
        firstLoad = false
        return
    end
    
    -- do nothing if the worldmap frame is not visible
    if not WorldMapFrame:IsVisible() then
        return
    end

    -- Destroy pins
    for i, pin in pairs(mapmarkers) do
        SafeDestroyPin(pin)
        mapmarkers[i] = nil  -- Remove from table
    end
    
    mapmarkers = {} -- Clear the markers table
    if (not currentZone or currentZone == 0) or (not currentContinent or currentContinent == 0) then
        return
    end

    if hidepointsofinterest then
        if debug then
            DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: POI's hidded, no action")
        end
        return
    end

    if debug then
        DEFAULT_CHAT_FRAME:AddMessage("Update map called with continent: " .. tostring(currentContinent) .. ", zone: " .. tostring(currentZone))
    end
    local worldMap = WorldMapDetailFrame
    local mapWidth, mapHeight = worldMap:GetWidth(), worldMap:GetHeight()

    local activeCollections = {}
    local mailboxCollection = {}
    if showmail then
        table.insert(mailboxCollection, points.mail[currentContinent][currentZone] or {})
        if MoreMapMarkersDB.AddedMailboxes[currentContinent] and MoreMapMarkersDB.AddedMailboxes[currentContinent][currentZone] then
            table.insert(mailboxCollection, MoreMapMarkersDB.AddedMailboxes[currentContinent][currentZone])
            if debug then
                DEFAULT_CHAT_FRAME:AddMessage("Added mailboxes to visible poi's")
            end
        end
        IterateMarkerTable("mail", mailboxCollection, worldMap, mapWidth, mapHeight)
    elseif debug then
        DEFAULT_CHAT_FRAME:AddMessage("Mailboxes off")
    end
    
    local flightCollection = {}
    if showflight then
        table.insert(flightCollection, points.flight[currentContinent][currentZone] or {})
        if MoreMapMarkersDB.AddedFlightPoints[currentContinent] and MoreMapMarkersDB.AddedFlightPoints[currentContinent][currentZone] then
            table.insert(flightCollection, MoreMapMarkersDB.AddedFlightPoints[currentContinent][currentZone])
            if debug then
                DEFAULT_CHAT_FRAME:AddMessage("Added flightpoints to visible poi's")
            end
        end
        IterateMarkerTable("flight", flightCollection, worldMap, mapWidth, mapHeight)
    elseif debug then
        DEFAULT_CHAT_FRAME:AddMessage("Flightpoints off")
    end

    local reagentCollection = {}
    if showreagent then
        table.insert(reagentCollection, points.reagents[currentContinent][currentZone] or {})
        if MoreMapMarkersDB.AddedReagentVendors[currentContinent] and MoreMapMarkersDB.AddedReagentVendors[currentContinent][currentZone] then
            table.insert(reagentCollection, MoreMapMarkersDB.AddedReagentVendors[currentContinent][currentZone])
            if debug then
                DEFAULT_CHAT_FRAME:AddMessage("Added reagentvendors to visible poi's")
            end
        end
        IterateMarkerTable("reagents", reagentCollection, worldMap, mapWidth, mapHeight)
    elseif debug then
        DEFAULT_CHAT_FRAME:AddMessage("Reagentvendors off")
    end
end

local function InsertInMarkerTable(c, z, x, y, targettype, targetname, faction)
    local affectedtable
    local pointstable
    local label
    if debug then
        DEFAULT_CHAT_FRAME:AddMessage(targettype .. targetname)
    end
    -- Determine which tables to use
    if targettype == "mail" then
        label = "Mailbox"
        affectedtable = MoreMapMarkersDB.AddedMailboxes
        pointstable = points.mail
    elseif targettype == "flight" then
        label = "Flight Master"
        affectedtable = MoreMapMarkersDB.AddedFlightPoints
        pointstable = points.flight
    else
        label = "Reagent Vendor"
        affectedtable = MoreMapMarkersDB.AddedReagentVendors
        pointstable = points.reagents
    end

    -- Initialize continent/zone tables if they don't exist
    affectedtable[c] = affectedtable[c] or {}
    affectedtable[c][z] = affectedtable[c][z] or {}
    pointstable[c] = pointstable[c] or {}
    pointstable[c][z] = pointstable[c][z] or {}

    -- Check for duplicates in both the default points and user-added points
    if IsMarkerPositionFree(c, z, x, y, pointstable) and 
       IsMarkerPositionFree(c, z, x, y, affectedtable) then
        
        -- Insert the new marker with the appropriate fields
        if targettype == "mail" then
            table.insert(affectedtable[c][z], {x, y, targetname or ""})
        else -- flight or reagents
            table.insert(affectedtable[c][z], {x, y, targetname or "", faction})
        end

        -- Print confirmation message
        DEFAULT_CHAT_FRAME:AddMessage(string.format([[{ %.3f, %.3f, %s, %s },--%s]], x, y, targetname or "", faction or "nil", GetZoneText()))
        DEFAULT_CHAT_FRAME:AddMessage(label.." added.")
    else
        DEFAULT_CHAT_FRAME:AddMessage("Duplicate found! Marker not added.")
    end
    
    UpdateMoreMapMarkers(GetCurrentMapContinent(), GetCurrentMapZone())
end

local function GetPlayerWorldLocation()
    local c,z=GetCurrentMapContinent(),GetCurrentMapZone() 
    local x,y=GetPlayerMapPosition("player") 
    return c,z,x,y  
end

local function GenerateFlightMasterInfo()
    local c,z,x,y = GetPlayerWorldLocation()
    local t = UnitName("target") or ""
    InsertInMarkerTable(c, z, x, y, "flight", t, playerfaction)
    UpdateMoreMapMarkers(c, z)
end

local function GenerateMailboxInfo()
    local c,z,x,y = GetPlayerWorldLocation()
    InsertInMarkerTable(c, z, x, y, "mail", "", nil)
    UpdateMoreMapMarkers(c, z)
end

local function GenerateReagentVendorInfo()
    local c,z,x,y = GetPlayerWorldLocation()
    local t = UnitName("target") or ""
    InsertInMarkerTable(c, z, x, y, "reagents", t, playerfaction)
    UpdateMoreMapMarkers(c, z)
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
    local frejm = CreateFrame("Frame", "MoreMapMarkerUI", UIParent)
    frejm:SetWidth(98)
    frejm:SetHeight(48)
    local pos = MoreMapMarkersDB.framePosition or 
    {
        x = 0, y = 0,             
        point = "CENTER",
        relativePoint = "CENTER"
    }
    frejm:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y)
    frejm:SetBackdrop({
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
    frejm:SetMovable(true)
    frejm:EnableMouse(true)
    frejm:RegisterForDrag("LeftButton")
    frejm:SetScript("OnDragStart", function()
        this:StartMoving()
    end)
    frejm:SetScript("OnDragStop", function()
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
    local flightButton = CreateButtonFrame(frejm, "BOTTOMLEFT", 1, 1, 32, TAXI_TEXTURE, GenerateFlightMasterInfo)
    local mailButton = CreateButtonFrame(frejm, "BOTTOMLEFT", 34, 1, 32, MAIL_TEXTURE, GenerateMailboxInfo)
    local vendorButton = CreateButtonFrame(frejm, "BOTTOMLEFT", 67, 1, 32, REAG_TEXTURE, GenerateReagentVendorInfo)
    frejm:Hide()
    return frejm
end

-- Add a flag to track if we've already initialized
local initialized = false

-- Event(s) handling frame
local frame = CreateFrame("Frame")

local lastCurrentZone = nil
local lastCurrentContinent = nil
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
        MoreMapMarkersDB.AddedFlightPoints = MoreMapMarkersDB.AddedFlightPoints or {}
        MoreMapMarkersDB.AddedMailboxes = MoreMapMarkersDB.AddedMailboxes or {}
        MoreMapMarkersDB.AddedReagentVendors = MoreMapMarkersDB.AddedReagentVendors or {}
        if MoreMapMarkersDB.version < CURRENT_VERSION then
            MoreMapMarkersDB.version = CURRENT_VERSION
            DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: Upgraded database to v"..CURRENT_VERSION)
        end
        showmail = MoreMapMarkersDB.ShowMailboxes or true
        showflight = MoreMapMarkersDB.ShowFlightPoints or true
        showreagent = MoreMapMarkersDB.ShowReagentVendors or true
        MoreMapMarkerFrame = CreateMapMarkerUI()
        
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
            UpdateMoreMapMarkers(GetCurrentMapContinent(), GetCurrentMapZone())
        end
    elseif event == "WORLD_MAP_UPDATE" then
        if initialized then
            UpdateMoreMapMarkers(GetCurrentMapContinent(), GetCurrentMapZone())
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
        DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: Settings reset to default.")
    elseif param1 == "clear" then
        MoreMapMarkersDB.AddedFlightPoints = {}
        MoreMapMarkersDB.AddedMailboxes = {}
        MoreMapMarkersDB.AddedReagentVendors = {}
        DEFAULT_CHAT_FRAME:AddMessage("MoreMapMarkers: User pin data cleared!")
    elseif param1 == "on" then
        MoreMapMarkersDB.HidePOIs = false
        hidepointsofinterest = false
        UpdateMoreMapMarkers(GetCurrentMapContinent(), GetCurrentMapZone())
    elseif param1 == "off" then
        MoreMapMarkersDB.HidePOIs = true
        hidepointsofinterest = true
        UpdateMoreMapMarkers(GetCurrentMapContinent(), GetCurrentMapZone())
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
        DEFAULT_CHAT_FRAME:AddMessage("[clear] - clears user data")
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
