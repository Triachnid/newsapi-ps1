<#
.SYNOPSIS
    Text-To-Speach for any input string
#>
param(
    # Words to Say
    [Parameter(Mandatory = $true)]
    [string]$speech
)
Add-Type -AssemblyName System.Speech
$SpeechSynth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer
$SpeechSynth.SelectVoice("Microsoft Zira Desktop")

$SpeechSynth.Speak($speech)