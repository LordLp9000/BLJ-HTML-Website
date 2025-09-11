# Sport-Specific GOAT Score Calculator with Position Weighting

function Calculate-GOATScore {
    param(
        [string]$Sport,
        [string]$Position,
        [double]$Offensive,
        [double]$Defensive, 
        [double]$Achievements,
        [double]$Longevity,
        [double]$ClutchImpact
    )
    
    # Position weights based on sport and position
    $weights = @{}
    
    # Football (Soccer) weights
    if ($Sport -eq "football") {
        switch -Regex ($Position) {
            "Forward|Striker|Winger" { 
                $weights = @{ Off = 0.35; Def = 0.10; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Midfielder" { 
                $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Defender" { 
                $weights = @{ Off = 0.10; Def = 0.35; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Goalkeeper" { 
                $weights = @{ Off = 0.05; Def = 0.40; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            default { 
                $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
        }
    }
    # Basketball weights
    elseif ($Sport -eq "basketball") {
        switch -Regex ($Position) {
            "Point Guard|Guard" { 
                $weights = @{ Off = 0.30; Def = 0.15; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Shooting Guard" { 
                $weights = @{ Off = 0.35; Def = 0.15; Ach = 0.25; Lon = 0.10; Clutch = 0.15 }
            }
            "Forward|Small Forward|Power Forward" { 
                $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Center" { 
                $weights = @{ Off = 0.20; Def = 0.30; Ach = 0.25; Lon = 0.15; Clutch = 0.10 }
            }
            default { 
                $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
        }
    }
    # American Football weights
    elseif ($Sport -eq "american-football") {
        switch -Regex ($Position) {
            "Quarterback" { 
                $weights = @{ Off = 0.40; Def = 0.05; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Running Back|Wide Receiver|Tight End" { 
                $weights = @{ Off = 0.35; Def = 0.10; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Linebacker|Defensive End|Cornerback|Safety" { 
                $weights = @{ Off = 0.10; Def = 0.35; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            default { 
                $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
        }
    }
    # Hockey weights
    elseif ($Sport -eq "hockey") {
        switch -Regex ($Position) {
            "Center|Left Wing|Right Wing|Winger" { 
                $weights = @{ Off = 0.30; Def = 0.15; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Defenseman" { 
                $weights = @{ Off = 0.15; Def = 0.30; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            "Goaltender" { 
                $weights = @{ Off = 0.05; Def = 0.40; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
            default { 
                $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
            }
        }
    }
    # Formula 1 weights
    elseif ($Sport -eq "formula1") {
        $weights = @{ Off = 0.30; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.10 }
    }
    # Other sports - default weights
    else {
        $weights = @{ Off = 0.25; Def = 0.20; Ach = 0.25; Lon = 0.15; Clutch = 0.15 }
    }
    
    # Calculate weighted score
    $score = ($Offensive * $weights.Off) + 
             ($Defensive * $weights.Def) + 
             ($Achievements * $weights.Ach) + 
             ($Longevity * $weights.Lon) + 
             ($ClutchImpact * $weights.Clutch)
    
    # Convert to 0-100 scale
    $finalScore = [Math]::Round($score * 10, 1)
    
    return $finalScore
}

# Test with Messi
$messiScore = Calculate-GOATScore -Sport "football" -Position "Forward" -Offensive 10.0 -Defensive 4.8 -Achievements 10.0 -Longevity 9.9 -ClutchImpact 10.0
Write-Host "Messi calculated score: $messiScore (actual: 98.7)"

# Test with Bill Russell
$russellScore = Calculate-GOATScore -Sport "basketball" -Position "Center" -Offensive 7.2 -Defensive 10.0 -Achievements 10.0 -Longevity 8.5 -ClutchImpact 8.5
Write-Host "Russell calculated score: $russellScore (actual: 91.5)"
