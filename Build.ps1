$ErrorActionPreference = 'Stop'
$publicPath = Join-Path $PSScriptRoot 'public'
function Write-Page($relativePath,$title,$body) {
 $destination = Join-Path $publicPath $relativePath
 New-Item -ItemType Directory -Path (Split-Path $destination) -Force | Out-Null
 $prefix = '../' * ($relativePath.Split('/').Count - 1)
 $template = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'template.html') -Raw
 $html = $template.Replace('{{TITLE}}',[Net.WebUtility]::HtmlEncode($title)).Replace('{{BODY}}',$body).Replace('{{ROOT}}',$prefix).Replace('{{VERSION}}',(Get-Content -LiteralPath (Join-Path $PSScriptRoot 'VERSION')).Trim())
 [IO.File]::WriteAllText($destination,$html,[Text.UTF8Encoding]::new($false))
}
foreach ($entry in @(@('eula','End User License Agreement'),@('privacy','Privacy Policy'),@('disconnected','Disconnect instructions'),@('connect','Connect or reconnect QuickBooks'),@('app','Daily Deposit Automation'))) {
 $body = (ConvertFrom-Markdown -LiteralPath (Join-Path $PSScriptRoot "content/$($entry[0]).md")).Html
 $page = if($entry[0] -eq 'app'){'daily-deposit-automation/index.html'}else{"daily-deposit-automation/$($entry[0])/index.html"}
 Write-Page $page $entry[1] $body
}
Write-Page 'index.html' 'Application legal information' '<p class="eyebrow">Bridgwater Automotive LLC</p><h1>Application legal information</h1><p>Terms, privacy information, and support for our internal business applications.</p><div class="cards"><a class="card" href="daily-deposit-automation/">Daily Deposit Automation</a><a class="card" href="daily-deposit-automation/eula/">End User License Agreement</a><a class="card" href="daily-deposit-automation/privacy/">Privacy Policy</a></div><p>The legal pages are public. Access to the application and accounting records is restricted to authorized personnel.</p>'
Write-Page '404.html' 'Page not found' '<h1>Page not found</h1><p>The page may have moved. <a href="/">Return to legal information.</a></p>'
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'style.css') -Destination (Join-Path $publicPath 'style.css')
[IO.File]::WriteAllText((Join-Path $publicPath '.nojekyll'),'')
[IO.File]::WriteAllText((Join-Path $publicPath 'CNAME'),"legal.bridgwaterauto.com`n")
Write-Host 'Built legal website.'
