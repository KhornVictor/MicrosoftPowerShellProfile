# Configure fzf appearance to match the screenshot
$env:FZF_DEFAULT_OPTS = @"
--height=12
--layout=reverse
--prompt='> '
--pointer='>'
--marker='>'
--no-separator
--no-scrollbar
--color='bg+:-1,fg+:cyan:bold,hl:yellow:bold,hl+:yellow:bold'
--color='prompt:yellow:bold,pointer:yellow:bold,info:yellow'
"@

# Bind history search
Import-Module PSFzf -ErrorAction SilentlyContinue
try {
    Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue
    Set-PSReadLineOption -PredictionViewStyle ListView -ErrorAction SilentlyContinue
    Set-PSReadLineOption -EditMode Windows -ErrorAction SilentlyContinue
} catch {}

function Init_RandomOhMyPosh {
    $themesPath = "$env:USERPROFILE\.config\poshthemes"

    $themes = Get-ChildItem -Path $themesPath -Filter "*.omp.json" |
        Where-Object { $_.Name -ne "schema.json" }

    if (-not $themes) {
        Write-Host "No themes found in $themesPath" -ForegroundColor Red
        return
    }

    $randomTheme = Get-Random -InputObject $themes
    oh-my-posh init pwsh --config $randomTheme.FullName | Invoke-Expression
    Write-Host "Loaded random theme: $($randomTheme.Name)" -ForegroundColor Cyan
}

Init_RandomOhMyPosh

