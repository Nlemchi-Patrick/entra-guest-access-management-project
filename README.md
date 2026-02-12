External (Guest) User Access Management
Microsoft Entra ID (Azure AD) B2B Identity Governance Project
Overview

This project demonstrates secure onboarding, authorization, and lifecycle governance of external (guest) users using Microsoft Entra ID (Free).

It implements a least-privilege access model with directory restrictions and operational controls to mitigate common vendor and contractor access risks.

The design follows enterprise IAM and Zero Trust principles and mirrors real-world production practices used by consulting firms and large organizations.

Objectives

Enable secure B2B collaboration

Enforce least privilege access

Prevent directory reconnaissance by guests

Govern guest lifecycle (invite → review → disable → remove)

Demonstrate operational automation with PowerShell

Architecture

Guest lifecycle:

Invite → Add to Group → Access Granted → Periodic Review → Disable → Delete


See: /lifecycle-flowchart.png

Security Design Principles
Least Privilege

Guests only receive access required for their specific task or application.

Identity Boundary Protection

Guest directory visibility restricted to prevent tenant enumeration.

Lifecycle Governance

Inactive accounts are reviewed and disabled automatically.

Zero Trust Mindset

Every external identity is treated as untrusted until explicitly authorized.

Entra ID Free Licensing Note

Microsoft Entra ID Free does not support group assignment to Enterprise Applications.

Direct user assignment is used for demonstration purposes.

Security groups are created for design clarity and RBAC planning.

In production environments (P1/P2), groups would be used to enforce least-privilege access at scale.

Implementation Steps
1. Configure External Collaboration Settings

Path:
Entra ID → External Identities → External collaboration settings

Configured:

Invitations restricted to admins/guest inviters

Guest directory visibility = most restrictive

Optional domain restrictions enabled

2. Create Security Groups

Examples:

Guest-App-Access

Guest-SharePoint-Access

Guest-Temporary-Contractors

Purpose:
Segment access and enforce least-privilege design.

3. Invite Guest Users

Path:
Users → New user → Invite external user

Guests are added to the required security groups for governance tracking.

4. Assign Resource Access

Access granted to users for:

Enterprise Applications

SharePoint sites

SaaS integrations

Direct assignments are used due to Free-tier limitations.

5. Lifecycle Management

Periodic review process:

Identify inactive accounts

Disable unused access

Remove completed vendors

Automation provided via PowerShell cleanup script.

Project Structure
entra-guest-access-management/
│
├── README.md
├── guest-access-policy.md
├── risk-mitigation.md
├── lifecycle-flowchart.png
├── scripts/
│   └── guest-cleanup.ps1
└── screenshots/

Documentation
guest-access-policy.md

Defines:

Invitation rules

Authorization standards

Lifecycle controls

Ownership

risk-mitigation.md

Identifies:

Key risks

Implemented controls

Security outcomes

licensing-considerations.md

Explains Free-tier limitations and P1/P2 architecture adjustments.

Automation
guest-cleanup.ps1

Purpose: Disable guest accounts inactive for 90+ days.

Example:

Connect-MgGraph -Scopes "User.ReadWrite.All"
Get-MgUser -Filter "userType eq 'Guest'"


Enforces continuous governance and reduces stale-account risk.

Evidence (Screenshots)

The /screenshots folder contains:

External collaboration settings

Security groups created

Guest invitation

Group membership

App assignment

Guest directory listing

These validate the configuration steps and operational controls.

Risks Addressed
Risk	Mitigation
Unauthorized vendor access	Admin-only invitations
Excess permissions	RBAC planning & tracking
Directory reconnaissance	Restricted visibility
Stale accounts	Reviews + automation
Data leakage	Least-privilege access model
Skills Demonstrated

Microsoft Entra ID administration

B2B guest management

Identity governance

Zero Trust architecture

PowerShell automation

Security documentation

Employer Relevance

This project mirrors real enterprise IAM responsibilities:

Vendor onboarding

Contractor access control

Third-party risk reduction

Identity boundary enforcement

Compliance readiness

Commonly required by consulting firms, financial institutions, healthcare organizations, large enterprises, and SaaS/technology companies.

How to Run Locally
git clone <repo>
cd entra-guest-access-management


Review:

Documentation

Scripts

Screenshots

Diagrams

Author

Patrick Nlemchi
Identity & Access Management | Cloud Security | Microsoft Entra ID