
<#
.SYNOPSIS
    Gets Recent News Articles Based on Parameters
#>
param(
    # Country Code
    [string]$c = 'us',
    # Category
    [string]$cat = '',
    # Search Query
    [string]$q = '',
    # Number of Articles
    [int]$p = 5,
    # Text-To-Speech for Titles
    [bool]$speak = $false
)
$apiKey = '27605a93416945e69d50642adb983dc4'
$uri = "https://newsapi.org/v2/top-headlines?country=$c&apiKey=$apiKey&category=$cat&q=$q&pageSize=$p"
$response = Invoke-RestMethod -Uri $uri
foreach ($article in $response.articles) {
    $title = $article.title
    $description = $article.description
    $url = $article.url
    Write-Host '~~~~~~~~~~~~~~~~~~~~~~~~~Start Article~~~~~~~~~~~~~~~~~~~~~~~~~' -ForegroundColor Green
    Write-Host "Title: $title" -ForegroundColor Cyan
    Write-Host "Description: $description" -ForegroundColor Cyan
    Write-Host "URL: $url" -ForegroundColor Cyan
    Write-Host '~~~~~~~~~~~~~~~~~~~~~~~~~End Article~~~~~~~~~~~~~~~~~~~~~~~~~' -ForegroundColor Red
    if ($speak -eq $true) { Invoke-Expression ".\Speech-Synth.ps1 -speech `"$Title`"" }
}