function theme {
    param (
        [Parameter(Mandatory = $false)]
        [int]$Choice
    )

    # Map choices to theme files
    $themes = @{
        1 = "1_shell.omp.json"
        2 = "agnoster.minimal.omp.json"
        3 = "agnoster.omp.json"
        4 = "agnosterplus.omp.json"
        5 = "aliens.omp.json"
        6 = "amro.omp.json"
        7 = "atomic.omp.json"
        8 = "atomicBit.omp.json"
        9 = "avit.omp.json"
        10 = "blue-owl.omp.json"
        11 = "blueish.omp.json"
        12 = "bubbles.omp.json"
        13 = "bubblesextra.omp.json"
        14 = "bubblesline.omp.json"
        15 = "capr4n.omp.json"
        16 = "catppuccin_frappe.omp.json"
        17 = "catppuccin_latte.omp.json"
        18 = "catppuccin_macchiato.omp.json"
        19 = "catppuccin_mocha.omp.json"
        20 = "catppuccin.omp.json"
        21 = "cert.omp.json"
        22 = "chips.omp.json"
        23 = "cinnamon.omp.json"
        24 = "clean-detailed.omp.json"
        25 = "cloud-context.omp.json"
        26 = "cloud-native-azure.omp.json"
        27 = "cobalt2.omp.json"
        28 = "craver.omp.json"
        29 = "darkblood.omp.json"
        30 = "di4am0nd.omp.json"
        31 = "dracula.omp.json"
        32 = "easy-term.omp.json"
        33 = "emodipt-extend.omp.json"
        34 = "emodipt.omp.json"
        35 = "fish.omp.json"
        36 = "free-ukraine.omp.json"
        37 = "froczh.omp.json"
        38 = "gmay.omp.json"
        39 = "grandpa-style.omp.json"
        40 = "gruvbox.omp.json"
        41 = "half-life.omp.json"
        42 = "honukai.omp.json"
        43 = "hotstick.minimal.omp.json"
        44 = "hul10.omp.json"
        45 = "hunk.omp.json"
        46 = "huvix.omp.json"
        47 = "if_tea.omp.json"
        48 = "illusi0n.omp.json"
        49 = "iterm2.omp.json"
        50 = "jandedobbeleer.omp.json"
        51 = "jblab_2021.omp.json"
        52 = "jonnychipz.omp.json"
        53 = "json.omp.json"
        54 = "jtracey93.omp.json"
        55 = "jv_sitecorian.omp.json"
        56 = "kali.omp.json"
        57 = "kushal.omp.json"
        58 = "lambda.omp.json"
        59 = "lambdageneration.omp.json"
        60 = "larserikfinholt.omp.json"
        61 = "lightgreen.omp.json"
        62 = "M365Princess.omp.json"
        63 = "marcduiker.omp.json"
        64 = "markbull.omp.json"
        65 = "material.omp.json"
        66 = "microverse-power.omp.json"
        67 = "mojada.omp.json"
        68 = "montys.omp.json"
        69 = "mt.omp.json"
        70 = "multiverse-neon.omp.json"
        71 = "negligible.omp.json"
        72 = "neko.omp.json"
        73 = "night-owl.omp.json"
        74 = "nordtron.omp.json"
        75 = "nu4a.omp.json"
        76 = "onehalf.minimal.omp.json"
        77 = "paradox.omp.json"
        78 = "pararussel.omp.json"
        79 = "patriksvensson.omp.json"
        80 = "peru.omp.json"
        81 = "pixelrobots.omp.json"
        82 = "plague.omp.json"
        83 = "poshmon.omp.json"
        84 = "powerlevel10k_classic.omp.json"
        85 = "powerlevel10k_lean.omp.json"
        86 = "powerlevel10k_modern.omp.json"
        87 = "powerlevel10k_rainbow.omp.json"
        88 = "powerline.omp.json"
        89 = "probua.minimal.omp.json"
        90 = "pure.omp.json"
        91 = "quick-term.omp.json"
        92 = "remk.omp.json"
        93 = "robbyrussell.omp.json"
        94 = "rudolfs-dark.omp.json"
        95 = "rudolfs-light.omp.json"
        96 = "schema.json"
        97 = "sim-web.omp.json"
        98 = "slim.omp.json"
        99 = "slimfat.omp.json"
        100 = "smoothie.omp.json"
        101 = "sonicboom_dark.omp.json"
        102 = "sonicboom_light.omp.json"
        103 = "sorin.omp.json"
        104 = "space.omp.json"
        105 = "spaceship.omp.json"
        106 = "star.omp.json"
        107 = "stelbent-compact.minimal.omp.json"
        108 = "stelbent.minimal.omp.json"
        109 = "takuya.omp.json"
        110 = "the-unnamed.omp.json"
        111 = "thecyberden.omp.json"
        112 = "tiwahu.omp.json"
        113 = "tokyo.omp.json"
        114 = "tokyonight_storm.omp.json"
        115 = "tonybaloney.omp.json"
        116 = "uew.omp.json"
        117 = "unicorn.omp.json"
        118 = "velvet.omp.json"
        119 = "wholespace.omp.json"
        120 = "wopian.omp.json"
        121 = "xtoys.omp.json"
        122 = "ys.omp.json"
        123 = "zash.omp.json"
    }

    if (-not $Choice) {
        for ($i = 1; $i -le $themes.Count; $i++) {
            Write-Host "$i. $($themes[$i])" -ForegroundColor Green
        }
        Write-Host "`nPreview the themes:" -ForegroundColor Yellow -NoNewline
        Write-Host " https://ohmyposh.dev/docs/themes`n" -ForegroundColor Cyan
        $Choice = Read-Host "=> "
    }

    if (-not $themes.ContainsKey($Choice)) {
        Write-Host "Invalid choice. Please select a number between 1 and 123." -ForegroundColor Red
        return
    }

    # Load Oh My Posh theme safely
    oh-my-posh init pwsh --config "$env:USERPROFILE\.config\poshthemes\$($themes[$Choice])" | Invoke-Expression
    Clear-Host
}
function initialize {
    # Set UTF-8 Output Encoding
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

    $esc = [char]27

    # Color Definitions
    $cReset     = "$esc[0m"
    $cPsVer     = "$esc[38;2;135;215;0m"        # Lime Green
    $cOrigGreen = "$esc[38;2;135;215;0m"        # Original Green for Name ASCII
    $cCyan      = "$esc[38;2;80;210;210m"       # Cyan
    $cBoxBorder = "$esc[38;2;90;110;100m"       # Muted Slate
    $cBoxTitle  = "$esc[38;2;135;215;0m"        # Lime Green
    $cLabel     = "$esc[38;2;135;215;0m"        # Lime Green

    # Highlight Colors for Values
    $cVal       = "$esc[1;97m"                  # Bold Bright White
    $cHighlight = "$esc[38;2;80;220;255m"       # Bright Electric Cyan Highlight
    $cSub       = "$esc[38;2;140;150;160m"      # Muted Gray for separators

    $cBracket   = "$esc[38;2;90;90;90m"        # Dark Slate
    $cBarFill   = "$esc[38;2;135;215;0m"        # Lime Green
    $cBarEmpty  = "$esc[38;2;60;60;60m"        # Muted Gray

    # Box & Progress Symbols
    $topLeft  = [string][char]0x256D # ╭
    $topRight = [string][char]0x256E # ╮
    $botLeft  = [string][char]0x2570 # ╰
    $botRight = [string][char]0x256F # ╯
    $horiz    = [string][char]0x2500 # ─
    $vert     = [string][char]0x2502 # │
    $fullBar  = [string][char]0x2588 # █
    $emptyBar = [string][char]0x2591 # ░
    $dot      = [string][char]0x25CF # ●

    # Progress Bar Generator
    function Get-BarStr ([int]$pct, [int]$len = 10) {
        $fCount = [math]::Round(($pct / 100) * $len)
        if ($fCount -gt $len) { $fCount = $len }
        if ($fCount -lt 0) { $fCount = 0 }
        $eCount = $len - $fCount
        $fStr = $fullBar * $fCount
        $eStr = $emptyBar * $eCount
        return "$cBracket[$cBarFill$fStr$cBarEmpty$eStr$cBracket]$cReset"
    }

    # Box Construction Helpers
    function MakeTopBox ([string]$title, [int]$width = 65) {
        $prefix = "$topLeft$horiz$horiz "
        $titleLen = $title.Length
        $fillLen = $width - 5 - $titleLen
        if ($fillLen -lt 1) { $fillLen = 1 }
        $fill = $horiz * $fillLen
        return "$cBoxBorder$prefix$cBoxTitle$title $cBoxBorder$fill$topRight$cReset"
    }

    function MakeBotBox ([int]$width = 65) {
        $fill = $horiz * ($width - 2)
        return "$cBoxBorder$botLeft$fill$botRight$cReset"
    }

    # --- System Information Retrieval ---
    $psVersionStr = "PowerShell " + $PSVersionTable.PSVersion.ToString()

    # CPU
    try {
        $cpuObj = Get-CimInstance Win32_Processor | Select-Object -First 1
        $cNameRaw = $cpuObj.Name -replace '\(R\)','' -replace '\(TM\)','' -replace 'CPU @.*','' -replace '\s+',' '
        $cNameRaw = $cNameRaw.Trim()
        $cpuStr = "$cVal$cNameRaw $cSub($cHighlight$($cpuObj.NumberOfCores)C$cSub / $cHighlight$($cpuObj.NumberOfLogicalProcessors)T$cSub) @ $cHighlight$([math]::Round($cpuObj.MaxClockSpeed / 1000, 2)) GHz$cReset"
    } catch {
        $cpuStr = "$cVal Intel Core i9-14900HX $cSub($cHighlight 24C / 32T$cSub) @ $cHighlight 2.20 GHz$cReset"
    }

    # GPU
    try {
        $gpus = Get-CimInstance Win32_VideoController
        $gpuObj = $gpus | Where-Object { $_.Name -match 'NVIDIA|AMD|Radeon|GeForce|RTX|GTX' } | Select-Object -First 1
        if (-not $gpuObj) { $gpuObj = $gpus | Select-Object -First 1 }
        $gNameRaw = $gpuObj.Name -replace '\(R\)','' -replace '\(TM\)','' -replace '\s+',' '
        $gNameRaw = $gNameRaw.Trim()
        $gpuStr = "$cVal$gNameRaw"
    } catch {
        $gpuStr = "$cVal NVIDIA GeForce RTX 4070 Laptop GPU"
    }

    # RAM
    try {
        $osObj = Get-CimInstance Win32_OperatingSystem
        $ramTotal = [math]::Round($osObj.TotalVisibleMemorySize / 1MB, 2)
        $ramFree  = [math]::Round($osObj.FreePhysicalMemory / 1MB, 2)
        $ramUsed  = [math]::Round($ramTotal - $ramFree, 2)
    } catch {
        $ramUsed = 22.60; $ramTotal = 63.62;
    }

    # SWAP
    try {
        $pfObj = Get-CimInstance Win32_PageFileUsage -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($pfObj -and $pfObj.AllocatedBaseSize -gt 0) {
            $swapTotal = [math]::Round($pfObj.AllocatedBaseSize / 1024, 2)
            $swapUsed  = [math]::Round($pfObj.CurrentUsage / 1024, 2)
        } else {
            $swapTotal = [math]::Round(($osObj.TotalVirtualMemorySize / 1MB) - $ramTotal, 2)
            $swapFree  = [math]::Round(($osObj.FreeVirtualMemory / 1MB) - $ramFree, 2)
            if ($swapTotal -lt 0) { $swapTotal = 0 }
            if ($swapFree -lt 0)  { $swapFree = 0 }
            $swapUsed  = [math]::Round($swapTotal - $swapFree, 2)
        }
    } catch {
        $swapUsed = 0.03; $swapTotal = 4.00;
    }

    # Drives
    $driveList = @()
    try {
        $disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
        foreach ($d in $disks) {
            $t = [math]::Round($d.Size / 1GB, 2)
            $f = [math]::Round($d.FreeSpace / 1GB, 2)
            $u = [math]::Round($t - $f, 2)
            $p = [math]::Round(($u / $t) * 100)
            $driveList += [PSCustomObject]@{
                Letter = $d.DeviceID + "\"
                Used   = $u
                Total  = $t
                Pct    = $p
            }
        }
    } catch {}

    # Session / Uptime / Date
    $username = if ($env:USERNAME) { $env:USERNAME } else { "User" }

    # --- TOP SECTION ---
    Write-Host "$cPsVer$psVersionStr$cReset"
    Write-Host ""
    Write-Host "$cCyan`Bienvenue!$cReset"
    Write-Host ""
    Write-Host "$cOrigGreen█████   █████  ███            █████                      $cReset"
    Write-Host "$cOrigGreen░░███   ░░███  ░░░            ░░███                       $cReset"
    Write-Host "$cOrigGreen ░███    ░███  ████   ██████  ███████    ██████  ████████ $cReset"
    Write-Host "$cOrigGreen ░███    ░███ ░░███  ███░░███░░░███░    ███░░███░░███░░███$cReset"
    Write-Host "$cOrigGreen ░░███   ███   ░███ ░███ ░░░   ░███    ░███ ░███ ░███ ░░░ $cReset"
    Write-Host "$cOrigGreen  ░░░█████░    ░███ ░███  ███  ░███ ███░███ ░███ ░███     $cReset"
    Write-Host "$cOrigGreen    ░░███      █████░░██████   ░░█████ ░░██████  █████    $cReset"
    Write-Host "$cOrigGreen     ░░░      ░░░░░  ░░░░░░     ░░░░░   ░░░░░░  ░░░░░     $cReset"
    Write-Host ""

    # --- BOTTOM SECTION: Fetch System Info Dashboard ---
    $boxWidth = 65

    Write-Host ""
    Write-Host (MakeTopBox "Hardware" $boxWidth)
    Write-Host "$cBoxBorder$vert  $cLabel`CPU      $cpuStr"
    Write-Host "$cBoxBorder$vert  $cLabel`GPU      $gpuStr"
    Write-Host "$cBoxBorder$vert  $cLabel`RAM      $cVal$ramUsed GiB $cSub/$cVal $ramTotal GiB"
    Write-Host "$cBoxBorder$vert  $cLabel`SWAP     $cVal$swapUsed GiB $cSub/$cVal $swapTotal GiB"

    foreach ($dr in $driveList) {
        Write-Host "$cBoxBorder$vert  $cLabel`DRIVE    $cHighlight$($dr.Letter) $cVal$($dr.Used) GiB $cSub/$cVal $($dr.Total) GiB"
    }
    Write-Host (MakeBotBox $boxWidth)
    Write-Host ""


    # Color Palette Dots
    $dWhite = "$esc[38;2;220;220;220m"
    $dCyan  = "$esc[38;2;80;210;210m"
    $dPink  = "$esc[38;2;230;100;230m"
    $dBlue  = "$esc[38;2;80;120;240m"
    $dYell  = "$esc[38;2;240;210;80m"
    $dGreen = "$esc[38;2;120;220;100m"
    $dRed   = "$esc[38;2;240;80;80m"
    $dots   = "$dWhite$dot $dCyan$dot $dPink$dot $dBlue$dot $dYell$dot $dGreen$dot $dRed$dot$cReset"
    Write-Host $dots
}


