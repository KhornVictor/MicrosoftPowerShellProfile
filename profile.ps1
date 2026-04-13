Invoke-Expression (&starship init powershell)

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
    		fastfetch -c "C:/Users/Khorn Victor/.config/fastfetch/config.jsonc"
	}

}

profile

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

    if (-not $query) {=
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
        python "C:\Users\Khorn Victor\.config\python\go.py"
        return
    }

    $path = python "C:\Users\Khorn Victor\.config\python\go.py" $name
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
        [string]$url
    )

    git init
    git add .
    git commit -m "first commit"
    git branch -M main
    git remote add origin $url
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
    $venvPath = "C:\Users\Khorn Victor\ChatGPT\.venv"
    $activateScript = Join-Path $venvPath "Scripts\Activate.ps1"

    if (Test-Path $activateScript) {
        . $activateScript
        Write-Host "✓ Activated virtual environment at: $venvPath" -ForegroundColor Green
    } else {
        Write-Error "❌ Activate script not found at: $activateScript"
    }
}

# ----------------------------
# End of Profile
# ----------------------------