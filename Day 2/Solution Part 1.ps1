Function Test-RockPaperScissor {
    Param($Oponent, $MySelf)
    $WinVal = 6
    $DrawVal = 3
    $LooseVal = 0
    $ShapeVal = @{
        'X' = 1
        'Y' = 2
        'Z' = 3
    }
    Switch ($Oponent) {
        'A' {
            Switch ($MySelf) {
                'X' {Return $DrawVal + $ShapeVal[$_]}
                'Y' {Return $WinVal + $ShapeVal[$_]}
                'Z' {Return $LooseVal + $ShapeVal[$_]}
            }
        }
        'B' {
            Switch ($MySelf) {
                'X' {Return $LooseVal + $ShapeVal[$_]}
                'Y' {Return $DrawVal + $ShapeVal[$_]}
                'Z' {Return $WinVal + $ShapeVal[$_]}
            }
        }
        'C' {
            Switch ($MySelf) {
                'X' {Return $WinVal + $ShapeVal[$_]}
                'Y' {Return $LooseVal + $ShapeVal[$_]}
                'Z' {Return $DrawVal + $ShapeVal[$_]}
            }
        }
    }
}
$InputData = Get-Content -Path .\InputData
[int]$TotalScore = 0
ForEach ($Round in $InputData) {
    $Oponent, $MySelf = $Round -split ' '
    $TotalScore += Test-RockPaperScissor -Oponent $Oponent -MySelf $MySelf
}
$TotalScore