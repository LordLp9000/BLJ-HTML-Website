# Check remaining F1 drivers that need correction
Write-Host "Remaining F1 Drivers to correct:"
Write-Host "================================="

$remainingF1 = @(
    @{name="Esteban Ocon"; off=7.2; def=7.5; ach=4.8; lon=6.0; clutch=5.8; current=54.2},
    @{name="Pierre Gasly"; off=7.0; def=7.2; ach=4.5; lon=5.8; clutch=5.5; current=51.8},
    @{name="Yuki Tsunoda"; off=7.2; def=6.8; ach=4.0; lon=4.5; clutch=5.2; current=48.5},
    @{name="Alex Albon"; off=6.8; def=7.0; ach=3.8; lon=4.8; clutch=4.8; current=45.2},
    @{name="Logan Sargeant"; off=6.0; def=6.2; ach=3.0; lon=3.5; clutch=4.0; current=38.5}
)

foreach ($driver in $remainingF1) {
    $correctScore = [Math]::Round(($driver.off * 0.25 + $driver.def * 0.10 + $driver.ach * 0.25 + $driver.lon * 0.15 + $driver.clutch * 0.25) * 10, 1)
    $difference = [Math]::Round($correctScore - $driver.current, 1)
    Write-Host "$($driver.name): $($driver.current)  $correctScore (diff: $difference)"
}
