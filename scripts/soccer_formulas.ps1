# Define soccer position-weighted formulas
# Forward/Striker/Winger: Higher offensive weight, lower defensive weight
# Midfielder: Balanced approach
# Defender: Higher defensive weight, lower offensive weight

Write-Host "Soccer Position-Weighted Formulas:"
Write-Host "=================================="
Write-Host "Forward/Striker/Winger: 35% off, 10% def, 25% ach, 15% lon, 15% clutch"
Write-Host "Midfielder: 25% off, 20% def, 25% ach, 15% lon, 15% clutch"  
Write-Host "Defender: 15% off, 35% def, 25% ach, 15% lon, 10% clutch"
Write-Host ""

# Test with some soccer players
Write-Host "Testing soccer formulas:"
Write-Host "========================"

# Neymar (Forward): off=9.5, def=4.2, ach=7.8, lon=8.5, clutch=8.2, current=79.5
$neymarCorrect = [Math]::Round((9.5*0.35 + 4.2*0.10 + 7.8*0.25 + 8.5*0.15 + 8.2*0.15)*10, 1)
Write-Host "Neymar (Forward): 79.5  $neymarCorrect"

# KDB (Midfielder): off=9.2, def=6.8, ach=7.2, lon=8.0, clutch=7.8, current=73.5
$kdbCorrect = [Math]::Round((9.2*0.25 + 6.8*0.20 + 7.2*0.25 + 8.0*0.15 + 7.8*0.15)*10, 1)
Write-Host "De Bruyne (Midfielder): 73.5  $kdbCorrect"

# Van Dijk (Defender): off=6.5, def=9.8, ach=7.0, lon=7.8, clutch=7.8, current=68.5
$vvdCorrect = [Math]::Round((6.5*0.15 + 9.8*0.35 + 7.0*0.25 + 7.8*0.15 + 7.8*0.10)*10, 1)
Write-Host "Van Dijk (Defender): 68.5  $vvdCorrect"
