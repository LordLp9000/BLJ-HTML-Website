# Refined Sport-Specific GOAT Score Calculator 

function Calculate-GOATScore-Refined {
    param(
        [string]$Sport,
        [string]$Position,
        [double]$Offensive,
        [double]$Defensive, 
        [double]$Achievements,
        [double]$Longevity,
        [double]$ClutchImpact
    )
    
    # Refined position weights to better match existing scores
    $weights = @{}
    
    # Football (Soccer) weights - adjusted based on actual scores
    if ($Sport -eq "football") {
        switch -Regex ($Position) {
            "Forward|Striker|Winger" { 
                $weights = @{ Off = 0.32; Def = 0.08; Ach = 0.28; Lon = 0.16; Clutch = 0.16 }
            }
            "Midfielder" { 
                $weights = @{ Off = 0.24; Def = 0.18; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
            "Defender" { 
                $weights = @{ Off = 0.12; Def = 0.32; Ach = 0.26; Lon = 0.16; Clutch = 0.14 }
            }
            default { 
                $weights = @{ Off = 0.24; Def = 0.18; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
        }
    }
    # Basketball weights
    elseif ($Sport -eq "basketball") {
        switch -Regex ($Position) {
            "Point Guard|Guard" { 
                $weights = @{ Off = 0.28; Def = 0.16; Ach = 0.26; Lon = 0.14; Clutch = 0.16 }
            }
            "Shooting Guard" { 
                $weights = @{ Off = 0.32; Def = 0.14; Ach = 0.26; Lon = 0.14; Clutch = 0.14 }
            }
            "Forward|Small Forward|Power Forward" { 
                $weights = @{ Off = 0.24; Def = 0.20; Ach = 0.26; Lon = 0.14; Clutch = 0.16 }
            }
            "Center" { 
                $weights = @{ Off = 0.20; Def = 0.28; Ach = 0.26; Lon = 0.14; Clutch = 0.12 }
            }
            default { 
                $weights = @{ Off = 0.24; Def = 0.18; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
        }
    }
    # American Football weights
    elseif ($Sport -eq "american-football") {
        switch -Regex ($Position) {
            "Quarterback" { 
                $weights = @{ Off = 0.38; Def = 0.06; Ach = 0.26; Lon = 0.14; Clutch = 0.16 }
            }
            "Running Back|Wide Receiver|Tight End" { 
                $weights = @{ Off = 0.32; Def = 0.10; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
            "Linebacker|Defensive End|Cornerback|Safety" { 
                $weights = @{ Off = 0.10; Def = 0.32; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
            default { 
                $weights = @{ Off = 0.24; Def = 0.18; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
        }
    }
    # Hockey weights
    elseif ($Sport -eq "hockey") {
        switch -Regex ($Position) {
            "Center|Left Wing|Right Wing|Winger" { 
                $weights = @{ Off = 0.28; Def = 0.16; Ach = 0.26; Lon = 0.14; Clutch = 0.16 }
            }
            "Defenseman" { 
                $weights = @{ Off = 0.16; Def = 0.28; Ach = 0.26; Lon = 0.14; Clutch = 0.16 }
            }
            "Goaltender" { 
                $weights = @{ Off = 0.08; Def = 0.36; Ach = 0.26; Lon = 0.14; Clutch = 0.16 }
            }
            default { 
                $weights = @{ Off = 0.24; Def = 0.18; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
            }
        }
    }
    # Formula 1 weights
    elseif ($Sport -eq "formula1") {
        $weights = @{ Off = 0.28; Def = 0.18; Ach = 0.26; Lon = 0.14; Clutch = 0.14 }
    }
    # Other sports - default weights
    else {
        $weights = @{ Off = 0.24; Def = 0.18; Ach = 0.26; Lon = 0.16; Clutch = 0.16 }
    }
    
    # Calculate weighted score
    $score = ($Offensive * $weights.Off) + 
             ($Defensive * $weights.Def) + 
             ($Achievements * $weights.Ach) + 
             ($Longevity * $weights.Lon) + 
             ($ClutchImpact * $weights.Clutch)
    
    # Convert to 0-100 scale and round to 1 decimal
    $finalScore = [Math]::Round($score * 10, 1)
    
    return $finalScore
}

# Test refined calculations
Write-Host "=== REFINED CALCULATIONS ==="
Write-Host ""

# Neymar
$neymarNew = Calculate-GOATScore-Refined -Sport "football" -Position "Forward" -Offensive 9.5 -Defensive 4.2 -Achievements 7.8 -Longevity 8.5 -ClutchImpact 8.2
Write-Host "Neymar Jr. (Forward): Current=79.5, New Calc=$neymarNew"

# Van Dijk  
$vvdNew = Calculate-GOATScore-Refined -Sport "football" -Position "Defender" -Offensive 6.5 -Defensive 9.8 -Achievements 7.0 -Longevity 7.8 -ClutchImpact 7.8
Write-Host "Van Dijk (Defender): Current=68.5, New Calc=$vvdNew"

# Brett Favre (Quarterback)
$favreNew = Calculate-GOATScore-Refined -Sport "american-football" -Position "Quarterback" -Offensive 9.2 -Defensive 2.5 -Achievements 8.5 -Longevity 9.5 -ClutchImpact 8.2
Write-Host "Brett Favre (QB): Current=78.5, New Calc=$favreNew"
