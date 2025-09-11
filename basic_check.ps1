# Check if current scores follow basic formula (0.25, 0.20, 0.25, 0.15, 0.15)

function Calculate-BasicGOAT {
    param($Off, $Def, $Ach, $Lon, $Clutch)
    return [Math]::Round((($Off * 0.25) + ($Def * 0.20) + ($Ach * 0.25) + ($Lon * 0.15) + ($Clutch * 0.15)) * 10, 1)
}

Write-Host "=== CHECKING BASIC FORMULA ===
Write-Host ""

# Neymar: Off=9.5, Def=4.2, Ach=7.8, Lon=8.5, Clutch=8.2, Current=79.5
$neymarBasic = Calculate-BasicGOAT -Off 9.5 -Def 4.2 -Ach 7.8 -Lon 8.5 -Clutch 8.2
Write-Host "Neymar: Current=79.5, Basic Formula=$neymarBasic"

# Van Dijk: Off=6.5, Def=9.8, Ach=7.0, Lon=7.8, Clutch=7.8, Current=68.5
$vvdBasic = Calculate-BasicGOAT -Off 6.5 -Def 9.8 -Ach 7.0 -Lon 7.8 -Clutch 7.8
Write-Host "Van Dijk: Current=68.5, Basic Formula=$vvdBasic"

# Kawhi: Off=8.5, Def=9.5, Ach=8.0, Lon=7.5, Clutch=8.5, Current=77.8
$kawhiBasic = Calculate-BasicGOAT -Off 8.5 -Def 9.5 -Ach 8.0 -Lon 7.5 -Clutch 8.5
Write-Host "Kawhi: Current=77.8, Basic Formula=$kawhiBasic"

# Luka: Off=10.0, Def=6.0, Ach=6.5, Lon=6.0, Clutch=10.0, Current=72.8
$lukaBasic = Calculate-BasicGOAT -Off 10.0 -Def 6.0 -Ach 6.5 -Lon 6.0 -Clutch 10.0
Write-Host "Luka: Current=72.8, Basic Formula=$lukaBasic"

# Brett Favre: Off=9.2, Def=2.5, Ach=8.5, Lon=9.5, Clutch=8.2, Current=78.5
$favreBasic = Calculate-BasicGOAT -Off 9.2 -Def 2.5 -Ach 8.5 -Lon 9.5 -Clutch 8.2
Write-Host "Brett Favre: Current=78.5, Basic Formula=$favreBasic"

Write-Host ""
Write-Host "=== CONCLUSION ==="
Write-Host "Checking if current scores match the basic formula..."