function nemo {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    $content = Get-Content -Path $Path -Raw  # Read whole file as one string
    $lines = $content -split "`r?`n"        # Keep line breaks

    # Copy the REAL content to clipboard
    Set-Clipboard -Value $content

    # Show stars in the terminal (preserve line lengths)
    foreach ($line in $lines) {
        $masked = '*' * $line.Length
        Write-Output $masked
    }

    Write-Host "`n✅ J'ai te vu qui est toi. 😆😆😆" -ForegroundColor Green
}


function profile (){
	# Minimal profile: UTF‑8 + Oh My Posh (if installed) + Fastfetch with explicit config path
	try {
    		[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    		[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    		$OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    		chcp 65001 > $null
	} catch {}


	Write-Host "`n"

	# Force Fastfetch to use YOUR config every time (bypass path confusion)
	if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
		fastfetch -c "$HOME/.config/fastfetch/config.jsonc"
	}

}

if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch -c "$HOME/.config/fastfetch/config.jsonc"
}

# ----------------------------
# Personal information function
# ----------------------------

# Show my information
function me {Write-Host " `nBonjour, Je suis Victor. 🧔‍♂️`nDeveloper & Tech Enthusiast.`n"}	

# copy path
function cpwd {
	$path = Get-Location
	Write-Host "Current Path: " -NoNewline
	Write-Host $path -ForegroundColor Cyan
	(Get-Location).Path | Set-Clipboard
	Write-Host "---" 
	Write-Host "`nCopied successfully ✅" -ForegroundColor Green
}

