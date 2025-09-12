# American Football Position-Weighted Formulas
Write-Host "American Football Position-Weighted Formulas:"
Write-Host "=============================================="
Write-Host "Quarterback (QB): 45% off, 5% def, 25% ach, 15% lon, 10% clutch"
Write-Host "Offensive Skills (RB/WR/TE): 40% off, 10% def, 25% ach, 15% lon, 10% clutch"  
Write-Host "Defensive Players (LB/DB/DL): 10% off, 45% def, 25% ach, 15% lon, 5% clutch"
Write-Host ""

# Test with examples
Write-Host "Testing American Football formulas:"
Write-Host "==================================="

# Example QB with high offense (like Tom Brady)
$qbExample = [Math]::Round((9.5*0.45 + 5.0*0.05 + 9.0*0.25 + 9.5*0.15 + 9.0*0.10)*10, 1)
Write-Host "Elite QB (9.5 off, 5.0 def): $qbExample"

# Example Defensive player with high defense
$defExample = [Math]::Round((6.0*0.10 + 9.8*0.45 + 8.0*0.25 + 8.5*0.15 + 7.5*0.05)*10, 1)
Write-Host "Elite Defense (6.0 off, 9.8 def): $defExample"

Write-Host ""
Write-Host "This maximizes QB offensive impact and defensive player defensive dominance!"
