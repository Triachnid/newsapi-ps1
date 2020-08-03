<#
.SYNOPSIS
    Gets All News Articles Based on Parameters
#>
param(
    # Search Query
    [Parameter(Mandatory = $true)]
    [string]$q,
    # Title Query
    [string]$t = '',
    # Source
    [string]$s = '',
    # Domains
    [string]$d = '',
    # Language
    [string]$l = 'en')
$apiKey = '27605a93416945e69d50642adb983dc4'
$uri = "https://newsapi.org/v2/everything?qlnTitle=$t&apiKey=$apiKey&sources=$s&q=$q&language=$en&domains=$d"
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
}