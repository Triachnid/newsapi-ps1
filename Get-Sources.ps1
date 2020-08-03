<#
.SYNOPSIS
    Gets All News Sources Based on Parameters
#>
param(
    # Country Code
    [string]$c = 'us',
    # Language
    [string]$l = 'en',
    # Category
    [string]$cat = ''
)
$apiKey = '27605a93416945e69d50642adb983dc4'
$uri = "https://newsapi.org/v2/sources?apiKey=$apiKey&country=$c&language=$l&category=$cat"
$response = Invoke-RestMethod -Uri $uri
foreach ($source in $response.sources) {
    $id = $source.id
    $name = $source.name
    $description = $source.description
    $url = $source.url
    Write-Host '~~~~~~~~~~~~~~~~~~~~~~~~~Start Source~~~~~~~~~~~~~~~~~~~~~~~~~' -ForegroundColor Green
    Write-Host "Id: $id" -ForegroundColor Cyan
    Write-Host "Name: $name" -ForegroundColor Cyan
    Write-Host "Description: $description" -ForegroundColor Cyan
    Write-Host "URL: $url" -ForegroundColor Cyan
    Write-Host '~~~~~~~~~~~~~~~~~~~~~~~~~End source~~~~~~~~~~~~~~~~~~~~~~~~~' -ForegroundColor Red
}