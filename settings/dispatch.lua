local dispatchType = {
    DT_PoliceAutomobile = false,
    DT_PoliceHelicopter = false,
    DT_FireDepartment = false,
    DT_SwatAutomobile = false,
    DT_AmbulanceDepartment = false,
    DT_PoliceRiders = false,
    DT_PoliceVehicleRequest = false,
    DT_PoliceRoadBlock = false,
    DT_PoliceAutomobileWaitPulledOver = false,
    DT_PoliceAutomobileWaitCruising = false,
    DT_Gangs = false,
    DT_SwatHelicopter = false,
    DT_PoliceBoat = false,
    DT_ArmyVehicle = false,
    DT_BikerBackup = false,
}
-- Loop through the all dispatch types and enable/disable them
local dispatchIndex = 1
for _, toggle in pairs(dispatchType) do
    EnableDispatchService(dispatchIndex, toggle)
    dispatchIndex = dispatchIndex + 1
end
-- Set the max wanted level, 0 will disable the wanted system, 5 is the max wanted level
SetMaxWantedLevel(0)