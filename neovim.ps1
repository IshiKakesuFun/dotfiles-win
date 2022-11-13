# Get the ID and security principal of the current user account
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal = new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
  
# Get the security principal for the Administrator role
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
  
# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole)) {
    # We are running "as Administrator" - so change the title and background color to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    #$Host.UI.RawUI.BackgroundColor = "DarkBlue"
    clear-host
}
else {
    # We are not running "as Administrator" - so relaunch as administrator
    
    # Create a new process object that starts PowerShell
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    
    # Specify the current script path and name as a parameter
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    
    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";
    
    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);
    
    # Exit from the current, unelevated, process
    exit
}
  
# Run your code that needs to be elevated here
Write-Host "Create symbolic links:`n"

$lnvim = "$env:LOCALAPPDATA\nvim";
$lnvimData = $lnvim + "-data";

$nvim = $PSScriptRoot + "\.config\nvim";
$nvimData = $nvim + "-data";

Write-Host "$lnvim -> $nvim";
Write-Host "$lnvimData -> $nvimData";

Write-Host "`nPress any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");

if (Test-Path "$lnvim") {
    (Get-Item "$lnvim").Delete();
}
New-Item -ItemType SymbolicLink -Path "$lnvim" -Target "$nvim";

if (Test-Path "$lnvimData") {
    (Get-Item "$lnvimData").Delete();
}
New-Item -ItemType SymbolicLink -Path "$lnvimData" -Target "$nvimData";

Write-Host "`nInstall neovim using scoop";

Write-Host "`nPress any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");

scoop bucket add versions
scoop install neovim-nightly
scoop list

Write-Host "`nInstall nodejs neovim provider";
Write-Host "`nPress any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");

npm install -g neovim
npm -g list

Write-Host "`nPress any key to continue...";
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown");
