# PowerShell Scripts
By Helen Najar, Lionheart | Ballad by Dragons

The **ActiveDirectory-Automation** repository contains modular PowerShell scripts for managing on-premises **Active Directory**. These tools help automate user creation, streamline account provisioning, and—soon—support de-provisioning for clean, auditable offboarding.

This repo focuses on:

* 🔄 **Automation** to eliminate repetitive tasks
* 🔐 **Security-first scripting** practices
* ♻️ **Modular, reusable design** for scalability

---

## 📁 Directory Structure

```
ActiveDirectory-Automation/
├── AD-User-Creation/
│   ├── AD-Creation-Basic/
│   │   ├── ad-creation-basic.ps1
│   │   ├── README.md
│   ├── AD-Creation-Detailed/
│   │   ├── ad-creation-detailed.ps1
│   │   ├── README.md
├── AD-User-Termination/
│   ├── (Coming Soon)
│   ├── README.md
└── README.md
```

---

## 🧭 Directory Breakdown

### **1️⃣ AD-User-Creation**

Scripts for provisioning user accounts in Active Directory.

| **File/Folder**            | **Purpose**                                                      |
| -------------------------- | ---------------------------------------------------------------- |
| `AD-Creation-Basic.ps1`    | Streamlined account creation with basic attributes.              |
| `AD-Creation-Detailed.ps1` | Full-featured account creation script with validation & logging. |
| `README.md`                | Instructions and examples for usage.                             |

---

### **2️⃣ AD-User-Termination**

A placeholder for **future scripts** that will automate the termination and cleanup of AD user accounts.

> ⚠️ *Note: Hybrid termination scripts have been moved to the [`Exchange-Hybrid-Tools`](https://github.com/balladbydragons/Exchange-Hybrid-Tools) repository due to their dependency on Exchange Online.*
> An on-prem–focused termination script is planned and will be added soon.

---

## 🛠️ How to Use

1. **Clone the repository**

   ```bash
   git clone https://github.com/balladbydragons/ActiveDirectory-Automation.git
   cd ActiveDirectory-Automation
   ```

2. **Navigate to a specific script folder**
   Each folder includes a `README.md` for instructions.

3. **Run the script**
   Example:

   ```powershell
   ./AD-User-Creation/AD-Creation-Basic/ad-creation-basic.ps1
   ```

---

## ✅ Security Best Practices

* Use `-WhatIf` to simulate script actions before applying.
* Always test scripts in a dev environment.
* Never hardcode credentials—prompt securely instead.
* Review script logs where applicable.

---

## 🧩 Contributing

You're welcome to contribute! If you have improvements or want to add scripts:

* Follow the folder structure
* Comment your logic clearly
* Update the relevant `README.md`

---

## 📦 Requirements

* PowerShell 7.x or Windows PowerShell 5.1+
* ActiveDirectory PowerShell Module

Install necessary module:

```powershell
Install-Module -Name ActiveDirectory
```

---

## 📜 License

This project is licensed under the [MIT License](https://github.com/balladbydragons/ActiveDirectory-Automation/blob/main/LICENSE.md).

Created and maintained by Helen Najar | Lionheart | [BalladByDragons.org](https://www.balladbydragons.org)

---

## 📬 Contact

For inquiries, feedback, or collaboration opportunities:

* **LinkedIn**: [Helen Najar](https://www.linkedin.com/in/helen-najar)
* **Website**: [BalladByDragons.org/contact](https://www.balladbydragons.org/contact)
* **GitHub**: [@balladbydragons](https://github.com/balladbydragons)