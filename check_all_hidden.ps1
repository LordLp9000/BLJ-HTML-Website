# Comprehensive Hidden Player Score Checker and Corrector

. .\refined_calculator.ps1

# Parse hidden players from file and check scores
$content = Get-Content "goat_sports_website (1.html" -Raw

# Find all sport sections and their hidden players
$sportsMap = @{
    "football" = @()
    "basketball" = @()
    "american-football" = @()
    "hockey" = @()
    "formula1" = @()
    "volleyball" = @()
    "cricket" = @()
    "handball" = @()
    "rugby" = @()
    "baseball" = @()
}

# Extract hidden players with more complete info
$hiddenLines = Get-Content "goat_sports_website (1.html" | Where-Object { $_ -match "hidden: true" }

Write-Host "=== HIDDEN PLAYER SCORE VERIFICATION ==="
Write-Host "Found $($hiddenLines.Count) hidden player lines"
Write-Host ""

$corrections = @()

foreach ($line in $hiddenLines) {
    if ($line -match 'name: "([^"]+)".*position: "([^"]+)".*offensive: ([\d.]+), defensive: ([\d.]+), achievementsRating: ([\d.]+), longevity: ([\d.]+), clutchImpact: ([\d.]+).*score: ([\d.]+)') {
        $name = $matches[1]
        $position = $matches[2]
        $offensive = [double]$matches[3]
        $defensive = [double]$matches[4]
        $achievements = [double]$matches[5]
        $longevity = [double]$matches[6]
        $clutch = [double]$matches[7]
        $currentScore = [double]$matches[8]
        
        # Determine sport based on context in file
        $sport = "unknown"
        if ($line -match "football.*\[" -or ($name -match "Messi|Ronaldo|Neymar|Mbappé|Haaland|Benzema|Lewandowski")) {
            $sport = "football"
        }
        elseif ($line -match "basketball.*\[" -or ($name -match "Jordan|LeBron|Kawhi|Jokić|Embiid|Dončić")) {
            $sport = "basketball"
        }
        elseif ($line -match "american-football.*\[" -or ($name -match "Favre|Brady|Mahomes|Allen|Jackson")) {
            $sport = "american-football"
        }
        elseif ($line -match "hockey.*\[" -or ($name -match "McDavid|Gretzky|Ovechkin|Crosby")) {
            $sport = "hockey"
        }
        elseif ($line -match "formula1.*\[" -or ($name -match "Hamilton|Verstappen|Schumacher|Stewart")) {
            $sport = "formula1"
        }
        else {
            # Try to determine from nearby context
            $lineIndex = (Get-Content "goat_sports_website (1.html").IndexOf($line)
            $contextLines = Get-Content "goat_sports_website (1.html" | Select-Object -Skip ([math]::Max(0, $lineIndex-20)) -First 40
            
            if ($contextLines -match "football.*:.*\[") { $sport = "football" }
            elseif ($contextLines -match "basketball.*:.*\[") { $sport = "basketball" }
            elseif ($contextLines -match "american-football.*:.*\[") { $sport = "american-football" }
            elseif ($contextLines -match "hockey.*:.*\[") { $sport = "hockey" }
            elseif ($contextLines -match "formula1.*:.*\[") { $sport = "formula1" }
            else { $sport = "other" }
        }
        
        # Calculate correct score
        $calculatedScore = Calculate-GOATScore-Refined -Sport $sport -Position $position -Offensive $offensive -Defensive $defensive -Achievements $achievements -Longevity $longevity -ClutchImpact $clutch
        
        $difference = [math]::Abs($currentScore - $calculatedScore)
        
        if ($difference -gt 1.0) {
            Write-Host " $name ($sport - $position): Current=$currentScore, Should be=$calculatedScore (Diff: $([math]::Round($difference,1)))"
            $corrections += @{
                Name = $name
                Sport = $sport
                Position = $position
                CurrentScore = $currentScore
                CorrectScore = $calculatedScore
                Line = $line
            }
        } else {
            Write-Host " $name ($sport - $position): Current=$currentScore, Calculated=$calculatedScore "
        }
    }
}

Write-Host ""
Write-Host "=== CORRECTIONS NEEDED ==="
Write-Host "Found $($corrections.Count) players with incorrect scores"

foreach ($correction in $corrections) {
    Write-Host " $($correction.Name): $($correction.CurrentScore)  $($correction.CorrectScore)"
}
