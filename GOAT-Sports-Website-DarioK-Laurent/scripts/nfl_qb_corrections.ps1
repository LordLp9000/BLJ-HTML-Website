# Calculate NFL QBs with QB-weighted formula (45% off, 5% def, 25% ach, 15% lon, 10% clutch)
Write-Host "NFL Quarterbacks - Position-Weighted Corrections:"
Write-Host "================================================="

# Brett Favre: off=9.2, def=2.5, ach=8.5, lon=9.5, clutch=8.2, current=78.5
$favre = [Math]::Round((9.2*0.45 + 2.5*0.05 + 8.5*0.25 + 9.5*0.15 + 8.2*0.10)*10, 1)
Write-Host "Brett Favre: 78.5  $favre"

# Aaron Rodgers: off=9.5, def=2.8, ach=7.5, lon=8.5, clutch=7.2, current=63.5
$rodgers = [Math]::Round((9.5*0.45 + 2.8*0.05 + 7.5*0.25 + 8.5*0.15 + 7.2*0.10)*10, 1)
Write-Host "Aaron Rodgers: 63.5  $rodgers"

# Patrick Mahomes: off=9.8, def=2.5, ach=7.0, lon=6.0, clutch=8.5, current=61.8
$mahomes = [Math]::Round((9.8*0.45 + 2.5*0.05 + 7.0*0.25 + 6.0*0.15 + 8.5*0.10)*10, 1)
Write-Host "Patrick Mahomes: 61.8  $mahomes"

# Josh Allen: off=9.0, def=2.2, ach=5.8, lon=5.5, clutch=7.0, current=60.2
$allen = [Math]::Round((9.0*0.45 + 2.2*0.05 + 5.8*0.25 + 5.5*0.15 + 7.0*0.10)*10, 1)
Write-Host "Josh Allen: 60.2  $allen"

# Lamar Jackson: off=9.2, def=2.5, ach=6.0, lon=5.8, clutch=6.5, current=58.5
$jackson = [Math]::Round((9.2*0.45 + 2.5*0.05 + 6.0*0.25 + 5.8*0.15 + 6.5*0.10)*10, 1)
Write-Host "Lamar Jackson: 58.5  $jackson"

Write-Host ""
Write-Host "QBs now get massive offensive bonuses for their specialized role!"
