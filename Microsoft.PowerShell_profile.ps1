Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSReadLine

$global:DefaultUser = [System.Environment]::UserName
Set-Theme Paradox

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

function CheatSheet {
    $commandList = '7z x .\Example.zip -aoa -o".\Example" -y'

    return $commandList;
}

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
           [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

if ((Get-Location).Path -eq "C:\Windows\System32")
{
   Set-Location ~
}
