Function Get-Priority {
    Param($Item)
    If ($Item -cmatch '[a-z]') {
        Return ([int]$Item - 96)
    } ElseIf ($Item -cmatch '[A-Z]') {
        Return (([int]$Item - 64) + 26)
    }
}
$InputData = Get-Content -Path .\InputData
$SumPriorities = 0
for ($i = 0; $i -lt $InputData.Length; $i+=3) {
    $Group = $InputData[$i..$($i+2)]
    $First = $Group[0].ToCharArray()
    $Second = $Group[1].ToCharArray()
    $Third = $Group[2].ToCharArray()
    $UniqueItem = $First | Where-Object {$_ -cin $Second -and $_ -cin $Third} | Select-Object -First 1
    $SumPriorities += Get-Priority -Item $UniqueItem
}
$SumPriorities