function goto {
    param(
        [Parameter(Mandatory = $true)]
        [string]$PathFile
    )

    if (-not (Test-Path $PathFile)) {
        Write-Error "❌ File not found: $PathFile"
        return
    }

    $path = Get-Content -Path $PathFile -Raw
    $path = $path.Trim()  # Remove any whitespace or newlines

    if (-not (Test-Path $path)) {
        Write-Error "❌ The path specified in the file does not exist: $path"
        return
    }

    Set-Location -Path $path
    Write-Host "✅ Location changed to: $path" -ForegroundColor Green
}

# ----------------------------
# Browser functions
# ----------------------------

function web {
    param(
        [Parameter(Mandatory = $true)]
        [string]$PathFile
    )

    if (-not (Test-Path $PathFile)) {
        Write-Error "❌ File not found: $PathFile"
        return
    }

    $url = Get-Content -Path $PathFile -Raw
    $url = $url.Trim()

    if ([string]::IsNullOrWhiteSpace($url)) {
        Write-Error "❌ The file is empty or contains only whitespace."
        return
    }

    # Optional: Validate it's a well-formed URI
    try {
        $uri = [System.Uri]$url
        if (-not $uri.IsAbsoluteUri) {
            throw "Not an absolute URI"
        }
    } catch {
        Write-Error "❌ Invalid URL format: $url"
        return
    }

    # Open in default browser (works on Windows)
    Start-Process $url
    Write-Host "✅ Opening: $url" -ForegroundColor Green
}



