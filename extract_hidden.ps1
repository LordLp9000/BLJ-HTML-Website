﻿# Extract hidden players from HTML file
param(
  [Parameter(Mandatory = $true)]
  [ValidateScript({ Test-Path -LiteralPath $_ })]
  [string]$Path
)

try {
  $content = Get-Content -LiteralPath $Path -Raw -ErrorAction Stop
} catch {
  Write-Error "Failed to read '$Path': $($_.Exception.Message)"
  exit 1
}

# Pattern to find hidden players
$hiddenPattern = '\{ name: "([^"]+)"[^}]+position: "([^"]+)"[^}]+offensive: ([\d.]+), defensive: ([\d.]+), achievementsRating: ([\d.]+), longevity: ([\d.]+), clutchImpact: ([\d.]+)[^}]+score: ([\d.]+)[^}]+hidden: true \}'

$matches = [regex]::Matches($content, $hiddenPattern)

Write-Host "Found $($matches.Count) hidden players:"
Write-Host ""

foreach ($match in $matches) {
    $name = $match.Groups[1].Value
    $position = $match.Groups[2].Value
    $offensive = [double]$match.Groups[3].Value
    $defensive = [double]$match.Groups[4].Value
    $achievements = [double]$match.Groups[5].Value
    $longevity = [double]$match.Groups[6].Value
    $clutch = [double]$match.Groups[7].Value
    $currentScore = [double]$match.Groups[8].Value
    
    Write-Host "$name ($position): Off=$offensive, Def=$defensive, Ach=$achievements, Lon=$longevity, Clutch=$clutch, Score=$currentScore"
}
