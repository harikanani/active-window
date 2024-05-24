[CmdletBinding()]
Param()
Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class UserWindows {
        [DllImport("user32.dll")]
        public static extern IntPtr GetForegroundWindow();
    }
"@
try {
    $ActiveHandle = [UserWindows]::GetForegroundWindow()
    $Process = Get-Process | ? { $_.MainWindowHandle -eq $activeHandle }
    $string =  $Process | Select ProcessName, @{Name="AppTitle";Expression= {($_.MainWindowTitle)}}
    Write-Host -NoNewline $string
} catch {
    Write-Error "Failed to get active Window details. More Info: $_"
}
