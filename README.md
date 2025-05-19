# PowerShell Scripts  
By Helen Najar, Lionheart | Ballad by Dragons

The **ActiveDirectory-Automation** repository contains modular PowerShell scripts for managing on-premises **Active Directory**. These tools help automate user provisioning, streamline account creation, and enable secure, auditable **account termination**.

This repo focuses on:

* 🔄 **Automation** to eliminate repetitive tasks  
* 🔐 **Security-first scripting** practices  
* ♻️ **Modular, reusable design** for scalability  

## 📁 Directory Structure

```
ActiveDirectory-Automation/
├── AD-User-Creation/
│   ├── AD-Creation-Basic/
│   │   ├── AD-Creation-Basic.ps1
│   │   ├── README.md
│   ├── AD-Creation-Detailed/
│   │   ├── AD-Creation-Detailed.ps1
│   │   ├── README.md
├── AD-Termination-Basic/
│   ├── AD-Termination-Basic.ps1
│   ├── README.md
├── .gitignore
├── LICENSE
└── README.md
````

## 🧭 Directory Breakdown

### **1️⃣ AD-User-Creation**

Scripts for provisioning user accounts in Active Directory.

| **File/Folder**            | **Purpose**                                                      |
| -------------------------- | ---------------------------------------------------------------- |
| `AD-Creation-Basic.ps1`    | Streamlined account creation with basic attributes.              |
| `AD-Creation-Detailed.ps1` | Full-featured account creation with validation & logging.        |
| `README.md`                | Instructions and examples for usage.                             |

---

### **2️⃣ AD-Termination-Basic**

A clean, on-premises–focused termination script that handles:

- Account lookup with input validation  
- Description tagging with ticket & timestamp  
- Group membership removal  
- Primary group reset  
- Secure password reset  
- OU relocation to disabled container  
- Built-in prompts for audit screenshots

This scroll is ideal for non-hybrid environments or where mailbox offboarding is managed elsewhere.

> 🔁 Hybrid termination scripts are housed in the [`Exchange-Hybrid-Tools`](https://github.com/balladbydragons/Exchange-Hybrid-Tools) repository.

## 🛠️ How to Use

1. **Clone the repository**

   ```bash
   git clone https://github.com/balladbydragons/ActiveDirectory-Automation.git
   cd ActiveDirectory-Automation
   ```

2. **Navigate to a specific script folder**
   Each folder includes a `README.md` with usage steps.

3. **Run the script**
   ```powershell
   ./AD-Termination-Basic/AD-Termination-Basic.ps1
   ```
## Security Best Practices

* Use `-WhatIf` to simulate actions when possible
* Test in a dev/staging environment before prod use
* Never hardcode credentials—prompt securely instead
* Follow organizational audit/compliance policies

## Contributing

Want to contribute a scroll to the archive?

* Match the existing folder structure
* Keep logic modular and well-commented
* Update or include `README.md` with usage examples

## Requirements

* PowerShell 7.x or Windows PowerShell 5.1+
* ActiveDirectory PowerShell Module

Install module:

```powershell
Install-Module -Name ActiveDirectory
```
## 📜 License

Licensed under the [MIT License](https://github.com/balladbydragons/ActiveDirectory-Automation/blob/main/LICENSE.md).

Created and maintained by Helen Najar | Lionheart | [BalladByDragons.org](https://www.balladbydragons.org)

## 📬 Contact
For questions, requests, or collaboration:

* **LinkedIn**: [Helen Najar](https://www.linkedin.com/in/helen-najar)
* **Website**: [balladbydragons.org/contact](https://www.balladbydragons.org/contact)
* **GitHub**: [@balladbydragons](https://github.com/balladbydragons)
