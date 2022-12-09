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
ForEach ($Rucksack in $InputData) {
    $HalfStringLength = [Math]::Floor($Rucksack.Length / 2)
    $FirstHalf = $Rucksack.Substring(0, $HalfStringLength).ToCharArray()
    $SecondHalf = $Rucksack.Substring($HalfStringLength).ToCharArray()
    $UniqueItem = $FirstHalf | Where-Object {$_ -cin $SecondHalf} | Select-Object -First 1
    $SumPriorities += Get-Priority -Item $UniqueItem
}
$SumPriorities