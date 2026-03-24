🧰 Shell Backup Project (GUI + Automation)

This project is a shell-based backup system with a simple GUI using Zenity and support for automation via cron.

It helps you create, manage, and restore backups efficiently with logging and retention policies.

---

🚀 Features

- 📦 Automatic backup in .tar.gz format
- 🕒 Backups named with date & time
- 🗂️ Keeps only latest 5 backups
- 📝 Maintains only 15 log entries
- 🧹 Auto-cleans old files ("-mtime +30")
- 🖥️ GUI using Zenity
- ⏰ Supports automation using crontab

---

📂 Project Structure

auto.sh             # Used for cron automation (no GUI)
script.sh           # Main script with Zenity GUI
backup_logs.txt     # Stores logs of operations

---

🖥️ Zenity Menu Options

- Start Backup
- Restore Backup
- View Logs
- Schedule Backup
- Exit
  
---

⚙️ Setup Instructions

1. Create required folders:

mkdir -p backup_project/source_folder
mkdir -p backup_project/backup_storage

👉 Or edit paths in scripts as per your system.

---

▶️ Run the Project (GUI)

chmod +x script.sh
./script.sh

---

⏰ Enable Automation (Cron)

⚠️ Zenity GUI does NOT work with cron

Use "auto.sh" for automation:

crontab -e

Add:

0 2 * * * /full/path/to/auto.sh

👉 This runs backup daily at 2 AM

---

🧠 How It Works

- Creates compressed backups using "tar"
- Stores backups with timestamp
- Deletes old backups (keeps only 5)
- Removes old logs (keeps only 15)
- Cleans files older than 30 days

---

💡 Notes

- Ensure Zenity is installed
- Always use absolute path in crontab
- Make scripts executable

---

🎯 Purpose

- Learn real-world shell scripting
- Understand backup automation
- Combine CLI + GUI + scheduling

---

🔥 A practical DevOps-style mini project using Shell + Linux + Automation
