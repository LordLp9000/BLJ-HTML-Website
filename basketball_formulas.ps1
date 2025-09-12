# Basketball Position-Weighted Formulas
Write-Host "Basketball Position-Weighted Formulas:"
Write-Host "======================================"
Write-Host "Guard (PG/SG): 35% off, 10% def, 25% ach, 15% lon, 15% clutch"
Write-Host "Forward (SF/PF): 30% off, 20% def, 25% ach, 15% lon, 10% clutch"  
Write-Host "Center (C): 15% off, 40% def, 25% ach, 15% lon, 5% clutch"
Write-Host ""

# Test with some basketball players (find some examples)
Write-Host "Testing basketball formulas with hypothetical examples:"
Write-Host "======================================================"

# Example Guard with high offense
$guardExample = [Math]::Round((9.0*0.35 + 6.0*0.10 + 8.0*0.25 + 8.0*0.15 + 8.5*0.15)*10, 1)
Write-Host "High-offense Guard (9.0 off, 6.0 def): $guardExample"

# Example Center with high defense  
$centerExample = [Math]::Round((6.0*0.15 + 9.5*0.40 + 7.5*0.25 + 8.0*0.15 + 7.0*0.05)*10, 1)
Write-Host "High-defense Center (6.0 off, 9.5 def): $centerExample"

Write-Host ""
Write-Host "This rewards guards for offensive skills and centers for defensive dominance!"
