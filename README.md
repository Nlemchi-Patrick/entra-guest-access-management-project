# External (Guest) User Access Management
## Microsoft Entra ID (Azure AD) – B2B Identity Governance Project

---

## Overview

This project demonstrates secure onboarding, authorization, and lifecycle management of external (guest) users using Microsoft Entra ID.

It simulates how enterprises control vendor and contractor access using:

- Role-Based Access Control (RBAC)
- Security groups
- Directory visibility restrictions
- Identity lifecycle governance
- Automated cleanup scripts

The design follows Zero Trust and least-privilege principles commonly implemented in consulting and enterprise IAM environments.

---

## Objectives

- Securely invite external users (B2B)
- Segment access using security groups
- Restrict guest directory visibility
- Prevent stale/unused accounts
- Automate cleanup and governance
- Document risks and mitigations
- Demonstrate production-ready IAM architecture

---

## Architecture Design (Target / Production Model)

Guest User
↓
Security Group (RBAC)
↓
Enterprise Application Access

This model ensures:

- Centralized authorization
- Scalable management
- Automatic inheritance
- Easier auditing

See:

/diagrams/guest-lifecycle-flowchart.png

---

## Entra ID Free Licensing Consideration

Microsoft Entra ID Free **does not support assigning groups to Enterprise Applications**.

Because of this limitation:

- Direct user assignment is used for demonstration
- Security groups are still created to show proper RBAC design
- In production (P1/P2), groups would be assigned directly to applications

This mirrors real-world architecture while remaining compatible with the Free tier.

---

## Implementation Summary

### External Collaboration Security
Configured:
- Admin-only invitations
- Restricted directory visibility
- Optional domain allow-listing

### Security Groups (RBAC Model)
Created:
- Guest-App-Access
- Guest-SharePoint-Access
- Guest-Temporary-Contractors

Purpose:
Segment least-privilege access.

### Guest Onboarding
- Invite external user
- Add to appropriate security group
- Grant required application access

### Lifecycle Governance
- Periodic guest review
- Disable inactive accounts
- Remove expired vendors

### Automation
PowerShell script provided to disable inactive guest accounts automatically.

---

## Project Structure

guest-access-project/
│
├── README.md
├── guest-access-policy.md
├── risk-mitigation.md
├── lifecycle-flowchart.png
├── scripts/
│   └── guest-cleanup.ps1
└── screenshots/

---

## Documentation

### guest-access-policy.md
Defines:
- Invitation standards
- Access model
- Governance rules
- Ownership

### risk-mitigation.md
Identifies:
- Threats
- Controls
- Security outcomes

### licensing-considerations.md
Explains:
- Free vs Premium capabilities
- Architectural adjustments

---

## Automation

### guest-cleanup.ps1

Disables guest accounts inactive for 90+ days.

Example:

```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All"


Helps reduce:

Stale accounts

Insider risk

Unauthorized access

Evidence (Screenshots)

Includes:

External collaboration configuration

Security groups created

Guest invitation

Group membership

App assignment

Guest review process

Risks Addressed
Risk	Mitigation
Unauthorized vendor access	Admin-controlled invites
Excess privilege	Group segmentation
Directory reconnaissance	Restricted visibility
Stale accounts	Cleanup automation
Manual errors	Centralized RBAC
Skills Demonstrated

Microsoft Entra ID administration

B2B guest identity management

RBAC design

IAM governance

Zero Trust security principles

PowerShell automation

Technical documentation

Employer Relevance

This project reflects real IAM responsibilities in:

Consulting firms

Financial services

Healthcare

Large enterprises

SaaS/technology organizations

It demonstrates practical identity boundary management and third-party risk reduction.

How to Use
git clone <repo>
cd entra-guest-access-management


Review:

documentation

scripts

screenshots

diagrams

Author

Patrick Nlemchi
Identity & Access Management | Cloud Security | Microsoft Entra ID