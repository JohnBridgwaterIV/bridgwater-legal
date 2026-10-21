# Bridgwater Automotive Legal

Public legal pages for Daily Deposit Automation. Operator: Bridgwater Automotive LLC. Contact: john@bridgwaterauto.com.

Assigned checkout: C:\BA\Repos\Bridgwater-Legal
Origin: https://github.com/BridgwaterAutomotive/bridgwater-legal.git
Public site: https://legal.bridgwaterauto.com/

Edit content/, run ./Build.ps1, review public/, commit and push main immediately, then run ./Deploy.ps1. The deployer requires a clean main checkout equal to freshly fetched origin/main and checks the expected origin. GitHub Actions independently checks the requested commit before publishing.

Do not put credentials, accounting records, tokens, or operational data in this public repository. The release manifest at /release.json identifies the version, Git commit, Pacific publication time, and SHA-256 hashes of every deployed file except the manifest itself. Verify installed hashes after deployment.

The site uses no application JavaScript, analytics, forms, or third-party assets. GitHub may maintain infrastructure logs under its own privacy policy. This static website replaces no Drive runtime. QuickBooks production authorization is separate from publication of these pages.