function moodle {
    $url = if ($env:MOODLE_URL) { $env:MOODLE_URL } else { "https://moodle.ccun.edu.kh/course/index.php?categoryid=45" }
    Start-Process $url
}
function gitlab {Start-Process "https://gitlab.com"}
function gmail {Start-Process "https://mail.google.com"}
function chatgpt {Start-Process "https://chatgpt.com"}
function notion {
    $url = if ($env:NOTION_URL) { $env:NOTION_URL } else { "https://www.notion.so" }
    Start-Process $url
}

function github {
    param(
        [Alias("u")]
        [string]$Username,

        [Alias("t")]
        [string]$Tab,

        [Alias("r")]
        [string]$Repository
    )
    if (-not $Username -and -not $Repository -and -not $Tab) {
        if ($LASTEXITCODE -eq 0) {
            $RemoteUrl = git config --get remote.origin.url
            if ($RemoteUrl) {
                if ($RemoteUrl -match "^git@github\.com:(.+?)/(.+?)(\.git)?$") {
                    $Username = $Matches[1]
                    $Repository = $Matches[2] -replace "\.git$", ""
                } elseif ($RemoteUrl -match "^https://github\.com/(.+?)/(.+?)(\.git)?$") {
                    $Username = $Matches[1]
                    $Repository = $Matches[2] -replace "\.git$", ""
                }

                if ($Username -and $Repository) {
                    $Url = "https://github.com/$Username/$Repository"
                    Write-Host "Git repository found:" -ForegroundColor Green
                    Write-Host $Url
                    Start-Process $Url
                    return
                }
            }
        }
        Start-Process "https://github.com/KhornVictor"
        return
    }
    if (-not $Username) {
        $Username = "KhornVictor"
    }
    $Url = "https://github.com/$Username"
    if ($Repository) { $Url += "/$Repository" }
    if ($Tab) { $Url += "/$Tab" }
    Start-Process $Url
}

