$EdgeVersion = (Get-AppxPackage "Microsoft.MicrosoftEdge.Stable" -AllUsers).Version
$EdgeLstVersion=$EdgeVersion[-1]
$EdgeSetupPath = ${env:ProgramFiles(x86)} + '\Microsoft\Edge\Application\' + $EdgeLstVersion
cd $EdgeSetupPath
.\Installer\setup.exe --uninstall --system-level --verbose-logging --force-uninstall