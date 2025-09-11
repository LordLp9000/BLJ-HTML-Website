﻿# Manual check of specific hidden players

. .\refined_calculator.ps1

Write-Host "=== MANUAL VERIFICATION OF HIDDEN PLAYERS ==="
Write-Host ""

# SOCCER PLAYERS
Write-Host " SOCCER (FOOTBALL) HIDDEN PLAYERS:"
Write-Host ""

# Neymar Jr. (Forward): Off=9.5, Def=4.2, Ach=7.8, Lon=8.5, Clutch=8.2, Current=79.5
$neymarCalc = Calculate-GOATScore-Refined -Sport "football" -Position "Forward" -Offensive 9.5 -Defensive 4.2 -Achievements 7.8 -Longevity 8.5 -ClutchImpact 8.2
Write-Host "Neymar Jr. (Forward): Current=79.5, Calculated=$neymarCalc"

# Virgil van Dijk (Defender): Off=6.5, Def=9.8, Ach=7.0, Lon=7.8, Clutch=7.8, Current=68.5
$vvdCalc = Calculate-GOATScore-Refined -Sport "football" -Position "Defender" -Offensive 6.5 -Defensive 9.8 -Achievements 7.0 -Longevity 7.8 -ClutchImpact 7.8
Write-Host "Virgil van Dijk (Defender): Current=68.5, Calculated=$vvdCalc"

# Kevin De Bruyne (Midfielder): Off=9.2, Def=6.8, Ach=7.2, Lon=8.0, Clutch=7.8, Current=73.5
$kdbCalc = Calculate-GOATScore-Refined -Sport "football" -Position "Midfielder" -Offensive 9.2 -Defensive 6.8 -Achievements 7.2 -Longevity 8.0 -ClutchImpact 7.8
Write-Host "Kevin De Bruyne (Midfielder): Current=73.5, Calculated=$kdbCalc"

Write-Host ""
Write-Host " BASKETBALL HIDDEN PLAYERS:"
Write-Host ""

# Kawhi Leonard (Forward): Off=8.5, Def=9.5, Ach=8.0, Lon=7.5, Clutch=8.5, Current=77.8
$kawhiCalc = Calculate-GOATScore-Refined -Sport "basketball" -Position "Forward" -Offensive 8.5 -Defensive 9.5 -Achievements 8.0 -Longevity 7.5 -ClutchImpact 8.5
Write-Host "Kawhi Leonard (Forward): Current=77.8, Calculated=$kawhiCalc"

# Luka Dončić (Guard): Off=10.0, Def=6.0, Ach=6.5, Lon=6.0, Clutch=10.0, Current=72.8
$lukaCalc = Calculate-GOATScore-Refined -Sport "basketball" -Position "Guard" -Offensive 10.0 -Defensive 6.0 -Achievements 6.5 -Longevity 6.0 -ClutchImpact 10.0
Write-Host "Luka Dončić (Guard): Current=72.8, Calculated=$lukaCalc"

# Damian Lillard (Point Guard): Off=9.2, Def=5.8, Ach=6.0, Lon=7.5, Clutch=8.8, Current=68.2
$dameCalc = Calculate-GOATScore-Refined -Sport "basketball" -Position "Point Guard" -Offensive 9.2 -Defensive 5.8 -Achievements 6.0 -Longevity 7.5 -ClutchImpact 8.8
Write-Host "Damian Lillard (Point Guard): Current=68.2, Calculated=$dameCalc"

Write-Host ""
Write-Host " AMERICAN FOOTBALL HIDDEN PLAYERS:"
Write-Host ""

# Brett Favre (Quarterback): Off=9.2, Def=2.5, Ach=8.5, Lon=9.5, Clutch=8.2, Current=78.5
$favreCalc = Calculate-GOATScore-Refined -Sport "american-football" -Position "Quarterback" -Offensive 9.2 -Defensive 2.5 -Achievements 8.5 -Longevity 9.5 -ClutchImpact 8.2
Write-Host "Brett Favre (Quarterback): Current=78.5, Calculated=$favreCalc"

Write-Host ""
Write-Host " HOCKEY HIDDEN PLAYERS:"
Write-Host ""

# Connor McDavid (Center): Off=10.0, Def=6.8, Ach=7.8, Lon=7.2, Clutch=8.5, Current=78.5
$mcdavidCalc = Calculate-GOATScore-Refined -Sport "hockey" -Position "Center" -Offensive 10.0 -Defensive 6.8 -Achievements 7.8 -Longevity 7.2 -ClutchImpact 8.5
Write-Host "Connor McDavid (Center): Current=78.5, Calculated=$mcdavidCalc"

Write-Host ""
Write-Host "=== ANALYSIS ==="
Write-Host "The current scores appear manually set and may not follow the sport-specific formula."
Write-Host "Most calculated scores are higher than the current scores, suggesting the formula may need adjustment or that the current scores were set using a different methodology."