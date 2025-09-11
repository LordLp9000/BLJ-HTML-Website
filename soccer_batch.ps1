# Calculate corrections for next batch of soccer players

. .\refined_calculator.ps1

# Mbappé (Forward): Off=9.8, Def=4.5, Ach=7.5, Lon=7.2, Clutch=8.5
$mbappe = Calculate-GOATScore-Refined -Sport "football" -Position "Forward" -Offensive 9.8 -Defensive 4.5 -Achievements 7.5 -Longevity 7.2 -ClutchImpact 8.5
Write-Host "Mbappé: $mbappe"

# Kevin De Bruyne (Midfielder): Off=9.2, Def=6.8, Ach=7.2, Lon=8.0, Clutch=7.8
$kdb = Calculate-GOATScore-Refined -Sport "football" -Position "Midfielder" -Offensive 9.2 -Defensive 6.8 -Achievements 7.2 -Longevity 8.0 -ClutchImpact 7.8
Write-Host "De Bruyne: $kdb"

# Robert Lewandowski (Striker): Off=9.5, Def=4.0, Ach=7.5, Lon=8.8, Clutch=7.5
$lewa = Calculate-GOATScore-Refined -Sport "football" -Position "Striker" -Offensive 9.5 -Defensive 4.0 -Achievements 7.5 -Longevity 8.8 -ClutchImpact 7.5
Write-Host "Lewandowski: $lewa"

# Karim Benzema (Striker): Off=9.2, Def=4.5, Ach=7.8, Lon=9.0, Clutch=8.0
$benz = Calculate-GOATScore-Refined -Sport "football" -Position "Striker" -Offensive 9.2 -Defensive 4.5 -Achievements 7.8 -Longevity 9.0 -ClutchImpact 8.0
Write-Host "Benzema: $benz"

# Virgil van Dijk (Defender): Off=6.5, Def=9.8, Ach=7.0, Lon=7.8, Clutch=7.8
$vvd = Calculate-GOATScore-Refined -Sport "football" -Position "Defender" -Offensive 6.5 -Defensive 9.8 -Achievements 7.0 -Longevity 7.8 -ClutchImpact 7.8
Write-Host "Van Dijk: $vvd"

# Sadio Mané (Winger): Off=8.8, Def=6.2, Ach=6.8, Lon=8.0, Clutch=7.2
$mane = Calculate-GOATScore-Refined -Sport "football" -Position "Winger" -Offensive 8.8 -Defensive 6.2 -Achievements 6.8 -Longevity 8.0 -ClutchImpact 7.2
Write-Host "Mané: $mane"

# Mohamed Salah (Winger): Off=9.0, Def=5.5, Ach=6.5, Lon=7.8, Clutch=7.0
$salah = Calculate-GOATScore-Refined -Sport "football" -Position "Winger" -Offensive 9.0 -Defensive 5.5 -Achievements 6.5 -Longevity 7.8 -ClutchImpact 7.0
Write-Host "Salah: $salah"
