# Load the function
. .\score_calculator.ps1

# Test soccer hidden players
Write-Host "=== SOCCER HIDDEN PLAYERS ==="
Write-Host ""

# Neymar (Forward): Off=9.5, Def=4.2, Ach=7.8, Lon=8.5, Clutch=8.2, Current Score=79.5
$neymarCalc = Calculate-GOATScore -Sport "football" -Position "Forward" -Offensive 9.5 -Defensive 4.2 -Achievements 7.8 -Longevity 8.5 -ClutchImpact 8.2
Write-Host "Neymar Jr. (Forward): Current=79.5, Calculated=$neymarCalc"

# Mbappé (Forward): Off=9.8, Def=4.5, Ach=7.5, Lon=7.2, Clutch=8.5, Current Score=77.8
$mbappeCalc = Calculate-GOATScore -Sport "football" -Position "Forward" -Offensive 9.8 -Defensive 4.5 -Achievements 7.5 -Longevity 7.2 -ClutchImpact 8.5
Write-Host "Mbappé (Forward): Current=77.8, Calculated=$mbappeCalc"

# Kevin De Bruyne (Midfielder): Off=9.2, Def=6.8, Ach=7.2, Lon=8.0, Clutch=7.8, Current Score=73.5
$kdbCalc = Calculate-GOATScore -Sport "football" -Position "Midfielder" -Offensive 9.2 -Defensive 6.8 -Achievements 7.2 -Longevity 8.0 -ClutchImpact 7.8
Write-Host "Kevin De Bruyne (Midfielder): Current=73.5, Calculated=$kdbCalc"

# Virgil van Dijk (Defender): Off=6.5, Def=9.8, Ach=7.0, Lon=7.8, Clutch=7.8, Current Score=68.5
$vvdCalc = Calculate-GOATScore -Sport "football" -Position "Defender" -Offensive 6.5 -Defensive 9.8 -Achievements 7.0 -Longevity 7.8 -ClutchImpact 7.8
Write-Host "Virgil van Dijk (Defender): Current=68.5, Calculated=$vvdCalc"

Write-Host ""
Write-Host "=== BASKETBALL HIDDEN PLAYERS ==="
Write-Host ""

# Kawhi Leonard (Forward): Off=8.5, Def=9.5, Ach=8.0, Lon=7.5, Clutch=8.5, Current Score=77.8
$kawhiCalc = Calculate-GOATScore -Sport "basketball" -Position "Forward" -Offensive 8.5 -Defensive 9.5 -Achievements 8.0 -Longevity 7.5 -ClutchImpact 8.5
Write-Host "Kawhi Leonard (Forward): Current=77.8, Calculated=$kawhiCalc"
