Invoke-Expression (&starship init powershell)


oh-my-posh init pwsh --config "$env:USERPROFILE\.config\poshthemes\1_shell.omp.json" | Invoke-Expression

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

Write-Host "Bienvenue!" -ForegroundColor Cyan
Write-Host "`n                     
 █████   █████  ███            █████                      
░░███   ░░███  ░░░            ░░███                       
 ░███    ░███  ████   ██████  ███████    ██████  ████████ 
 ░███    ░███ ░░███  ███░░███░░░███░    ███░░███░░███░░███
 ░░███   ███   ░███ ░███ ░░░   ░███    ░███ ░███ ░███ ░░░ 
  ░░░█████░    ░███ ░███  ███  ░███ ███░███ ░███ ░███     
    ░░███      █████░░██████   ░░█████ ░░██████  █████    
     ░░░      ░░░░░  ░░░░░░     ░░░░░   ░░░░░░  ░░░░░                                                                                                                                                               
" -ForegroundColor Green

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


# function profile (){
# 	# Minimal profile: UTF‑8 + Oh My Posh (if installed) + Fastfetch with explicit config path
# 	try {
#     		[Console]::InputEncoding  = [System.Text.Encoding]::UTF8
#     		[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
#     		$OutputEncoding = [System.Text.UTF8Encoding]::new($false)
#     		chcp 65001 > $null
# 	} catch {}


# 	Write-Host "`n"

# 	# Force Fastfetch to use YOUR config every time (bypass path confusion)
# 	if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
#     		fastfetch -c "C:/Users/Khorn Victor/.config/fastfetch/config.jsonc"
# 	}

# }

fastfetch -c "C:/Users/Khorn Victor/.config/fastfetch/config.jsonc"

# ----------------------------
# Personal information function
# ----------------------------

# Show my information
function me {Write-Host " `nBonjour, Je suis Victor. 🧔‍♂️`nJ'étudie en un intitute de technologie.🧑‍🏫`nJe viens de la France. 🌍`nJ'habite à Paris. 🗼`nEncanté!`n"}	

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

function search {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$query
    )

    $search = [System.Web.HttpUtility]::UrlEncode($query -join " ")
    start chrome "https://www.google.com/search?q=$search"
}

function moodle {start chrome "https://moodle.ccun.edu.kh/course/index.php?categoryid=45"}
function github {start chrome "https://github.com"}
function gmail {start chrome "https://mail.google.com"}
function chatgpt {start chrome "https://chatgpt.com"}
function notion {start chrome "https://www.notion.so/2efbb8d2959b45fd97ba7ae0f0535705"}

function chrome {
    param([string]$url)
    start chrome $url
}

function youtube {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$query
    )

    if (-not $query) {
        start chrome "https://www.youtube.com"
        return
    }
    
    $search = [System.Web.HttpUtility]::UrlEncode($query -join " ")
    start chrome "https://www.youtube.com/results?search_query=$search"
}


function firefox {
    param([string]$url)
    start firefox $url
}

function edge {
    param([string]$url)
    start msedge $url
}

# ----------------------------
# Clean ChatGPT function
# ----------------------------

function Start-GPT4All {

    python -u "C:\Users\Khorn Victor\ChatGPT\chat_local.py"

}


# ----------------------------
# Open PDF
# ----------------------------
function openpdf {
    param(
        [Parameter(Mandatory = $true)]
        [string]$file,

        [ValidateSet("acrobat", "edge", "chrome", "firefox")]
        [string]$with = "edge"
    )

    # Base folder (local path)
    $BASE_FOLDER = "D:\Student Online (SO)\Techno\I3-GIC-1B\Semester1\Object-Oriented Program\Lesson"

    # Full path
    $fullPath = Join-Path $BASE_FOLDER $file

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

    # Open with the chosen app
    switch ($with) {
        "acrobat" { start "" "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" $fileUrl }
        "edge"    { start msedge $fileUrl }
        "chrome"  { start chrome $fileUrl }
        "firefox" { start firefox $fileUrl }
    }
}

