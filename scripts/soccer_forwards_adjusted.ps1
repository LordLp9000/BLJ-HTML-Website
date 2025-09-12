# Calculate corrected scores for soccer forwards/strikers/wingers
# Formula: 40% off, 5% def, 25% ach, 15% lon, 15% clutch

Write-Host "Soccer Forwards/Strikers/Wingers - ADJUSTED Corrections:"
Write-Host "========================================================"

# Neymar Jr. (Forward): off=9.5, def=4.2, ach=7.8, lon=8.5, clutch=8.2, current=79.5
$neymar = [Math]::Round((9.5*0.40 + 4.2*0.05 + 7.8*0.25 + 8.5*0.15 + 8.2*0.15)*10, 1)
Write-Host "Neymar Jr.: 79.5  $neymar"

# Mbappé (Forward): off=9.8, def=4.5, ach=7.5, lon=7.2, clutch=8.5, current=77.8
$mbappe = [Math]::Round((9.8*0.40 + 4.5*0.05 + 7.5*0.25 + 7.2*0.15 + 8.5*0.15)*10, 1)
Write-Host "Mbappé: 77.8  $mbappe"

# Haaland (Striker): off=9.9, def=3.8, ach=6.8, lon=6.5, clutch=7.8, current=75.2
$haaland = [Math]::Round((9.9*0.40 + 3.8*0.05 + 6.8*0.25 + 6.5*0.15 + 7.8*0.15)*10, 1)
Write-Host "Haaland: 75.2  $haaland"

# Lewandowski (Striker): off=9.5, def=4.0, ach=7.5, lon=8.8, clutch=7.5, current=71.8
$lewa = [Math]::Round((9.5*0.40 + 4.0*0.05 + 7.5*0.25 + 8.8*0.15 + 7.5*0.15)*10, 1)
Write-Host "Lewandowski: 71.8  $lewa"

# Benzema (Striker): off=9.2, def=4.5, ach=7.8, lon=9.0, clutch=8.0, current=70.2
$benzema = [Math]::Round((9.2*0.40 + 4.5*0.05 + 7.8*0.25 + 9.0*0.15 + 8.0*0.15)*10, 1)
Write-Host "Benzema: 70.2  $benzema"
