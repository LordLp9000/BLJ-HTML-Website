# Adjusted Soccer Position-Weighted Formulas - More extreme weighting
Write-Host "ADJUSTED Soccer Position-Weighted Formulas:"
Write-Host "==========================================="
Write-Host "Forward/Striker/Winger: 40% off, 5% def, 25% ach, 15% lon, 15% clutch"
Write-Host "Midfielder: 25% off, 25% def, 25% ach, 15% lon, 10% clutch"  
Write-Host "Defender: 10% off, 45% def, 25% ach, 15% lon, 5% clutch"
Write-Host ""

# Test with examples to show the difference
Write-Host "Testing ADJUSTED formulas:"
Write-Host "=========================="

# Neymar (Forward): off=9.5, def=4.2, ach=7.8, lon=8.5, clutch=8.2, current=79.5
$neymarOld = [Math]::Round((9.5*0.35 + 4.2*0.10 + 7.8*0.25 + 8.5*0.15 + 8.2*0.15)*10, 1)
$neymarNew = [Math]::Round((9.5*0.40 + 4.2*0.05 + 7.8*0.25 + 8.5*0.15 + 8.2*0.15)*10, 1)
Write-Host "Neymar (Forward): Old Formula=$neymarOld, NEW Formula=$neymarNew (Higher offensive reward!)"

# Van Dijk (Defender): off=6.5, def=9.8, ach=7.0, lon=7.8, clutch=7.8, current=68.5
$vvdOld = [Math]::Round((6.5*0.15 + 9.8*0.35 + 7.0*0.25 + 7.8*0.15 + 7.8*0.10)*10, 1)
$vvdNew = [Math]::Round((6.5*0.10 + 9.8*0.45 + 7.0*0.25 + 7.8*0.15 + 7.8*0.05)*10, 1)
Write-Host "Van Dijk (Defender): Old Formula=$vvdOld, NEW Formula=$vvdNew (Higher defensive reward!)"

# Show how this benefits specialized players
Write-Host ""
Write-Host "Impact Analysis:"
Write-Host "================"
Write-Host "- Forwards with high offense get +$([Math]::Round(($neymarNew - $neymarOld), 1)) boost"
Write-Host "- Defenders with high defense get +$([Math]::Round(($vvdNew - $vvdOld), 1)) boost"
Write-Host "- This prevents offensive specialists from being penalized for low defense"
Write-Host "- This prevents defensive specialists from being penalized for low offense"