# ----------------------------
# Telegram Bot functions
# ----------------------------

function chatting {
    [CmdletBinding()]
    param(
        [switch]$UseVenv  # Activate .venv if available
    )

    $project = "D:\Tool\HackerTool\Telegram_Bot_Prank"
    Push-Location $project
    try {
        if ($UseVenv -and (Test-Path ".\.venv\Scripts\Activate.ps1")) {
            . .\.venv\Scripts\Activate.ps1
            Write-Host "✓ Activated .venv" -ForegroundColor Green
        }

        if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
            Write-Error "Python not found in PATH. Install Python or add it to PATH."
            return
        }

        if (-not (Test-Path ".env")) {
            Write-Host "⚠️  .env not found — ensure TELEGRAM_BOT_TOKEN is configured." -ForegroundColor Yellow
        }

        python ".\main.py"
    }
    finally {
        Pop-Location
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

function nethelp {
    Write-Host "`n--- Network Command Help ---`n" -ForegroundColor Cyan
    cat "C:\Users\Khorn Victor\.config\python\network\AllNetworkCommand.md"
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
    
    $results = netstat -ano | findstr ":$port"

    foreach ($line in $results) {
        $parts = $line -split "\s+"
        $pid = $parts[-1]
        $process = Get-Process -Id $pid -ErrorAction SilentlyContinue

        [PSCustomObject]@{
            Port     = $port
            PID      = $pid
            Process  = $process.ProcessName
        }
    }
}

function whatismyip {python -u "C:\Users\Khorn Victor\.config\python\network\myIP.py"}
function searchIP {
    param(
        [Parameter(Mandatory = $false)]
        [string]$ipAddress
    )
    python -u "C:\Users\Khorn Victor\.config\python\network\searchIP.py" $ipAddress
    
}
function jitter {
    param(
        [Parameter(Mandatory = $true)]
        [string]$hostname
    )

    python -u "C:\Users\Khorn Victor\.config\python\network\jitter.py" $hostname
}

# ----------------------------
# Path
# ----------------------------

function go {
    param([string]$name)

    if ([string]::IsNullOrWhiteSpace($name)) {
        python "C:\Users\Khorn Victor\.config\python\path\go.py"
        return
    }

    $path = python "C:\Users\Khorn Victor\.config\python\path\go.py" $name
    $path = ($path | Select-Object -First 1).Trim()

    if ($LASTEXITCODE -eq 0 -and $path -and (Test-Path -LiteralPath $path)) {
        Set-Location -LiteralPath $path
    }
    else {
        Write-Host "❌ Invalid path name"
    }
}

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

function push {
    param(
        [Parameter(Mandatory = $false)]
        [string]$message
    )

    if ($message -eq "") {
        $message = "Quick commit!!!"
    }

    git add .
    git commit -m "$message"
    git push
}

# ----------------------------
# References
# ----------------------------

function react-help{
    cat "D:\Rubber Duck\Remember\React_Functions_Reference.md"
}

function activate-venv {
    $activateScript = "C:\Users\Khorn Victor\.config\python\.venv\Scripts\Activate.ps1"

    if (Test-Path $activateScript) {
        . $activateScript
        Write-Host "✓ Activated virtual environment at: ./config/python/.venv" -ForegroundColor Green
    } else {
        Write-Error "❌ Activate script not found at: $activateScript"
    }
}

# ----------------------------
# PHP 
# ----------------------------

function init_php($name) {
    mkdir $name
    cd $name

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

    clear

    Write-Host "✅ PHP project '$name' created successfully!"
}


# ----------------------------
# matrix
# ----------------------------

function matrix {
    set-Location "C:\Users\Khorn Victor\.config\matrix-rain"
    clear
    cargo run --release -- --mode abc123
}

# ----------------------------
# End of Profile
# ----------------------------