$coresCount = $args[0]

$systemTemplate = Get-Content -Path .\Template-System.ini
$coreTemplate = Get-Content -Path .\Template-System-Core.ini -Raw

$coresString = ''
for ($coreIndex = 0; $coreIndex -lt $coresCount; $coreIndex++) {
	$coreString = $coreTemplate
	$coreYGraph = 2 + $coreIndex * 4

	$coreString = ($coreString -replace '\$coreIndex', $coreIndex) -replace '\$coreYGraph', $coreYGraph
	# Add-Content test.ini $coreString
	$coresString += $coreString
}

$systemTemplate += $coresString

Set-Content System.ini $systemTemplate
