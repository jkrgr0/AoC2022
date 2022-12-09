$InputData = Get-Content -Path .\InputData
$Divider = 0
$Index = 0
$Elves = New-Object -TypeName System.Collections.Generic.List[int]
While ($true) {
  $Divider = [Array]::IndexOf($InputData, '', $Index)
  If ($Divider -eq -1) {
    $Elves.Add(($InputData[$Index..$($InputData.Length)] | Measure-Object -Sum).Sum)
    break
  }
  $Elves.Add(($InputData[$Index..$($Divider-1)] | Measure-Object -Sum).Sum)
  $Index = $Divider + 1
}
($Elves | Measure-Object -Maximum).Maximum