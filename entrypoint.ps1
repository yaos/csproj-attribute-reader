#!/usr/bin/pwsh

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]
    $RelativeFilePath
)

$AbsoluteFilePath = Join-Path $env:GITHUB_WORKSPACE $RelativeFilePath

$CsprojFile = Get-Content -Path $AbsoluteFilePath -Raw
$Match = [Regex]::Matches($CsprojFile, "(?<=Version>)(.*)(?=</Version)")

$Version = $Match.Value

Write-Output "::set-output name=Version::$Version"
