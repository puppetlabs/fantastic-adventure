$Files = If ([string]::IsNullOrEmpty($args)) {
  Get-ChildItem -Exclude ".onceover"  | Get-ChildItem -Recurse -File -Filter '*.pp'
} ElseIf ($args[0].ToString() -eq 'help') {
  "Please specify a filter pattern to search for PP files, such as '*.pp'"
  return
} Else {
  $args | ForEach-Object {
    Get-ChildItem -Exclude ".onceover"  | Get-ChildItem -Recurse -File -Filter $_
  }
}
$Files = $Files.FullName

"Validating PP for ${files}"
& puppet epp validate --continue_on_error $Files
