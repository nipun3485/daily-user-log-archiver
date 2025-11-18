# Daily User Log Archiver

This project is a shell script that:
- Logs the current user
- Logs the current date and time
- Logs all running processes
- Logs disk usage
- Automatically deletes log files older than 7 days

The script can also be scheduled to run daily using **cron**.

---

## Files

- `daily_log.sh` → main shell script
- `screenshots/` → contains screenshots of script output

---

## Script Explanation (Line by Line)

```bash
#!/bin/bash
