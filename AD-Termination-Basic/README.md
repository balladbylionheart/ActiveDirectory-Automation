# AD Termination – Basic Edition

By Helen Najar, Lionheart | Ballad by Dragons

## **Overview**

This PowerShell script simplifies the **termination process for Active Directory accounts** in on-prem environments.
It excludes hybrid or Exchange Online operations, focusing purely on AD account cleanup with proper documentation.

Use this for **basic, secure user deactivation** when mailbox handling is not required.

## **Key Functions**

* **User Validation**: Prompts for a username and confirms existence in Active Directory.
* **Secure Password Reset**: Resets the user’s password to a randomly generated secure value.
* **Group Cleanup**: Retrieves and removes the user from all AD groups (except primary).
* **Description Update**: Appends the termination date and ticket number to the AD description field.
* **Account Disablement**: Disables the AD account.
* **OU Relocation**: Moves the account to a designated "Disabled" Organizational Unit.

## ⚠️ Customization Required

Before running the script, update these to match your environment:

* **Disabled OU Path**
  Replace the path below with your real OU target:

  ```powershell
  'OU=Disabled,DC=yourdomain,DC=com'
  ```

* **Primary Group (if different)**
  The script assumes "Domain Users" is the primary group. Adjust if needed.


## **Prerequisites**

* Run script as **Domain Admin**
* PowerShell 5.1+
* Active Directory module loaded

  ```powershell
  Import-Module ActiveDirectory
  ```

## **Usage Instructions**

1. Open **PowerShell as Administrator**

2. Navigate to the script folder:

   ```powershell
   cd C:\Scripts\AD-Termination-Basic
   ```

3. Run the script:

   ```powershell
   .\ad-termination-basic.ps1
   ```

4. Follow prompts:

   * Enter the username (LAN ID)
   * Provide a valid ticket number (e.g., `REQ1234567`)
   * Review the memberOf list (displayed for confirmation)
   * The script will execute all actions and prompt you to log the result

## **Sample Log Output**

```
Gathering MemberOf...
- FinanceDept
- VPNUsers

Setting New Password...
Group Memberships Removed - COMPLETED
Description Updated: Disabled on 05/22/2025 per REQ1234567
Account Disabled - COMPLETED
Moved to OU: Disabled Accounts
```


## 📜 License

This project is licensed under the [MIT License](https://github.com/balladbydragons/ActiveDirectory-Automation/blob/main/LICENSE.md).

Created and maintained by Helen Najar | Lionheart | [BalladByDragons.org](https://www.balladbydragons.org)

## **Contact**

For questions, enhancements, or feedback:
📬 [Main README](https://github.com/balladbydragons/ActiveDirectory-Automation/blob/main/README.md)