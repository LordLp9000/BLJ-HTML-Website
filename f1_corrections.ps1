﻿# Calculate correct scores for all hidden F1 drivers
Write-Host "F1 Hidden Drivers - Score Corrections:"
Write-Host "======================================="

$f1Drivers = @(
    @{name="Jackie Stewart"; off=8.8; def=8.5; ach=8.5; lon=7.0; clutch=8.5; current=79.8},
    @{name="Nigel Mansell"; off=8.5; def=7.8; ach=7.8; lon=8.2; clutch=8.0; current=77.5},
    @{name="Nelson Piquet"; off=8.2; def=8.0; ach=8.0; lon=8.0; clutch=7.5; current=75.2},
    @{name="Mika Häkkinen"; off=8.5; def=7.5; ach=7.5; lon=7.0; clutch=8.0; current=72.8},
    @{name="Kimi Räikkönen"; off=8.0; def=7.8; ach=7.2; lon=9.0; clutch=7.2; current=70.5},
    @{name="Jenson Button"; off=7.5; def=8.0; ach=6.8; lon=8.5; clutch=7.0; current=68.2},
    @{name="Daniel Ricciardo"; off=8.2; def=7.2; ach=6.0; lon=7.5; clutch=7.8; current=65.8},
    @{name="Charles Leclerc"; off=8.8; def=7.0; ach=5.8; lon=6.0; clutch=7.2; current=63.5},
    @{name="Lando Norris"; off=8.0; def=7.2; ach=5.5; lon=5.8; clutch=6.8; current=61.2},
    @{name="George Russell"; off=7.8; def=7.5; ach=5.2; lon=5.5; clutch=6.5; current=58.8},
    @{name="Carlos Sainz Jr."; off=7.5; def=7.8; ach=5.0; lon=6.8; clutch=6.2; current=56.5}
)

foreach ($driver in $f1Drivers) {
    $correctScore = [Math]::Round(( $driver['off'] * 0.25 + $driver['def'] * 0.10 + $driver['ach'] * 0.25 + $driver['lon'] * 0.15 + $driver['clutch'] * 0.25 ) * 10, 1)
    $difference   = [Math]::Round($correctScore - $driver['current'], 1)
    Write-Host "$($driver['name']): $($driver['current'])  $correctScore (diff: $difference)"
}
