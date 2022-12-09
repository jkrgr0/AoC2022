Function Test-RockPaperScissor {
    Param($Oponent, $ExpResult)
    $WinVal = 6
    $DrawVal = 3
    $LooseVal = 0
    $ShapeVal = @{
        'A' = 1
        'B' = 2
        'C' = 3
    }
    Switch ($Oponent) {
        'A' {
            Switch ($ExpResult) {
                'X' {Return $LooseVal + $ShapeVal['C']}
                'Y' {Return $DrawVal + $ShapeVal['A']}
                'Z' {Return $WinVal + $ShapeVal['B']}
            }
        }
        'B' {
            Switch ($ExpResult) {
                'X' {Return $LooseVal + $ShapeVal['A']}
                'Y' {Return $DrawVal + $ShapeVal['B']}
                'Z' {Return $WinVal + $ShapeVal['C']}
            }
        }
        'C' {
            Switch ($ExpResult) {
                'X' {Return $LooseVal + $ShapeVal['B']}
                'Y' {Return $DrawVal + $ShapeVal['C']}
                'Z' {Return $WinVal + $ShapeVal['A']}
            }
        }
    }
}
$InputData = Get-Content -Path .\InputData
[int]$TotalScore = 0
ForEach ($Round in $InputData) {
    $Oponent, $MySelf = $Round -split ' '
    $TotalScore += Test-RockPaperScissor -Oponent $Oponent -ExpResult $MySelf
}
$TotalScore