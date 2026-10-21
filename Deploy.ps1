$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if ((git remote get-url origin).Trim() -ne 'https://github.com/BridgwaterAutomotive/bridgwater-legal.git') { throw 'Unexpected origin.' }
if ((git branch --show-current).Trim() -ne 'main') { throw 'Deploy from main only.' }
if (git status --porcelain) { throw 'Checkout must be clean.' }
git fetch origin main
if ($LASTEXITCODE) { throw 'Fetch failed.' }
$headSha = (git rev-parse HEAD).Trim()
if ($headSha -ne (git rev-parse origin/main).Trim()) { throw 'HEAD differs from freshly fetched origin/main.' }
gh workflow run pages.yml --repo BridgwaterAutomotive/bridgwater-legal --ref main -f "expected_sha=$headSha"
if ($LASTEXITCODE) { throw 'Deployment dispatch failed.' }
Write-Host "Requested website version $((Get-Content VERSION).Trim()) at commit $headSha."
