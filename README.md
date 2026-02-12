External (Guest) User Access Management
Microsoft Entra ID (Azure AD) – B2B Identity Governance Project
Overview

This project demonstrates a secure, enterprise-style approach to managing external (guest) users in Microsoft Entra ID using the Free tier.

It implements controlled onboarding, least-privilege authorization, and lifecycle governance for vendors and contractors — reducing identity risk while maintaining operational efficiency.

The solution models real-world IAM practices used in consulting and large enterprises.

Key Capabilities

B2B guest invitations

RBAC-based access using security groups

Enterprise application authorization

Directory visibility restrictions

Guest lifecycle governance

Automated stale account cleanup (PowerShell)

Risk and control documentation

Architecture Model
Guest User
   ↓
Security Group (RBAC)
   ↓
Enterprise Application / Resource Access

Design Benefits

Centralized authorization

Scalable access management

Easier audits and reviews

Reduced manual assignments

Supports least privilege and Zero Trust

Lifecycle diagram:
/diagrams/guest-lifecycle-flowchart.png

Licensing Note (Important)

Microsoft Entra ID Free does not allow group assignment to Enterprise Applications.

Because of this:

Direct user assignments are used for demonstration

Security groups are still created to model proper RBAC design

In production (P1/P2), groups would be assigned directly

This preserves correct architecture while remaining Free-tier compatible.

Implementation Walkthrough
1. External Collaboration Security

Configured:

Admin-only guest invitations

Restricted guest directory visibility

Optional domain restrictions

2. Security Groups (RBAC Segmentation)

Created:

Guest-App-Access

Guest-SharePoint-Access

Guest-Temporary-Contractors

Purpose:

Enforce least privilege

Separate access by business function

Simplify audits and removal

3. Guest Onboarding Process

Invite external user

Assign to appropriate security group

Grant application/resource access

Document ownership

4. Lifecycle Governance

Periodic access reviews

Remove inactive users

Disable expired contractors

Maintain minimal attack surface

5. Automation

PowerShell automation provided:

scripts/guest-cleanup.ps1

Functions:

Detects inactive guest accounts

Disables accounts after 90+ days

Reduces stale identity risk

Project Structure
entra-guest-access-management/
│
├── README.md                    → Project overview
├── docs/
│   ├── guest-access-policy.md   → Governance standards
│   ├── risk-mitigation.md       → Risks and controls
│   └── licensing-considerations.md
│
├── diagrams/
│   └── guest-lifecycle-flowchart.png
│
├── scripts/
│   └── guest-cleanup.ps1
│
└── screenshots/
    → Portal configuration evidence

Documentation
guest-access-policy.md

Defines:

Invitation standards

Access assignment model

Ownership and governance

Lifecycle procedures

risk-mitigation.md

Maps:

Threats

Controls

Security outcomes

licensing-considerations.md

Explains:

Free vs Premium differences

Architecture trade-offs

Evidence (Screenshots)

The /screenshots folder includes:

External collaboration settings

Security groups

Guest invitations

Group memberships

App assignments

Guest review configuration

These provide proof of implementation.

Risks Addressed
Risk	Mitigation
Unauthorized vendor access	Admin-controlled invitations
Excess privileges	Group-based RBAC
Directory reconnaissance	Restricted visibility
Stale accounts	Automated cleanup
Manual errors	Centralized authorization
Skills Demonstrated

Microsoft Entra ID administration

B2B guest identity management

RBAC design

IAM governance

Zero Trust principles

PowerShell automation

Technical documentation

Business Relevance

This solution reflects responsibilities common in:

Consulting firms

Large enterprises

Financial services

Healthcare

SaaS/technology companies

It demonstrates practical identity boundary management and third-party risk reduction.

Getting Started
git clone https://github.com/<username>/entra-guest-access-management-project.git
cd entra-guest-access-management-project


Review:

documentation

diagrams

scripts

screenshots

Author

Patrick Nlemchi
Identity & Access Management | Cloud Security | Microsoft Entra ID