
# Helix Editor Runtime
$env:HELIX_RUNTIME = "C:\Users\Avinash.VFEU-SMK-L\scoop\apps\helix\current\runtime"

# Configure FZF with fd
$env:EDITOR = 'hx'

Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' #-EnableAliasFuzzyEdit -EnableAliasFuzzyKillProcess -EnableAliasFuzzyScoop -EnableFd

# Aliases
New-Alias -Name lg -Value lazygit

function make {
    $MAKE_PATH = Join-Path -Path $PWD -ChildPath "make.bat"
    if (Test-Path $MAKE_PATH) {
        & $MAKE_PATH $args
    }
    else {
        Write-Error "No make.bat found in current directory"
    }
}

function dotfiles {
    git --git-dir=$env:USERPROFILE/.dotfiles --work-tree=$env:USERPROFILE @Args
}

# Load Visual Studio Build Tools environment
& "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64

# Set up environment for vcpkg
$env:VCPKG_ROOT = "C:/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/vcpkg/scripts/buildsystems/vcpkg.cmake"
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

