# F1 Formula: 25% offense, 10% defense, 25% achievements, 15% longevity, 25% clutch
# Test Jackie Stewart: offensive: 8.8, defensive: 8.5, achievements: 8.5, longevity: 7.0, clutch: 8.5, current: 79.8

Write-Host "F1 Formula Test - Jackie Stewart:"
$offensive = 8.8
$defensive = 8.5
$achievements = 8.5
$longevity = 7.0
$clutch = 8.5
$currentScore = 79.8

$correctScore = [Math]::Round(($offensive * 0.25 + $defensive * 0.10 + $achievements * 0.25 + $longevity * 0.15 + $clutch * 0.25) * 10, 1)
Write-Host "Current: $currentScore"
Write-Host "Correct: $correctScore"
Write-Host ""

# Test Charles Leclerc: offensive: 8.8, defensive: 7.0, achievements: 5.8, longevity: 6.0, clutch: 7.2, current: 63.5
Write-Host "F1 Formula Test - Charles Leclerc:"
$offensive = 8.8
$defensive = 7.0
$achievements = 5.8
$longevity = 6.0
$clutch = 7.2
$currentScore = 63.5

$correctScore = [Math]::Round(($offensive * 0.25 + $defensive * 0.10 + $achievements * 0.25 + $longevity * 0.15 + $clutch * 0.25) * 10, 1)
Write-Host "Current: $currentScore"
Write-Host "Correct: $correctScore"