function youtube {
    param(
        [Alias("s")]
        [string]$Search
    )

    if ($Search) {
        $encodedSearch = [System.Web.HttpUtility]::UrlEncode($Search)
        Start-Process "https://www.youtube.com/results?search_query=$encodedSearch"
        return
    }

    Start-Process "https://www.youtube.com"
}

function chrome {
    param(
        [Alias("g")]
        [string]$User,

        [Alias("u")]
        [string]$URL,

        [Alias("s")]
        [string]$Search
    )

    $chromeArgs = @()

    if ($User) { $chromeArgs += "--profile-directory=`"$User`"" }

    # Add URL
    if ($URL) {
        if ($URL -notmatch '^https?://') { $URL = "https://$URL" }
        $chromeArgs += $URL
    }

    if ($Search) {
        $encodedSearch = [System.Web.HttpUtility]::UrlEncode($Search)
        $searchURL = "https://www.google.com/search?q=$encodedSearch"

        $chromeArgs += $searchURL
    }
    if ($chromeArgs.Count -eq 0) { Start-Process "chrome.exe" }
    else { Start-Process "chrome.exe" -ArgumentList $chromeArgs }
}


# ----------------------------
# Open PDF
# ----------------------------
function openpdf {
    param(
        [Parameter(Mandatory = $true)]
        [string]$file,

        [Parameter(Mandatory = $false)]
        [string]$folder,

        [ValidateSet("acrobat", "edge", "chrome", "firefox", "default")]
        [string]$with = "default"
    )

    # Base folder (override with $env:LESSONS_PATH or parameter)
    $BASE_FOLDER = if ($folder) { $folder } elseif ($env:LESSONS_PATH) { $env:LESSONS_PATH } else { "$HOME\Documents\Lessons" }

    # Full path
    $fullPath = if ([System.IO.Path]::IsPathRooted($file)) { $file } else { Join-Path $BASE_FOLDER $file }

    # Add .pdf automatically if missing
    if (-not $fullPath.ToLower().EndsWith(".pdf")) {
        $fullPath = "$fullPath.pdf"
    }

    # Check if file exists
    if (!(Test-Path $fullPath)) {
        Write-Host "❌ File not found: $fullPath"
        return
    }

    # Convert local path to file:/// URL with %20 for spaces
    $fileUrl = "file:///" + ($fullPath -replace '\\', '/') -replace ' ', '%20'

    # Open with chosen or default viewer
    switch ($with) {
        "acrobat" { Start-Process "" "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" $fileUrl }
        "edge"    { Start-Process msedge $fileUrl }
        "chrome"  { Start-Process chrome $fileUrl }
        "firefox" { Start-Process firefox $fileUrl }
        default   { Start-Process $fileUrl }
    }
}

# ----------------------------
# Network diagnostic function
# ----------------------------

function netinfo {
    Write-Host "`n--- Network Information ---`n" -ForegroundColor Cyan
    ipconfig /all

    Write-Host "`n--- Active Connections ---`n" -ForegroundColor Cyan
    netstat -an
}

function nettest {
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostname
    )

    Write-Host "`n--- Ping Test ---`n" -ForegroundColor Cyan
    ping $hostname

    Write-Host "`n--- Traceroute ---`n" -ForegroundColor Cyan
    tracert $hostname
}

function netlookup {
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostname
    )

    Write-Host "`n--- DNS Lookup ---`n" -ForegroundColor Cyan
    nslookup $hostname
}

function netportscan {
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostname
    )

    Write-Host "`n--- Port Scan (Top 1000 Ports) ---`n" -ForegroundColor Cyan
    if (Get-Command nmap -ErrorAction SilentlyContinue) {
        nmap -F $hostname
    } else {
        Write-Host "nmap not found. Please install nmap to perform port scanning." -ForegroundColor Yellow
    }
}

function network {
    Write-Host "`n--- Network Command Help ---`n" -ForegroundColor Cyan
    Start-Process "https://github.com/KhornVictor/NetworkCommand"
}

function netdiag {
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostname
    )

    Write-Host "`n--- Ping Test ---`n" -ForegroundColor Cyan
    ping $hostname

    Write-Host "`n--- Traceroute ---`n" -ForegroundColor Cyan
    tracert $hostname

    Write-Host "`n--- DNS Lookup ---`n" -ForegroundColor Cyan
    nslookup $hostname

    Write-Host "`n--- Port Scan (Top 1000 Ports) ---`n" -ForegroundColor Cyan
    if (Get-Command nmap -ErrorAction SilentlyContinue) {
        nmap -F $hostname
    } else {
        Write-Host "nmap not found. Please install nmap to perform port scanning." -ForegroundColor Yellow
    }
}

function port {
    param(
        [Parameter(Mandatory = $true)]
        [int]$port
    )
    
    $results = netstat -ano | Select-String ":$port\b"

    foreach ($match in $results) {
        $parts = $match.Line.Trim() -split "\s+"
        if ($parts.Count -ge 5) {
            $poid = $parts[-1]
            $procName = "Unknown"
            $proc = Get-Process -Id $poid -ErrorAction SilentlyContinue
            if ($proc) {
                $procName = $proc.ProcessName
            }

            [PSCustomObject]@{
                Port    = $port
                PID     = $poid
                Process = $procName
            }
        }
    }
}

function whatismyip {python -u "$HOME\.config\python\network\myIP.py"}
function searchIP {
    param(
        [Parameter(Mandatory = $false)]
        [string]$ipAddress
    )
    python -u "$HOME\.config\python\network\searchIP.py" $ipAddress
    
}
function jitter {
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostname
    )

    python -u "$HOME\.config\python\network\jitter.py" $hostname
}

# ----------------------------
# Path
# ----------------------------

# ----------------------------
# GitHub
# ----------------------------

function push_init {
    param(
        [Parameter(Mandatory = $true)]
        [string]$repository
    )

    git init
    git add .
    git commit -m "first commit"
    git branch -M main
    git remote add origin "https://github.com/KhornVictor/$repository.git"
    git push -u origin main
}

function push_init_org {
    param(
        [Parameter(Mandatory = $true)]
        [string]$organization,

        [Parameter(Mandatory = $true)]
        [string]$repository
    )

    git init
    git add .
    git commit -m "first commit"
    git branch -M main
    git remote add origin "https://github.com/$organization/$repository.git"
    git push -u origin main
}

function push {
    param(
        [Parameter(Mandatory = $false)]
        [string]$message,

        [switch]$Force
    )

    if ([string]::IsNullOrWhiteSpace($message)) {
        $message = "Quick commit: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    }

    # Check git status first
    $status = git status --porcelain
    if (-not $status) {
        Write-Host "ℹ️ Nothing to commit, working tree clean." -ForegroundColor Yellow
        return
    }

    if (-not $Force) {
        Write-Host "Changes staged/unstaged:" -ForegroundColor Cyan
        git status --short
        $confirm = Read-Host "`nProceed with git add ., commit, and push? default is Y (Y/n)"
        $confirm = if ([string]::IsNullOrWhiteSpace($confirm)) { "y" } else { $confirm }
        if ($confirm -notmatch '^(y|yes)$') {
            Write-Host "❌ Push aborted." -ForegroundColor Red
            return
        }
    }

    git add .
    git commit -m "$message"
    git push
    Write-Host "✅ Committed and pushed successfully!" -ForegroundColor Green
}

