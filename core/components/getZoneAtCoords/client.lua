local zoneNames = {
    AIRP = 'Los Santos International Airport',
    ALAMO = 'Alamo Sea',
    ALTA = 'Alta',
    ARMYB = 'Fort Zancudo',
    BANHAMC = 'Banham Canyon Dr',
    BANNING = 'Banning',
    BEACH = 'Vespucci Beach',
    BHAMCA = 'Banham Canyon',
    BRADP = 'Braddock Pass',
    BRADT = 'Braddock Tunnel',
    BURTON = 'Burton',
    CALAFB = 'Calafia Bridge',
    CANNY = 'Raton Canyon',
    CCREAK = 'Cassidy Creek',
    CHAMH = 'Chamberlain Hills',
    CHIL = 'Vinewood Hills',
    CHU = 'Chumash',
    CMSW = 'Chiliad Mountain State Wilderness',
    CYPRE = 'Cypress Flats',
    DAVIS = 'Davis',
    DELBE = 'Del Perro Beach',
    DELPE = 'Del Perro',
    DELSOL = 'La Puerta',
    DESRT = 'Grand Senora Desert',
    DOWNT = 'Downtown',
    DTVINE = 'Downtown Vinewood',
    EAST_V = 'East Vinewood',
    EBURO = 'El Burro Heights',
    ELGORL = 'El Gordo Lighthouse',
    ELYSIAN = 'Elysian Island',
    GALFISH = 'Galilee',
    GOLF = 'GWC and Golfing Society',
    GRAPES = 'Grapeseed',
    GREATC = 'Great Chaparral',
    HARMO = 'Harmony',
    HAWICK = 'Hawick',
    HORS = 'Vinewood Racetrack',
    HUMLAB = 'Humane Labs and Research',
    JAIL = 'Bolingbroke Penitentiary',
    KOREAT = 'Little Seoul',
    LACT = 'Land Act Reservoir',
    LAGO = 'Lago Zancudo',
    LDAM = 'Land Act Dam',
    LEGSQU = 'Legion Square',
    LMESA = 'La Mesa',
    LOSPUER = 'La Puerta',
    MIRR = 'Mirror Park',
    MORN = 'Morningwood',
    MOVIE = 'Richards Majestic',
    MTCHIL = 'Mount Chiliad',
    MTGORDO = 'Mount Gordo',
    MTJOSE = 'Mount Josiah',
    MURRI = 'Murrieta Heights',
    NCHU = 'North Chumash',
    NOOSE = 'N.O.O.S.E',
    OCEANA = 'Pacific Ocean',
    PALCOV = 'Paleto Cove',
    PALETO = 'Paleto Bay',
    PALFOR = 'Paleto Forest',
    PALHIGH = 'Palomino Highlands',
    PALMPOW = 'Palmer-Taylor Power Station',
    PBLUFF = 'Pacific Bluffs',
    PBOX = 'Pillbox Hill',
    PROCOB = 'Procopio Beach',
    RANCHO = 'Rancho',
    RGLEN = 'Richman Glen',
    RICHM = 'Richman',
    ROCKF = 'Rockford Hills',
    RTRAK = 'Redwood Lights Track',
    SANAND = 'San Andreas',
    SANCHIA = 'San Chianski Mountain Range',
    SANDY = 'Sandy Shores',
    SKID = 'Mission Row',
    SLAB = 'Stab City',
    STAD = 'Maze Bank Arena',
    STRAW = 'Strawberry',
    TATAMO = 'Tataviam Mountains',
    TERMINA = 'Terminal',
    TEXTI = 'Textile City',
    TONGVAH = 'Tongva Hills',
    TONGVAV = 'Tongva Valley',
    VCANA = 'Vespucci Canals',
    VESP = 'Vespucci',
    VINE = 'Vinewood',
    WINDF = 'Ron Alternates Wind Farm',
    WVINE = 'West Vinewood',
    ZANCUDO = 'Zancudo River',
    ZP_ORT = 'Port of South Los Santos',
    ZQ_UAR = 'Davis Quartz',
    PROL = 'Prologue / North Yankton',
    ISHeist = 'Cayo Perico Island'
}

--- Returns the zone name at the given coords
---@param coords vector3 -- The coords to get the zone name from
---@return string, string -- The name of the zone and the zone text
---@useage local zoneName, zoneText = QBCorev2.Components.GetZoneAtCoords(vector3)
function QBCorev2.Components.GetZoneAtCoords(coords)
    QBCorev2.Utils.ValidateArgs({coords},{'vector3'})
    local zoneText = GetNameOfZone(coords.x, coords.y, coords.z)
    return zoneNames[zoneText], zoneText
end

--- Backwards compatibility for QBCore.Functions.GetZoneAtCoords
function QBCore.Functions.GetZoneAtCoords(coords)
    if type(coords) == 'vector3' then
        return QBCorev2.Components.GetZoneAtCoords(coords)
    else
        return QBCorev2.Components.GetZoneAtCoords(vector3(coords.x, coords.y, coords.z))
    end
end