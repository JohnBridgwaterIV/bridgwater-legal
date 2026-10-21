# Connect or reconnect QuickBooks

**Daily Deposit Automation — private administrator connection**

Daily Deposit Automation is an internal tool for Bridgwater Automotive LLC. Only an authorized QuickBooks company administrator should establish or renew its connection.

## Current availability

A production-capable desktop runner is available for administrator-managed setup. Production processing requires a verified QuickBooks connection, secure credential storage, and access to the source payout reports. Opening this page does not connect a company or start deposit processing.

## Administrator connection steps

1. Review the [End User License Agreement](../eula/) and [Privacy Policy](../privacy/).
2. Contact [john@bridgwaterauto.com](mailto:john@bridgwaterauto.com) to confirm that the production application and desktop connection setup are ready.
3. Open [Intuit's OAuth 2.0 Playground](https://developer.intuit.com/app/developer/playground). Sign in directly with Intuit and use the Daily Deposit Automation application configured for the intended environment.
4. Follow the administrator-managed authorization process. Review the requested accounting access and confirm the correct QuickBooks company before granting access.
5. Return to the desktop application for a connection check. Initial production verification must confirm the intended company before deposit processing is enabled.

Do not enter QuickBooks passwords, application secrets, or authorization tokens on this website. Connection authorization takes place with Intuit; the public website does not receive or store authorization results.

## Reconnect

If access was revoked or the connection expired, contact the administrator and repeat the appropriate Intuit authorization process. Reconnecting does not reverse earlier accounting records or require previously posted deposits to be posted again.

For removal of access, see [Disconnect instructions](../disconnected/). For help, email [john@bridgwaterauto.com](mailto:john@bridgwaterauto.com).
