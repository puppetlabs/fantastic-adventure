param(
    [Alias('f')]
    [Switch]$Fail
)

"This is a script used to test PRM"
"Contents of target dir: "
Get-ChildItem

if ($Fail) {
  Write-Error "-f flag was triggered, the script will now exit with error code 1"
  exit 1
}
