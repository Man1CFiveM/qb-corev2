-- usefull for natives like GetShapeTestResultIncludingMaterial
-- https://docs.fivem.net/natives/?_0x65287525D951F6BE

local materials ={
    [0] = "None",
    [3929336056] = "MetalSolidMedium",
    [3985845843] = "Woodchips",
    [126470059] = "WoodSolidPolished",
    [909950165] = "SandWet",
    [3660485991] = "Oil",
    [2379541433] = "TreeBark",
    [2552123904] = "WoodHighDensity",
    [1354180827] = "Fiberglass",
    [4201905313] = "CarMetal",
    [3938260814] = "GravelDeep",
    [474149820] = "Paper",
    [2372680412] = "Spine0",
    [2901304848] = "Temp05",
    [702596674] = "Temp12",
    [999829011] = "Puddle",
    [3381615457] = "Twigs",
    [602884284] = "CarGlassMedium",
    [1911121241] = "Temp03",
    [513061559] = "CarGlassOpaque",
    [1761524221] = "MetalDuct",
    [2128369009] = "GravelLarge",
    [1849540536] = "MetalHollowMedium",
    [2668971817] = "PlasticHighDensity",
    [3929491133] = "WoodHollowMedium",
    [1619704960] = "SnowDeep",
    [1343679702] = "Temp08",
    [1993976879] = "WoodHollowSmall",
    [3454750755] = "Rock",
    [2825350831] = "ClavicleLeft",
    [483400232] = "Buttocks",
    [113101985] = "HandLeft",
    [2849806867] = "DriedMeat",
    [2363942873] = "IceTarmac",
    [3546625734] = "PhysPoolTableBall",
    [3724496396] = "Leather",
    [3652308448] = "Tarpaulin",
    [509508168] = "SandDryDeep",
    [1144315879] = "ClayHard",
    [2877802565] = "RoofFelt",
    [127813971] = "RockNoinst",
    [223086562] = "Marsh",
    [1109728704] = "MudDeep",
    [3545514974] = "WoodFloorDusty",
    [1907048430] = "PavingSlab",
    [937503243] = "GlassShootThrough",
    [2015599386] = "ConcretePavement",
    [2737678298] = "ClavicleRight",
    [122789469] = "Cloth",
    [1925605558] = "GravelTrainTrack",
    [815762359] = "WoodSolidLarge",
    [3528912198] = "FiberglassHollow",
    [868733839] = "FreshMeat",
    [3210327185] = "ConcreteDusty",
    [2352068586] = "MudHard",
    [510490462] = "SandCompact",
    [1501078253] = "EmissiveGlass",
    [2016463089] = "PhysCasterRusty",
    [1635937914] = "MudSoft",
    [2461440131] = "Hay",
    [2387446527] = "SandTrack",
    [4043078398] = "PlasterBrittle",
    [2925830612] = "FootRight",
    [2710969365] = "Temp15",
    [1341866303] = "FeatherPillow",
    [605776921] = "PhysPoolTableSurface",
    [2435246283] = "PlasticClear",
    [3158909604] = "SandUnderwater",
    [752131025] = "MetalSolidLarge",
    [158576196] = "CarpetSolidDusty",
    [13626292] = "Temp30",
    [1945073303] = "Marble",
    [4063706601] = "MetalGarageDoor",
    [2206792300] = "StuntRampSurface",
    [4057986041] = "ThighRight",
    [560985072] = "ClaySoft",
    [2898482353] = "CarpetFloorboard",
    [3868849285] = "MetalGrille",
    [2316997185] = "Temp02",
    [2281206151] = "PhysElectricMetal",
    [2885912856] = "CardboardBox",
    [3720844863] = "PlasterSolid",
    [1718294164] = "Neck",
    [2519482235] = "Default",
    [2130571536] = "CarSoftTopClear",
    [5236042] = "Blood",
    [3674578943] = "Temp22",
    [4003336261] = "PhysPedCapsule",
    [746881105] = "Temp01",
    [2573051366] = "CarGlassBulletproof",
    [555004797] = "WoodSolidMedium",
    [1288448767] = "SandWetDeep",
    [1176309403] = "WoodChipboard",
    [1777921590] = "LowerArmRight",
    [1963820161] = "Temp24",
    [652772852] = "ShinLeft",
    [1755188853] = "RoofTile",
    [4021477129] = "MudUnderwater",
    [1011960114] = "Temp17",
    [3895095068] = "WoodSolidSmall",
    [359120722] = "ConcretePothole",
    [762193613] = "MetalChainLinkSmall",
    [772722531] = "PlasticHollowClear",
    [2409420175] = "DirtTrack",
    [576169331] = "Cobblestone",
    [3416406407] = "SnowCompact",
    [1354993138] = "Temp18",
    [2675173228] = "Perspex",
    [3511032624] = "RubberHollow",
    [1078418101] = "Temp29",
    [1429989756] = "TvScreen",
    [2751643840] = "PhysBarbedWire",
    [4149231379] = "Rubber",
    [1247281098] = "CarGlassWeak",
    [2956494126] = "PlasticHighDensityClear",
    [4059664613] = "PhysCaster",
    [2657481383] = "Temp13",
    [3008270349] = "GrassShort",
    [2699818980] = "SandLoose",
    [2601153738] = "PhysGolfBall",
    [1584636462] = "MarshDeep",
    [611561919] = "VfxMetalWaterTower",
    [332778253] = "VfxMetalFlame",
    [312396330] = "MudPothole",
    [4038262533] = "PhysTennisBall",
    [3603690002] = "VfxMetalSteam",
    [286224918] = "AnimalDefault",
    [1070994698] = "CarGlassStrong",
    [1666473731] = "PhysNoFriction",
    [1345867677] = "PhysCarVoid",
    [592446772] = "SandstoneSolid",
    [3124923563] = "PhysElectricFence",
    [3315319434] = "CarSoftTop",
    [1952288305] = "Temp25",
    [3154854427] = "Spine1",
    [2000961972] = "HandRight",
    [1045062756] = "LowerArmLeft",
    [32752644] = "Spine3",
    [2221655295] = "Plastic",
    [3257211236] = "Temp21",
    [2378027672] = "CarEngine",
    [125958708] = "MetalChainLinkLarge",
    [669292054] = "CarpetSolid",
    [3848931141] = "ShinRight",
    [3508906581] = "Ice",
    [1059629996] = "EmissivePlastic",
    [3594309083] = "Soil",
    [581794674] = "Bushes",
    [1457572381] = "Spine2",
    [2847687191] = "MetalSolidSmall",
    [3369548007] = "WoodHollowLarge",
    [2993614768] = "TarmacPainted",
    [465002639] = "Temp23",
    [3784624938] = "UpperArmLeft",
    [3985833031] = "VfxMetalElectrified",
    [3115293198] = "Temp28",
    [1333033863] = "Grass",
    [2154880249] = "WoodHighFriction",
    [1639053622] = "Brick",
    [244521486] = "GlassBulletproof",
    [834144982] = "MetalCorrugatedIron",
    [722686013] = "WoodOldCreaky",
    [63305994] = "Temp10",
    [1913209870] = "SandstoneBrittle",
    [1501153539] = "UpperArmRight",
    [2137197282] = "CarPlastic",
    [2782232023] = "Temp16",
    [2011204130] = "WoodLattice",
    [1886546517] = "TarmacPothole",
    [808719444] = "Foam",
    [1441114862] = "BushesNoinst",
    [1061250033] = "Temp06",
    [1923995104] = "Temp04",
    [3147605720] = "BrickPavement",
    [889255498] = "Temp27",
    [1026054937] = "Temp09",
    [3559574543] = "Head",
    [2100727187] = "MetalRailing",
    [951832588] = "GravelSmall",
    [1187676648] = "Concrete",
    [3833216577] = "GrassLong",
    [3178714198] = "Temp26",
    [1550304810] = "SnowTarmac",
    [627123000] = "PlasticHollow",
    [998201806] = "VfxWoodBeerBarrel",
    [3649011722] = "Temp14",
    [1845676458] = "Laminate",
    [2357397706] = "SnowLoose",
    [2538039965] = "Polystyrene",
    [3108646581] = "Ceramic",
    [15972667] = "MetalHollowSmall",
    [3340854742] = "BreezeBlock",
    [2242086891] = "Temp20",
    [3493162850] = "Temp19",
    [1500272081] = "GlassOpaque",
    [2253637325] = "Leaves",
    [435688960] = "Water",
    [47470226] = "Temp11",
    [3711753465] = "MetalHollowLarge",
    [4044799021] = "RumbleStrip",
    [3565854962] = "MetalSolidRoadSurface",
    [1926285543] = "FootLeft",
    [765206029] = "Stone",
    [2529443614] = "Temp07",
    [2660782956] = "Petrol",
    [673696729] = "SlattedBlinds",
    [972939963] = "PhysPoolTableCushion",
    [4170197704] = "RockMossy",
    [3834431425] = "ThighLeft",
    [236511221] = "CardboardSheet",
    [3539969597] = "MetalManhole",
    [282940568] = "Tarmac",
    [289630530] = "Linoleum",
    [2247498441] = "PhysDynamicCoverBound"
}