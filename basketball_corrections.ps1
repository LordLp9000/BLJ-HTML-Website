# Calculate basketball players with position-weighted formulas
Write-Host "Basketball Hidden Players - Position-Weighted Corrections:"
Write-Host "========================================================="

# Guards (35% off, 10% def, 25% ach, 15% lon, 15% clutch)
Write-Host "GUARDS:"

# Luka Dončić: off=10.0, def=6.0, ach=6.5, lon=6.0, clutch=10.0, current=72.8
$luka = [Math]::Round((10.0*0.35 + 6.0*0.10 + 6.5*0.25 + 6.0*0.15 + 10.0*0.15)*10, 1)
Write-Host "Luka Dončić: 72.8  $luka"

# Donovan Mitchell: off=8.8, def=6.0, ach=5.5, lon=6.0, clutch=7.2, current=62.8
$mitchell = [Math]::Round((8.8*0.35 + 6.0*0.10 + 5.5*0.25 + 6.0*0.15 + 7.2*0.15)*10, 1)
Write-Host "Donovan Mitchell: 62.8  $mitchell"

# Devin Booker: off=8.5, def=5.5, ach=5.8, lon=6.2, clutch=6.8, current=61.5
$booker = [Math]::Round((8.5*0.35 + 5.5*0.10 + 5.8*0.25 + 6.2*0.15 + 6.8*0.15)*10, 1)
Write-Host "Devin Booker: 61.5  $booker"

# Anthony Edwards: off=8.2, def=6.0, ach=4.5, lon=4.8, clutch=5.8, current=54.2
$edwards = [Math]::Round((8.2*0.35 + 6.0*0.10 + 4.5*0.25 + 4.8*0.15 + 5.8*0.15)*10, 1)
Write-Host "Anthony Edwards: 54.2  $edwards"

Write-Host ""
Write-Host "CENTERS (15% off, 40% def, 25% ach, 15% lon, 5% clutch):"

# Nikola Jokić: off=9.0, def=7.0, ach=7.8, lon=7.2, clutch=8.0, current=76.5
$jokic = [Math]::Round((9.0*0.15 + 7.0*0.40 + 7.8*0.25 + 7.2*0.15 + 8.0*0.05)*10, 1)
Write-Host "Nikola Jokić: 76.5  $jokic"

# Joel Embiid: off=8.8, def=8.5, ach=6.8, lon=6.5, clutch=7.5, current=74.2
$embiid = [Math]::Round((8.8*0.15 + 8.5*0.40 + 6.8*0.25 + 6.5*0.15 + 7.5*0.05)*10, 1)
Write-Host "Joel Embiid: 74.2  $embiid"