# ----------------------------
# References
# ----------------------------

function reactref {
    $refPath = if ($env:REACT_REF_PATH) { $env:REACT_REF_PATH } else { "$HOME\.config\references\React_Functions_Reference.md" }
    if (Test-Path $refPath) {
        Get-Content $refPath
    } else {
        Write-Host "Reference file not found at: $refPath" -ForegroundColor Yellow
    }
}

function activate_venv {
    $activateScript = "$HOME\.config\python\.venv\Scripts\Activate.ps1"

    if (Test-Path $activateScript) {
        . $activateScript
        Write-Host "✓ Activated virtual environment at: $activateScript" -ForegroundColor Green
    } else {
        Write-Error "❌ Activate script not found at: $activateScript"
    }
}

# ----------------------------
# PHP 
# ----------------------------

function init_php($name) {
    mkdir $name
    Set-Location $name

    mkdir app, config, routes, views, public
    mkdir app\controllers, app\models
    mkdir views\layout
    mkdir public\css, public\js

    New-Item index.php -ItemType File
    New-Item config\database.php -ItemType File
    New-Item routes\web.php -ItemType File
    New-Item views\home.php -ItemType File
    New-Item views\layout\header.php -ItemType File
    New-Item views\layout\footer.php -ItemType File

    Clear-Host

    Write-Host "✅ PHP project '$name' created successfully!"
}


