$confirmation = Read-Host "Do you want to install SillyTavern? (Y/N)"
if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    Write-Host "Downloading & Installing    NodeJS"
    winget install -e --id OpenJS.NodeJS -v 18.11.0

    Write-Host "Installing Git"
    winget install --id Git.Git -e --source winget
    
    Write-Host "Installing SillyTavern"
    git clone https://github.com/SillyTavern/SillyTavern.git
    Set-Location SillyTavern
    Write-Host "Creating a dekstop shortcut for SillyTavern"
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut("$HOME\Desktop\Start_SillyTavern.lnk")
    $shortcut.TargetPath = "$PWD\start.bat"
    $shortcut.Save()

    Write-Host "Starting SillyTavern"
    Write-Host "If you need help for other things (Charather, API...) check this tutorial https://www.youtube.com/watch?v=BMcJHfGZs-s or the wiki https://docs.sillytavern.app"
    ./start.bat

}
else {
    Write-Host "Operation cancelled."
}