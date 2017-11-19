#region variables
$homedir = $env:HOMEPATH + "\Downloads\"
$sortdir = $homedir + "Sorted"
#endregion
#region directorysort
$items = Get-ChildItem $homedir -File
if (!($sortdir)) {
    new-item -Type "directory" $sortdir
}
foreach ($item in $items) {
    new-item -Type "directory" ($sortdir + "\" + $item.Extension)
    move-item -path ($homedir + $item) -Destination ($sortdir + "\" + $item.Extension)
}
#endregion