# --- Direct: Directory Navigation & Bookmark Manager ---
if (Test-Path "C:\Tool\Direct\profile.ps1") {
    . "C:\Tool\Direct\profile.ps1"
}


# ----------------------------
# matrix
# ----------------------------

function matrix {
    try {
        Push-Location "$HOME\.config\Matrix-Rain"
        Clear-Host
        cargo run --release -- --mode abc123
    } finally {
        Pop-Location
    }
}

function fire {
    try {
        Push-Location "$HOME\.config\Fire-Shell"
        Clear-Host
        cargo run --release
    } finally {
        Pop-Location
    }
}

function radar {
    try {
        Push-Location "$HOME\.config\Radar-Shell"
        Clear-Host
        go run main.go
    } finally {
        Pop-Location
    }
}

function randomCode {
    node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
}


# ----------------------------
# Terminal Customization
# ----------------------------
function Change() {
    $targetPath = if ($env:TERMINAL_OS_CONFIG) { $env:TERMINAL_OS_CONFIG } else { "$HOME\Code\TerminalOsConfiguration" }
    if (-not (Test-Path $targetPath)) {
        Write-Host "❌ Directory not found: $targetPath (set `$env:TERMINAL_OS_CONFIG to customize)" -ForegroundColor Yellow
        return
    }
    try {
        Push-Location $targetPath
        cargo run
    } catch {
        Write-Host "❌ Failed to change terminal configuration. Ensure Cargo is installed." -ForegroundColor Red
    } finally {
        Pop-Location
    }
}

function clock() {
    $targetPath = if ($env:TERMINAL_CLOCK_CONFIG) { $env:TERMINAL_CLOCK_CONFIG } else { "$HOME\Code\TerminalClock" }
    if (-not (Test-Path $targetPath)) {
        Write-Host "❌ Directory not found: $targetPath (set `$env:TERMINAL_CLOCK_CONFIG to customize)" -ForegroundColor Yellow
        return
    }
    try {
        Push-Location $targetPath
        cargo run
    } catch {
        Write-Host "❌ Failed to run clock. Ensure Cargo is installed." -ForegroundColor Red
    } finally {
        Pop-Location
    }
}

function terminal {
    if ($args.Count -eq 0) {
        wt.exe -d "$PWD"
    }
    else {
        wt.exe -d "$($args[0])"
    }
}

function mkfolders {
    & "C:\Tool\FolderCreator\target\release\FolderCreator.exe" @args
}

function env(){ Start-Process "SystemPropertiesAdvanced.exe"}

# ----------------------------
# End of Profile
# ----------------------------

function runNest {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath
    )

    if (!(Test-Path $ProjectPath)) {
        Write-Host "Directory not found: $ProjectPath"
        return
    }

    Push-Location $ProjectPath
    try {
        npm run start:dev
    }
    finally {
        Pop-Location
    }
}

function runNext {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath
    )

    if (!(Test-Path $ProjectPath)) {
        Write-Host "Directory not found: $ProjectPath"
        return
    }

    Push-Location $ProjectPath
    try {
        npm run dev
    }
    finally {
        Pop-Location
    }
}

function runNode {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProjectPath
    )

    if (!(Test-Path $ProjectPath)) {
        Write-Host "Directory not found: $ProjectPath"
        return
    }

    Push-Location $ProjectPath
    try {
        node server.js
    }
    finally {
        Pop-Location
    }
}

# ----------------------------
# KeyBind
# ----------------------------

Set-PSReadLineKeyHandler -Chord Ctrl+t -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("Copy-Item ")
}


function c {Clear-Host}
function vs {code .}
function q {exit}
# ----------------------------
# End of Profile
# ----------------------------
